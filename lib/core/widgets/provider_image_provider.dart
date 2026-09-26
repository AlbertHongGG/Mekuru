import 'dart:ui' as ui;
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:mekuru/core/cache/comic_disk_cache_manager.dart';
import 'package:mekuru/core/cache/i_comic_cache_manager.dart';
import 'package:mekuru/features/comic/data/sources/i_comic_provider.dart';

/// A custom [ImageProvider] that loads image bytes from an [IComicProvider]
/// and caches them using [IComicCacheManager].
class ProviderImageProvider extends ImageProvider<ProviderImageProvider> {
  final String url;
  final IComicProvider provider;
  final bool useCache;
  final IComicCacheManager cacheManager;

  ProviderImageProvider(
    this.url,
    this.provider, {
    this.useCache = true,
    IComicCacheManager? cacheManager,
  }) : cacheManager = cacheManager ?? ComicDiskCacheManager.instance;

  @override
  Future<ProviderImageProvider> obtainKey(ImageConfiguration configuration) {
    return SynchronousFuture<ProviderImageProvider>(this);
  }

  @override
  ImageStreamCompleter loadImage(ProviderImageProvider key, ImageDecoderCallback decode) {
    return MultiFrameImageStreamCompleter(
      codec: _loadAsync(key, decode),
      scale: 1.0,
      informationCollector: () => <DiagnosticsNode>[
        DiagnosticsProperty<ImageProvider>('Image provider', this),
        DiagnosticsProperty<ProviderImageProvider>('Image key', key),
      ],
    );
  }

  Future<ui.Codec> _loadAsync(ProviderImageProvider key, ImageDecoderCallback decode) async {
    assert(key == this);

    Uint8List? bytes;

    if (useCache) {
      try {
        bytes = await cacheManager.getCachedBytes(provider.providerId, key.url);
        if (bytes == null) {
          bytes = await key.provider.fetchImageBytes(key.url);
          await cacheManager.putBytes(provider.providerId, key.url, bytes);
        }
      } catch (e) {
        // Cache read/write failed, fetch directly from network
        bytes = await key.provider.fetchImageBytes(key.url);
      }
    } else {
      bytes = await key.provider.fetchImageBytes(key.url);
    }

    try {
      final buffer = await ui.ImmutableBuffer.fromUint8List(bytes);
      return await decode(buffer);
    } catch (e) {
      // If decoding fails, the cache might be corrupt. Remove it and re-fetch once.
      if (useCache) {
        await cacheManager.remove(provider.providerId, key.url);
      }
      bytes = await key.provider.fetchImageBytes(key.url);
      final buffer = await ui.ImmutableBuffer.fromUint8List(bytes);
      return await decode(buffer);
    }
  }

  @override
  bool operator ==(Object other) {
    if (other.runtimeType != runtimeType) return false;
    return other is ProviderImageProvider &&
        other.url == url &&
        other.provider.providerId == provider.providerId;
  }

  @override
  int get hashCode => Object.hash(url, provider.providerId);

  /// Downloads the image and stores it to disk cache.
  static Future<void> preload(
    String url,
    IComicProvider provider, {
    IComicCacheManager? cacheManager,
  }) async {
    final cache = cacheManager ?? ComicDiskCacheManager.instance;
    try {
      final isCached = await cache.isCached(provider.providerId, url);
      if (isCached) return;

      final bytes = await provider.fetchImageBytes(url);
      if (bytes.length >= 100) {
        await cache.putBytes(provider.providerId, url, bytes);
      }
    } catch (e) {
      debugPrint('[ProviderImageProvider] Preload failed for $url: $e');
    }
  }
}
