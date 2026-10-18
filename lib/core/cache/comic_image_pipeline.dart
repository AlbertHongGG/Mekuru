import 'dart:async';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mekuru/core/cache/comic_disk_cache_manager.dart';
import 'package:mekuru/core/cache/i_comic_cache_manager.dart';
import 'package:mekuru/core/widgets/provider_image_provider.dart';
import 'package:mekuru/features/comic/data/sources/i_comic_provider.dart';

/// The authoritative pipeline for loading, deduplicating, caching, and priming comic images.
///
/// Features:
/// 1. Shared In-Flight Futures: Zero duplicate network requests across UI and preloader.
/// 2. Atomic disk cache writes.
/// 3. Active Memory Priming Buffer: Keeps upcoming decoded images pinned in memory so
///    that when they scroll into the viewport, they render in 0ms with NO placeholder flash.
class ComicImagePipeline {
  static ComicImagePipeline? _instance;

  static ComicImagePipeline get instance {
    _instance ??= ComicImagePipeline();
    return _instance!;
  }

  final IComicCacheManager cacheManager;

  /// Tracks active in-flight image downloads with cancellation shielding.
  final Map<String, _InFlightDownload> _inFlightDownloads = {};

  /// Pinned memory cache stream completers to keep the upcoming images alive in GPU memory.
  final Map<String, ImageStreamCompleterHandle> _pinnedMemoryHandles = {};
  static const int _maxPinnedHandles = 8;

  ComicImagePipeline({IComicCacheManager? cacheManager})
      : cacheManager = cacheManager ?? ComicDiskCacheManager.instance;

  String _buildKey(String providerId, String url) => '$providerId:$url';

  /// Checks if an image is already cached on disk.
  Future<bool> isCached({required String providerId, required String url}) {
    return cacheManager.isCached(providerId, url);
  }

  /// Retrieves cached bytes if available, without hitting network.
  Future<Uint8List?> getCachedBytes({required String providerId, required String url}) {
    return cacheManager.getCachedBytes(providerId, url);
  }

  /// Whether a download for this image is currently active in the pipeline.
  bool isInFlight({required String providerId, required String url}) {
    return _inFlightDownloads.containsKey(_buildKey(providerId, url));
  }

  /// Gets image bytes from cache, active in-flight request, or network.
  ///
  /// Incorporates Cancellation Shielding: Multiple subscribers (e.g., background preloader
  /// and on-screen UI widget) can listen to the same download. If the background preloader
  /// cancels its token, the underlying network request and any other subscribers (especially UI)
  /// are NOT cancelled.
  Future<Uint8List> getImageBytes({
    required IComicProvider provider,
    required String url,
    CancelToken? cancelToken,
    bool forceNetwork = false,
  }) async {
    final key = _buildKey(provider.providerId, url);

    // 1. Check disk cache first unless forced
    if (!forceNetwork) {
      final cached = await cacheManager.getCachedBytes(provider.providerId, url);
      if (cached != null && cached.length >= 100) {
        return cached;
      }
    }

    // 2. Check if a request for this image is already in-flight
    var inFlight = _inFlightDownloads[key];
    if (inFlight != null) {
      debugPrint('[ComicImagePipeline] Reusing in-flight request for $url');
      inFlight.registerSubscriber(cancelToken);
      return _awaitInFlight(inFlight, cancelToken, url);
    }

    // 3. Launch single authoritative network request with shielded internal cancel token
    final internalToken = CancelToken();
    final future = _executeFetch(
      provider: provider,
      url: url,
      cancelToken: internalToken,
    );

    inFlight = _InFlightDownload(future: future, internalCancelToken: internalToken);
    inFlight.registerSubscriber(cancelToken);
    _inFlightDownloads[key] = inFlight;

    // Remove entry once the underlying download finishes or errors
    future.whenComplete(() {
      _inFlightDownloads.remove(key);
    });

    return _awaitInFlight(inFlight, cancelToken, url);
  }

  Future<Uint8List> _awaitInFlight(
    _InFlightDownload inFlight,
    CancelToken? cancelToken,
    String url,
  ) async {
    if (cancelToken == null) {
      return await inFlight.future;
    }

    if (cancelToken.isCancelled) {
      throw DioException(
        requestOptions: RequestOptions(path: url),
        type: DioExceptionType.cancel,
        error: cancelToken.cancelError,
      );
    }

    final completer = Completer<Uint8List>();
    void onCancel() {
      if (!completer.isCompleted) {
        completer.completeError(
          DioException(
            requestOptions: RequestOptions(path: url),
            type: DioExceptionType.cancel,
            error: cancelToken.cancelError,
          ),
        );
      }
    }

    cancelToken.whenCancel.then((_) => onCancel());

    inFlight.future.then((bytes) {
      if (!completer.isCompleted) completer.complete(bytes);
    }).catchError((Object e, StackTrace st) {
      if (!completer.isCompleted) completer.completeError(e, st);
    });

    return await completer.future;
  }

  Future<Uint8List> _executeFetch({
    required IComicProvider provider,
    required String url,
    CancelToken? cancelToken,
  }) async {
    final sw = Stopwatch()..start();
    final bytes = await provider.fetchImageBytes(url, cancelToken: cancelToken);
    sw.stop();
    debugPrint('[ComicImagePipeline] Downloaded ${bytes.length} bytes in ${sw.elapsedMilliseconds}ms for $url');

    if (bytes.length >= 100) {
      try {
        await cacheManager.putBytes(provider.providerId, url, bytes);
      } catch (e) {
        debugPrint('[ComicImagePipeline] Failed to write cache for $url: $e');
      }
    }

    return bytes;
  }

  /// Purges corrupted disk cache for this image and refetches fresh bytes cleanly from the provider.
  Future<Uint8List> purgeAndRefetch({
    required IComicProvider provider,
    required String url,
  }) async {
    debugPrint('[ComicImagePipeline] Purging corrupted cache and refetching fresh bytes for $url');
    try {
      await cacheManager.remove(provider.providerId, url);
    } catch (e) {
      debugPrint('[ComicImagePipeline] Failed to remove cache for $url: $e');
    }

    return getImageBytes(
      provider: provider,
      url: url,
      forceNetwork: true,
    );
  }

  /// Preloads an image into disk cache and optionally warms Flutter's memory cache.
  Future<void> preloadImage({
    required IComicProvider provider,
    required String url,
    CancelToken? cancelToken,
    bool primeMemory = false,
  }) async {
    final bytes = await getImageBytes(
      provider: provider,
      url: url,
      cancelToken: cancelToken,
    );

    if (primeMemory && bytes.isNotEmpty) {
      primeMemoryCache(provider: provider, url: url);
    }
  }

  /// Warms Flutter's in-memory image cache and keeps a handle alive
  /// to guarantee the decoded texture is NOT evicted before the user reaches it.
  void primeMemoryCache({
    required IComicProvider provider,
    required String url,
  }) {
    final key = _buildKey(provider.providerId, url);
    if (_pinnedMemoryHandles.containsKey(key)) return;

    try {
      final imageProvider = ProviderImageProvider(url, provider, pipeline: this);
      final stream = imageProvider.resolve(ImageConfiguration.empty);

      late final ImageStreamListener listener;
      listener = ImageStreamListener(
        (image, synchronousCall) {
          try {
            if (stream.completer != null) {
              final handle = stream.completer!.keepAlive();
              _pinnedMemoryHandles[key] = handle;

              // Enforce maximum pinned handles (FIFO)
              if (_pinnedMemoryHandles.length > _maxPinnedHandles) {
                final oldestKey = _pinnedMemoryHandles.keys.first;
                final oldHandle = _pinnedMemoryHandles.remove(oldestKey);
                oldHandle?.dispose();
              }
            }
          } catch (_) {}
          stream.removeListener(listener);
        },
        onError: (dynamic exception, StackTrace? stackTrace) {
          stream.removeListener(listener);
        },
      );
      stream.addListener(listener);
    } catch (e) {
      debugPrint('[ComicImagePipeline] Memory prime error: $e');
    }
  }

  /// Releases all pinned memory handles and clears session-scoped resources.
  /// Call when navigating away from a chapter or disposing the comic viewer.
  void resetSession() {
    for (final handle in _pinnedMemoryHandles.values) {
      try {
        handle.dispose();
      } catch (_) {}
    }
    _pinnedMemoryHandles.clear();
    debugPrint('[ComicImagePipeline] Session reset: released all pinned memory handles.');
  }

  /// Clears in-flight task tracking and releases all pinned memory handles.
  void clear() {
    _inFlightDownloads.clear();
    resetSession();
  }
}

/// Helper structure managing subscribers and cancellation shielding for an in-flight download.
class _InFlightDownload {
  final Future<Uint8List> future;
  final CancelToken internalCancelToken;
  int _uncancellableSubscribers = 0;
  final Set<CancelToken> _cancellableSubscribers = {};

  _InFlightDownload({
    required this.future,
    required this.internalCancelToken,
  });

  void registerSubscriber(CancelToken? token) {
    if (token == null) {
      _uncancellableSubscribers++;
    } else {
      _cancellableSubscribers.add(token);
      token.whenCancel.then((_) => _onSubscriberCancelled(token));
    }
  }

  void _onSubscriberCancelled(CancelToken token) {
    _cancellableSubscribers.remove(token);
    // If no one is waiting anymore, cancel the underlying network task
    if (_uncancellableSubscribers == 0 && _cancellableSubscribers.isEmpty) {
      if (!internalCancelToken.isCancelled) {
        internalCancelToken.cancel('All subscribers cancelled');
      }
    }
  }
}

final comicImagePipelineProvider = Provider<ComicImagePipeline>((ref) {
  final cacheManager = ref.watch(comicCacheManagerProvider);
  return ComicImagePipeline(cacheManager: cacheManager);
});
