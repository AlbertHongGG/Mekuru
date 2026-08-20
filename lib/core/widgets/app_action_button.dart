import 'package:flutter/material.dart';

class AppActionButton extends StatefulWidget {
  final IconData icon;
  final VoidCallback? onPressed;
  final String? tooltip;
  final Color color;
  final double iconSize;
  final double padding;

  const AppActionButton({
    super.key,
    required this.icon,
    this.onPressed,
    this.tooltip,
    this.color = Colors.white,
    this.iconSize = 24.0,
    this.padding = 6.0,
  });

  @override
  State<AppActionButton> createState() => _AppActionButtonState();
}

class _AppActionButtonState extends State<AppActionButton> {
  bool _isPressed = false;

  void _handleTapDown(TapDownDetails details) {
    if (widget.onPressed == null) return;
    setState(() {
      _isPressed = true;
    });
  }

  void _handleTapUp(TapUpDetails details) {
    if (widget.onPressed == null) return;
    setState(() {
      _isPressed = false;
    });
    widget.onPressed!();
  }

  void _handleTapCancel() {
    if (widget.onPressed == null) return;
    setState(() {
      _isPressed = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    final bool isDisabled = widget.onPressed == null;
    final Color iconColor = isDisabled ? widget.color.withValues(alpha: 0.3) : widget.color;
    
    Widget button = GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTapDown: _handleTapDown,
      onTapUp: _handleTapUp,
      onTapCancel: _handleTapCancel,
      child: AnimatedOpacity(
        duration: const Duration(milliseconds: 100),
        opacity: _isPressed ? 0.5 : 1.0,
        child: Padding(
          padding: EdgeInsets.all(widget.padding),
          child: Icon(
            widget.icon,
            color: iconColor,
            size: widget.iconSize,
          ),
        ),
      ),
    );

    if (widget.tooltip != null) {
      button = Tooltip(
        message: widget.tooltip!,
        child: button,
      );
    }

    return button;
  }
}
