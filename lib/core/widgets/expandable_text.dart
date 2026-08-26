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
    return GestureDetector(
      onTap: () {
        setState(() {
          _isExpanded = !_isExpanded;
        });
      },
      child: AnimatedSize(
        duration: const Duration(milliseconds: 300),
        alignment: Alignment.topCenter,
        curve: Curves.easeInOut,
        child: LayoutBuilder(
          builder: (context, size) {
            final span = TextSpan(text: widget.text, style: widget.style);
            final tp = TextPainter(
              text: span,
              maxLines: widget.maxLines,
              textDirection: TextDirection.ltr,
            );
            tp.layout(maxWidth: size.maxWidth);

            if (tp.didExceedMaxLines && !_isExpanded) {
              // Get the position of the last visible character
              final position = tp.getPositionForOffset(Offset(size.maxWidth, tp.height));
              
              // We need to back up a few characters to make room for "..."
              // A rough estimate: go back 3-5 characters depending on font size.
              // A safer robust way without complex math is to just use rich text with custom ellipsis, 
              // but since Flutter 2.5+, TextPainter has ellipsis support!
              // But wait, the user's issue is the FONT's ellipsis character being vertically centered.
              // So we CANNOT use `tp.ellipsis = '...'`.
              // We just manually slice the string.
              // For simplicity, since Chinese chars and emojis vary, we'll use a safe approximation
              // If the offset is larger than the string length, clamp it.
              int safeIndex = position.offset;
              if (safeIndex > widget.text.length) safeIndex = widget.text.length;
              
              // Ensure we don't break a character boundary by backing up to a valid index
              while (safeIndex > 0 && 
                     (widget.text.codeUnitAt(safeIndex - 1) >= 0xDC00 && 
                      widget.text.codeUnitAt(safeIndex - 1) <= 0xDFFF)) {
                safeIndex--;
              }
              
              if (safeIndex > 3) safeIndex -= 3;
              
              final truncatedText = '${widget.text.substring(0, safeIndex)}...';
              
              return Text(
                truncatedText,
                style: widget.style,
              );
            }

            return Text(
              widget.text,
              style: widget.style,
            );
          },
        ),
      ),
    );
  }
}
