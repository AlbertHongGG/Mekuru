import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:extended_image/extended_image.dart';
import 'package:mekuru/data/sources/provider_registry.dart';

class ComicImage extends ConsumerWidget {
  final String imageUrl;
  final String? providerId;
  final BoxFit fit;
  final double? width;
  final double? height;
  final Widget Function(BuildContext, ExtendedImageState)? loadStateChanged;

  const ComicImage({
    super.key,
    required this.imageUrl,
    this.providerId,
    this.fit = BoxFit.cover,
    this.width,
    this.height,
    this.loadStateChanged,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    Map<String, String>? headers;
    
    if (providerId != null) {
      try {
        final registry = ref.read(providerRegistryProvider);
        headers = registry.getProvider(providerId!).imageHeaders;
      } catch (e) {
        // Fallback to no headers if provider is missing
      }
    }

    return ExtendedImage.network(
      imageUrl,
      width: width,
      height: height,
      fit: fit,
      headers: headers,
      cache: true,
      clearMemoryCacheIfFailed: true,
      loadStateChanged: loadStateChanged,
    );
  }
}
