import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:extended_image/extended_image.dart';
import 'package:mekuru/core/data/sources/provider_registry.dart';
import 'package:mekuru/core/data/sources/i_comic_provider.dart';
import 'package:mekuru/core/widgets/provider_image_provider.dart';

class ComicImage extends ConsumerWidget {
  final String imageUrl;
  final String? providerId;
  final BoxFit fit;
  final double? width;
  final double? height;
  final Widget? Function(ExtendedImageState)? loadStateChanged;

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
    IComicProvider? provider;
    
    if (providerId != null) {
      try {
        final registry = ref.watch(providerRegistryProvider);
        provider = registry.getProvider(providerId!);
      } catch (e) {
        // Fallback
      }
    }

    if (provider != null) {
      return ExtendedImage(
        image: ProviderImageProvider(imageUrl, provider),
        width: width,
        height: height,
        fit: fit,
        clearMemoryCacheIfFailed: true,
        loadStateChanged: loadStateChanged ?? _defaultLoadStateChanged,
      );
    }

    // Fallback if provider is missing
    return ExtendedImage.network(
      imageUrl,
      width: width,
      height: height,
      fit: fit,
      cache: true,
      clearMemoryCacheIfFailed: true,
      loadStateChanged: loadStateChanged ?? _defaultLoadStateChanged,
    );
  }

  Widget? _defaultLoadStateChanged(ExtendedImageState state) {
    switch (state.extendedImageLoadState) {
      case LoadState.loading:
        return const Center(
          child: CircularProgressIndicator(strokeWidth: 2),
        );
      case LoadState.completed:
        return null; // Return null to display the image as usual
      case LoadState.failed:
        debugPrint('ComicImage Failed to load: $imageUrl');
        return const Center(
          child: Icon(Icons.broken_image_rounded, color: Colors.grey, size: 32),
        );
    }
  }
}
