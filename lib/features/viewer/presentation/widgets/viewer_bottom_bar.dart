import 'package:flutter/material.dart';
import 'package:mekuru/core/widgets/app_action_button.dart';

class ViewerBottomBar extends StatelessWidget {
  final bool isVisible;
  final ValueNotifier<int>? currentIndexNotifier;
  final int totalPages;
  final bool hasPages;
  final VoidCallback? onPrevChapter;
  final VoidCallback? onNextChapter;

  const ViewerBottomBar({
    super.key,
    required this.isVisible,
    this.currentIndexNotifier,
    required this.totalPages,
    required this.hasPages,
    this.onPrevChapter,
    this.onNextChapter,
  });

  @override
  Widget build(BuildContext context) {
    return AnimatedPositioned(
      duration: const Duration(milliseconds: 200),
      curve: Curves.easeInOut,
      bottom: isVisible ? 0 : -200, // Move completely out of view
      left: 0,
      right: 0,
      child: IgnorePointer(
        ignoring: !isVisible,
        child: Container(
          color: Colors.black.withValues(alpha: 0.8),
          child: SafeArea(
            top: false,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  // Bottom Left: Progress Indicator
                  Container(
                    constraints: const BoxConstraints(minWidth: 50),
                    child: (hasPages && currentIndexNotifier != null && totalPages > 0)
                        ? ValueListenableBuilder<int>(
                            valueListenable: currentIndexNotifier!,
                            builder: (context, currentIndex, child) {
                              final displayIndex = currentIndex + 1;
                              final percentage = ((displayIndex / totalPages) * 100).toInt();

                              return Row(
                                mainAxisSize: MainAxisSize.min,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Text(
                                    '$displayIndex / $totalPages',
                                    style: TextStyle(
                                      color: Colors.white.withValues(alpha: 0.9),
                                      fontSize: 13,
                                      fontWeight: FontWeight.w500,
                                      fontFamily: 'Outfit',
                                      letterSpacing: 0.5,
                                    ),
                                  ),
                                  const SizedBox(width: 8),
                                  Container(
                                    padding: const EdgeInsets.symmetric(horizontal: 7, vertical: 2.5),
                                    decoration: BoxDecoration(
                                      color: Colors.white.withValues(alpha: 0.18),
                                      borderRadius: BorderRadius.circular(6),
                                    ),
                                    child: Text(
                                      '$percentage%',
                                      style: const TextStyle(
                                        color: Colors.white,
                                        fontSize: 12,
                                        fontWeight: FontWeight.w600,
                                        fontFamily: 'Outfit',
                                        letterSpacing: 0.2,
                                      ),
                                    ),
                                  ),
                                ],
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
      ),
    );
  }
}
