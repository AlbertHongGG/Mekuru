import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class SearchDialog extends StatefulWidget {
  final String initialQuery;
  final ValueChanged<String> onSearch;
  final VoidCallback onClear;
  final String hintText;

  const SearchDialog({
    super.key,
    required this.initialQuery,
    required this.onSearch,
    required this.onClear,
    this.hintText = 'Search...',
  });

  @override
  State<SearchDialog> createState() => _SearchDialogState();
}

class _SearchDialogState extends State<SearchDialog> {
  late TextEditingController _controller;
  final FocusNode _focusNode = FocusNode();

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController(text: widget.initialQuery);
    Future.delayed(const Duration(milliseconds: 50), () {
      if (mounted) _focusNode.requestFocus();
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    _focusNode.dispose();
    super.dispose();
  }

  void _handleClear() {
    _controller.clear();
    widget.onClear();
    setState(() {});
  }

  void _submit() {
    HapticFeedback.lightImpact();
    widget.onSearch(_controller.text);
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;

    final glassColor = isDark 
        ? const Color(0xFF1A1C29).withValues(alpha: 0.75) 
        : Colors.white.withValues(alpha: 0.85);
    final borderColor = isDark
        ? Colors.white.withValues(alpha: 0.1)
        : Colors.black.withValues(alpha: 0.05);
    final textColor = isDark ? Colors.white : const Color(0xFF1A1A1A);
    final iconColor = isDark ? Colors.white54 : Colors.black45;

    return BackdropFilter(
      filter: ImageFilter.blur(sigmaX: 12, sigmaY: 12),
      child: Dialog(
        backgroundColor: Colors.transparent,
        surfaceTintColor: Colors.transparent,
        elevation: 0,
        insetPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 24),
        alignment: Alignment.topCenter,
        child: Padding(
          padding: EdgeInsets.only(top: MediaQuery.sizeOf(context).height * 0.1),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  color: glassColor,
                  borderRadius: BorderRadius.circular(24),
                  border: Border.all(color: borderColor, width: 1),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withValues(alpha: 0.1),
                      blurRadius: 30,
                      spreadRadius: -5,
                      offset: const Offset(0, 10),
                    ),
                  ],
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                  child: TextField(
                    controller: _controller,
                    focusNode: _focusNode,
                    onSubmitted: (_) => _submit(),
                    onChanged: (val) {
                      setState(() {});
                    },
                    textInputAction: TextInputAction.search,
                    style: TextStyle(
                      fontFamily: 'Outfit',
                      fontSize: 20,
                      color: textColor,
                      fontWeight: FontWeight.w500,
                    ),
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      prefixIcon: Padding(
                        padding: const EdgeInsets.only(left: 8, right: 4),
                        child: Icon(Icons.search_rounded, color: iconColor, size: 28),
                      ),
                      hintText: widget.hintText,
                      hintStyle: TextStyle(
                        fontFamily: 'Outfit',
                        color: isDark ? Colors.white30 : Colors.black26,
                        fontSize: 20,
                      ),
                      contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
                      suffixIcon: _controller.text.isNotEmpty
                          ? IconButton(
                              icon: Container(
                                padding: const EdgeInsets.all(4),
                                decoration: BoxDecoration(
                                  color: isDark ? Colors.white12 : Colors.black12,
                                  shape: BoxShape.circle,
                                ),
                                child: Icon(Icons.close_rounded, color: iconColor, size: 16),
                              ),
                              onPressed: _handleClear,
                            )
                          : null,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
