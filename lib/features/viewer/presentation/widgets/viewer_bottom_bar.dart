import 'package:flutter/material.dart';

class ViewerBottomBar extends StatelessWidget {
  final bool isVisible;
  final ValueNotifier<double> progressNotifier;
  final bool hasPages;
  final VoidCallback? onPrevChapter;
  final VoidCallback? onNextChapter;

  const ViewerBottomBar({
    super.key,
    required this.isVisible,
    required this.progressNotifier,
    required this.hasPages,
    this.onPrevChapter,
    this.onNextChapter,
  });

  @override
  Widget build(BuildContext context) {
    return AnimatedPositioned(
      duration: const Duration(milliseconds: 200),
      curve: Curves.easeInOut,
      bottom: isVisible ? 0 : -100,
      left: 0,
      right: 0,
      child: Container(
        color: Colors.black.withValues(alpha: 0.8),
        child: SafeArea(
          top: false,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                // Bottom Left: Progress Percentage
                Container(
                  constraints: const BoxConstraints(minWidth: 50),
                  child: hasPages
                      ? ValueListenableBuilder<double>(
                          valueListenable: progressNotifier,
                          builder: (context, progress, child) {
                            final percentStr = (progress * 100).toStringAsFixed(0);
                            return Text(
                              '$percentStr%',
                              style: const TextStyle(
                                color: Colors.white70,
                                fontSize: 13,
                                fontWeight: FontWeight.bold,
                                fontFamily: 'Outfit',
                              ),
                            );
                          },
                        )
                      : const SizedBox.shrink(),
                ),
                
                // Bottom Right: Chapter Navigation Icons
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    IconButton(
                      icon: const Icon(Icons.chevron_left_rounded, color: Colors.white, size: 28),
                      onPressed: onPrevChapter,
                      color: onPrevChapter != null ? Colors.white : Colors.white30,
                      padding: EdgeInsets.zero,
                      constraints: const BoxConstraints(),
                    ),
                    const SizedBox(width: 32),
                    IconButton(
                      icon: const Icon(Icons.chevron_right_rounded, color: Colors.white, size: 28),
                      onPressed: onNextChapter,
                      color: onNextChapter != null ? Colors.white : Colors.white30,
                      padding: EdgeInsets.zero,
                      constraints: const BoxConstraints(),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
