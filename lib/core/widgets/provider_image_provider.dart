import 'dart:ui' as ui;
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:mekuru/core/cache/comic_image_pipeline.dart';
import 'package:mekuru/core/cache/i_comic_cache_manager.dart';
import 'package:mekuru/features/comic/data/sources/i_comic_provider.dart';

/// A custom [ImageProvider] that delegates image loading, caching,
/// and deduplication to the authoritative [ComicImagePipeline].
class ProviderImageProvider extends ImageProvider<ProviderImageProvider> {
  final String url;
  final IComicProvider provider;
  final ComicImagePipeline pipeline;

  ProviderImageProvider(
    this.url,
    this.provider, {
    bool useCache = true,
    IComicCacheManager? cacheManager,
    ComicImagePipeline? pipeline,
  }) : pipeline = pipeline ??
            (cacheManager != null
                ? ComicImagePipeline(cacheManager: cacheManager)
                : ComicImagePipeline.instance);

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

    final bytes = await pipeline.getImageBytes(
      provider: key.provider,
      url: key.url,
    );

    try {
      final buffer = await ui.ImmutableBuffer.fromUint8List(bytes);
      return await decode(buffer);
    } catch (e) {
      // If decoding fails, the cache might be corrupt. Delegate recovery cleanly to pipeline.
      final freshBytes = await pipeline.purgeAndRefetch(
        provider: key.provider,
        url: key.url,
      );
      final buffer = await ui.ImmutableBuffer.fromUint8List(freshBytes);
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

  /// Downloads the image and stores it to disk cache via [ComicImagePipeline].
  static Future<void> preload(
    String url,
    IComicProvider provider, {
    ComicImagePipeline? pipeline,
  }) async {
    final pipe = pipeline ?? ComicImagePipeline.instance;
    await pipe.preloadImage(provider: provider, url: url);
  }
}
