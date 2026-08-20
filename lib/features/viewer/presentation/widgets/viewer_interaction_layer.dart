import 'package:flutter/material.dart';

class ViewerInteractionLayer extends StatelessWidget {
  final Widget child;
  final VoidCallback onCenterTap;
  final VoidCallback? onLeftTap;
  final VoidCallback? onRightTap;

  const ViewerInteractionLayer({
    super.key,
    required this.child,
    required this.onCenterTap,
    this.onLeftTap,
    this.onRightTap,
  });

  void _handleTapUp(BuildContext context, TapUpDetails details) {
    final screenWidth = MediaQuery.of(context).size.width;
    final tapX = details.globalPosition.dx;

    // 嚴格劃分點擊區域 (左 25% / 中 50% / 右 25%)
    if (tapX < screenWidth * 0.25) {
      if (onLeftTap != null) {
        onLeftTap!();
      }
    } else if (tapX > screenWidth * 0.75) {
      if (onRightTap != null) {
        onRightTap!();
      }
    } else {
      // 只有點擊中央 50% 的安全區，才會觸發 UI 開關
      onCenterTap();
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      // 使用 translucent 讓手勢可以穿透，但由 Gesture Arena 負責仲裁
      behavior: HitTestBehavior.translucent,
      // 使用 onTapUp，這樣如果 ScrollView 消耗了點擊事件(例如煞停)，這裡就不會觸發
      onTapUp: (details) => _handleTapUp(context, details),
      child: child,
    );
  }
}
