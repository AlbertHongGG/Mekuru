import 'package:flutter/material.dart';

class ExpandableText extends StatefulWidget {
  final String text;
  final TextStyle? style;
  final int maxLines;

  const ExpandableText({
    super.key,
    required this.text,
    this.style,
    this.maxLines = 4,
  });

  @override
  State<ExpandableText> createState() => _ExpandableTextState();
}

class _ExpandableTextState extends State<ExpandableText> {
  bool _isExpanded = false;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, size) {
        final span = TextSpan(text: widget.text, style: widget.style);
        final tp = TextPainter(
          text: span,
          maxLines: widget.maxLines,
          textDirection: TextDirection.ltr,
        );
        tp.layout(maxWidth: size.maxWidth);

        if (tp.didExceedMaxLines) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              AnimatedSize(
                duration: const Duration(milliseconds: 300),
                alignment: Alignment.topCenter,
                curve: Curves.easeInOut,
                child: Text(
                  widget.text,
                  style: widget.style,
                  maxLines: _isExpanded ? null : widget.maxLines,
                  overflow: _isExpanded ? TextOverflow.visible : TextOverflow.ellipsis,
                ),
              ),
              const SizedBox(height: 4),
              GestureDetector(
                onTap: () {
                  setState(() {
                    _isExpanded = !_isExpanded;
                  });
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text(
                      _isExpanded ? '收起' : '...展開',
                      style: TextStyle(
                        color: Theme.of(context).primaryColor,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Icon(
                      _isExpanded ? Icons.keyboard_arrow_up : Icons.keyboard_arrow_down,
                      color: Theme.of(context).primaryColor,
                      size: 16,
                    ),
                  ],
                ),
              ),
            ],
          );
        } else {
          return Text(widget.text, style: widget.style);
        }
      },
    );
  }
}
