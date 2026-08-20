import 'package:flutter/material.dart';

class ViewerInteractionLayer extends StatefulWidget {
  final Widget child;
  final VoidCallback onCenterTap;
  final VoidCallback? onLeftTap;
  final VoidCallback? onRightTap;
  final double tapThreshold; 
  final int timeThresholdMs; 

  const ViewerInteractionLayer({
    super.key,
    required this.child,
    required this.onCenterTap,
    this.onLeftTap,
    this.onRightTap,
    this.tapThreshold = 10.0,
    this.timeThresholdMs = 300,
  });

  @override
  State<ViewerInteractionLayer> createState() => _ViewerInteractionLayerState();
}

class _ViewerInteractionLayerState extends State<ViewerInteractionLayer> {
  Offset? _pointerDownPosition;
  int? _pointerDownTimestamp;

  void _onPointerDown(PointerDownEvent event) {
    _pointerDownPosition = event.position;
    _pointerDownTimestamp = DateTime.now().millisecondsSinceEpoch;
  }

  void _onPointerUp(PointerUpEvent event) {
    if (_pointerDownPosition == null || _pointerDownTimestamp == null) return;

    final pointerUpPosition = event.position;
    final pointerUpTimestamp = DateTime.now().millisecondsSinceEpoch;

    final distance = (pointerUpPosition - _pointerDownPosition!).distance;
    final timeElapsed = pointerUpTimestamp - _pointerDownTimestamp!;

    _pointerDownPosition = null;
    _pointerDownTimestamp = null;

    if (distance > widget.tapThreshold || timeElapsed > widget.timeThresholdMs) {
      return;
    }

    final screenWidth = MediaQuery.of(context).size.width;
    final tapX = pointerUpPosition.dx;

    if (tapX < screenWidth * 0.25) {
      if (widget.onLeftTap != null) {
        widget.onLeftTap!();
      } else {
        widget.onCenterTap();
      }
    } else if (tapX > screenWidth * 0.75) {
      if (widget.onRightTap != null) {
        widget.onRightTap!();
      } else {
        widget.onCenterTap();
      }
    } else {
      widget.onCenterTap();
    }
  }

  void _onPointerCancel(PointerCancelEvent event) {
    _pointerDownPosition = null;
    _pointerDownTimestamp = null;
  }

  @override
  Widget build(BuildContext context) {
    return Listener(
      behavior: HitTestBehavior.translucent,
      onPointerDown: _onPointerDown,
      onPointerUp: _onPointerUp,
      onPointerCancel: _onPointerCancel,
      child: widget.child,
    );
  }
}
