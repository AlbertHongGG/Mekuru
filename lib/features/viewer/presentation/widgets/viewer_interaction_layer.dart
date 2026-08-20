import 'package:flutter/material.dart';

/// 專屬於漫畫閱讀器的互動狀態機攔截層
/// 參考了業界頂級閱讀器 (如 Mihon) 的實作方式，從底層解耦點擊與滾動狀態。
class ViewerInteractionLayer extends StatefulWidget {
  final Widget child;
  final VoidCallback onTap;
  final ScrollController? scrollController;

  const ViewerInteractionLayer({
    super.key,
    required this.child,
    required this.onTap,
    required this.scrollController,
  });

  @override
  State<ViewerInteractionLayer> createState() => _ViewerInteractionLayerState();
}

class _ViewerInteractionLayerState extends State<ViewerInteractionLayer> {
  /// 紀錄手指落下的瞬間，畫面是否正在滾動
  bool _wasScrollingOnPointerDown = false;

  void _onPointerDown(PointerDownEvent event) {
    // 拍下狀態快照：絕對瞬間的滾動狀態
    if (widget.scrollController != null && widget.scrollController!.hasClients) {
      _wasScrollingOnPointerDown = widget.scrollController!.position.isScrollingNotifier.value;
    } else {
      _wasScrollingOnPointerDown = false;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Listener(
      // Listener 不會干預 Gesture Arena，只負責純粹的事件監聽
      behavior: HitTestBehavior.translucent,
      onPointerDown: _onPointerDown,
      child: GestureDetector(
        behavior: HitTestBehavior.translucent,
        // 使用 onTapUp 確保這是個合法的點擊 (未被判定為拖曳)
        onTapUp: (details) {
          // 如果這一下點擊發生在「畫面滾動中」，這就是一次煞停 (Brake)，絕對不能觸發 UI
          if (!_wasScrollingOnPointerDown) {
            widget.onTap();
          }
        },
        child: widget.child,
      ),
    );
  }
}
