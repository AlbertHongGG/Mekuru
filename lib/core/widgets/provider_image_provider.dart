import 'dart:io';
import 'dart:ui' as ui;
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';
import 'package:crypto/crypto.dart';
import 'dart:convert';
import 'package:mekuru/core/data/sources/i_comic_provider.dart';

class ProviderImageProvider extends ImageProvider<ProviderImageProvider> {
  final String url;
  final IComicProvider provider;
  final bool useCache;

  const ProviderImageProvider(this.url, this.provider, {this.useCache = true});

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

    File? cacheFile;
    Uint8List? bytes;

    if (useCache) {
      try {
        final tempDir = await getTemporaryDirectory();
        final cacheDir = Directory('${tempDir.path}/mekuru_image_cache_v3');
        if (!await cacheDir.exists()) {
          await cacheDir.create(recursive: true);
        }

        final hash = md5.convert(utf8.encode(key.url)).toString();
        cacheFile = File('${cacheDir.path}/$hash');

        if (await cacheFile.exists()) {
          bytes = await cacheFile.readAsBytes();
          // Extremely basic check for corrupt/empty files
          if (bytes.length < 100) {
            bytes = null;
          }
        }
        
        if (bytes == null) {
          bytes = await key.provider.fetchImageBytes(key.url);
          await cacheFile.writeAsBytes(bytes);
        }
      } catch (e) {
        // Cache read/write failed, fetch directly
        bytes = await key.provider.fetchImageBytes(key.url);
      }
    } else {
      bytes = await key.provider.fetchImageBytes(key.url);
    }

    try {
      final buffer = await ui.ImmutableBuffer.fromUint8List(bytes);
      return await decode(buffer);
    } catch (e) {
      // If decoding fails, the cache is corrupted. Delete it.
      if (cacheFile != null && await cacheFile.exists()) {
        try {
          await cacheFile.delete();
        } catch (_) {}
      }
      // Re-fetch once from network as fallback
      bytes = await key.provider.fetchImageBytes(key.url);
      final buffer = await ui.ImmutableBuffer.fromUint8List(bytes);
      return await decode(buffer);
    }
  }

  @override
  bool operator ==(Object other) {
    if (other.runtimeType != runtimeType) return false;
    return other is ProviderImageProvider && other.url == url && other.provider.providerId == provider.providerId;
  }

  @override
  int get hashCode => Object.hash(url, provider.providerId);
}
