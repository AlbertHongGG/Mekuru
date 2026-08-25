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

    Uint8List? bytes;

    if (useCache) {
      try {
        final tempDir = await getTemporaryDirectory();
        final cacheDir = Directory('${tempDir.path}/mekuru_image_cache_v2');
        if (!await cacheDir.exists()) {
          await cacheDir.create(recursive: true);
        }

        final hash = md5.convert(utf8.encode(key.url)).toString();
        final file = File('${cacheDir.path}/$hash');

        if (await file.exists()) {
          bytes = await file.readAsBytes();
        } else {
          bytes = await key.provider.fetchImageBytes(key.url);
          await file.writeAsBytes(bytes);
        }
      } catch (e) {
        // Fallback to direct network fetch if cache logic fails
        bytes = await key.provider.fetchImageBytes(key.url);
      }
    } else {
      bytes = await key.provider.fetchImageBytes(key.url);
    }

    final buffer = await ui.ImmutableBuffer.fromUint8List(bytes);
    return decode(buffer);
  }

  @override
  bool operator ==(Object other) {
    if (other.runtimeType != runtimeType) return false;
    return other is ProviderImageProvider && other.url == url && other.provider.providerId == provider.providerId;
  }

  @override
  int get hashCode => Object.hash(url, provider.providerId);
}
