import 'package:extended_image/extended_image.dart';
import 'package:flutter/material.dart';
import 'package:mekuru/core/widgets/comic_image.dart';
import 'package:mekuru/features/viewer/presentation/widgets/webtoon_image_placeholder.dart';

class ViewerImageTile extends StatelessWidget {
  final Key? itemKey;
  final int index;
  final String imageUrl;
  final String providerId;
  final double screenWidth;
  final double? estimatedHeight;
  final VoidCallback onToggleUI;
  final void Function(int index, double actualHeight)? onHeightMeasured;

  const ViewerImageTile({
    super.key,
    this.itemKey,
    required this.index,
    required this.imageUrl,
    required this.providerId,
    required this.screenWidth,
    this.estimatedHeight,
    required this.onToggleUI,
    this.onHeightMeasured,
  });

  @override
  Widget build(BuildContext context) {
    final placeholderHeight = estimatedHeight ?? (screenWidth > 0 ? screenWidth * 1.5 : 600.0);

    return GestureDetector(
      key: itemKey,
      onTap: onToggleUI,
      behavior: HitTestBehavior.opaque,
      child: Container(
        width: double.infinity,
        color: Colors.transparent,
        child: ComicImage(
          imageUrl: imageUrl,
          providerId: providerId,
          fit: BoxFit.fitWidth,
          loadStateChanged: (ExtendedImageState imgState) {
            switch (imgState.extendedImageLoadState) {
              case LoadState.loading:
                return SizedBox(
                  height: placeholderHeight,
                  child: WebtoonImagePlaceholder(index: index),
                );

              case LoadState.completed:
                final imgInfo = imgState.extendedImageInfo;
                if (imgInfo != null && screenWidth > 0) {
                  final image = imgInfo.image;
                  final actualHeight = screenWidth * (image.height / image.width);
                  onHeightMeasured?.call(index, actualHeight);
                }
                // Return null to render the loaded image as usual
                return null;

              case LoadState.failed:
                return SizedBox(
                  height: placeholderHeight,
                  child: Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Icon(Icons.broken_image, color: Colors.white54, size: 48),
                        const SizedBox(height: 8),
                        TextButton(
                          onPressed: () => imgState.reLoadImage(),
                          child: const Text('點擊重新載入', style: TextStyle(color: Colors.white)),
                        ),
                      ],
                    ),
                  ),
                );
            }
          },
        ),
      ),
    );
  }
}
