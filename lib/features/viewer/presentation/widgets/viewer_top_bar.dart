import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:mekuru/core/widgets/app_action_button.dart';
import 'package:mekuru/core/routes/app_routes.dart';

class ViewerTopBar extends StatelessWidget {
  final bool isVisible;
  final String comicTitle;
  final String chapterTitle;
  final VoidCallback onMenuPressed;

  const ViewerTopBar({
    super.key,
    required this.isVisible,
    required this.comicTitle,
    required this.chapterTitle,
    required this.onMenuPressed,
  });

  @override
  Widget build(BuildContext context) {
    return AnimatedPositioned(
      duration: const Duration(milliseconds: 200),
      curve: Curves.easeInOut,
      top: isVisible ? 0 : -100,
      left: 0,
      right: 0,
      child: Container(
        color: Colors.black.withValues(alpha: 0.8),
        child: SafeArea(
          bottom: false,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
            child: Row(
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        comicTitle,
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          fontFamily: 'Outfit',
                        ),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                      Text(
                        chapterTitle,
                        style: const TextStyle(
                          color: Colors.white70,
                          fontSize: 14,
                          fontFamily: 'Outfit',
                        ),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ],
                  ),
                ),
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    AppActionButton(
                      icon: Icons.info_outline_rounded,
                      tooltip: '回到詳情',
                      padding: 6,
                      onPressed: () {
                        if (context.canPop()) {
                          context.pop();
                        }
                      },
                    ),
                    const SizedBox(width: 2),
                    AppActionButton(
                      icon: Icons.home_rounded,
                      tooltip: '回到首頁',
                      padding: 6,
                      onPressed: () {
                        context.go(AppRoutes.library);
                      },
                    ),
                    const SizedBox(width: 2),
                    AppActionButton(
                      icon: Icons.menu_rounded,
                      tooltip: '章節列表',
                      padding: 6,
                      onPressed: onMenuPressed,
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
