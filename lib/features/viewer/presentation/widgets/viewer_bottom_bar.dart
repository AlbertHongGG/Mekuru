import 'package:flutter/material.dart';
import 'package:mekuru/core/widgets/app_action_button.dart';

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
                    AppActionButton(
                      icon: Icons.chevron_left_rounded,
                      onPressed: onPrevChapter,
                      iconSize: 28,
                      padding: 12,
                    ),
                    const SizedBox(width: 8),
                    AppActionButton(
                      icon: Icons.chevron_right_rounded,
                      onPressed: onNextChapter,
                      iconSize: 28,
                      padding: 12,
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
