import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mekuru/core/theme/app_colors.dart';
import '../../models/api_log_entry.dart';

class ApiLogDetailPage extends StatelessWidget {
  final ApiLogEntry log;

  const ApiLogDetailPage({super.key, required this.log});

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Scaffold(
      backgroundColor: isDark ? const Color(0xFF121212) : const Color(0xFFF5F5F5),
      appBar: AppBar(
        title: const Text(
          'API 詳情',
          style: TextStyle(fontFamily: 'Outfit', fontWeight: FontWeight.bold),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildInfoCard(context, isDark),
            const SizedBox(height: 16),
            if (log.requestHeaders.isNotEmpty)
              _LogTreeNode(
                title: 'Request Headers',
                data: log.requestHeaders,
                isDark: isDark,
                icon: Icons.upload_rounded,
              ),
            if (log.requestBody != null)
              _LogTreeNode(
                title: 'Request Body',
                data: log.requestBody,
                isDark: isDark,
                icon: Icons.data_object_rounded,
              ),
            if (log.responseHeaders != null && log.responseHeaders!.isNotEmpty)
              _LogTreeNode(
                title: 'Response Headers',
                data: log.responseHeaders,
                isDark: isDark,
                icon: Icons.download_rounded,
              ),
            if (log.responseBody != null)
              _LogTreeNode(
                title: 'Response Body',
                data: log.responseBody,
                isDark: isDark,
                icon: Icons.data_object_rounded,
                initiallyExpanded: true, // Auto expand response
              ),
            if (log.error != null)
              _LogTreeNode(
                title: 'Error Details',
                data: log.error,
                isDark: isDark,
                icon: Icons.error_outline,
                initiallyExpanded: true,
              ),
            const SizedBox(height: 40),
          ],
        ),
      ),
    );
  }

  Widget _buildInfoCard(BuildContext context, bool isDark) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: isDark ? const Color(0xFF1E1E1E) : Colors.white,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            '${log.method.toUpperCase()} ${log.statusCode ?? '...'}',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: log.statusCode == null
                  ? Colors.grey
                  : (log.statusCode! < 300 ? Colors.green : Colors.red),
            ),
          ),
          const SizedBox(height: 8),
          SelectableText(
            log.url,
            style: TextStyle(
              color: isDark ? Colors.white : Colors.black87,
              fontSize: 15,
            ),
          ),
          const Divider(height: 24),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                '耗時: ${log.durationMs != null ? '${log.durationMs}ms' : '載入中...'}',
                style: TextStyle(
                  color: isDark ? Colors.white70 : Colors.black87,
                  fontFamily: 'Outfit',
                ),
              ),
              Text(
                '時間: ${log.requestTime.toLocal().toString().split('.')[0]}',
                style: TextStyle(
                  color: isDark ? Colors.white70 : Colors.black87,
                  fontFamily: 'Outfit',
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class _LogTreeNode extends StatefulWidget {
  final String title;
  final dynamic data;
  final bool isDark;
  final IconData icon;
  final bool initiallyExpanded;

  const _LogTreeNode({
    required this.title,
    required this.data,
    required this.isDark,
    required this.icon,
    this.initiallyExpanded = false,
  });

  @override
  State<_LogTreeNode> createState() => _LogTreeNodeState();
}

class _LogTreeNodeState extends State<_LogTreeNode> {
  late bool _isExpanded;
  String _formattedJson = '';

  @override
  void initState() {
    super.initState();
    _isExpanded = widget.initiallyExpanded;
    _formatData();
  }

  void _formatData() {
    try {
      if (widget.data is String) {
        // Try parsing string to json to format it, otherwise leave as string
        try {
          final parsed = jsonDecode(widget.data);
          _formattedJson = const JsonEncoder.withIndent('  ').convert(parsed);
        } catch (_) {
          _formattedJson = widget.data;
        }
      } else {
        _formattedJson = const JsonEncoder.withIndent('  ').convert(widget.data);
      }
    } catch (e) {
      _formattedJson = widget.data.toString();
    }
  }

  void _copyToClipboard(BuildContext context) {
    Clipboard.setData(ClipboardData(text: _formattedJson));
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('已複製到剪貼簿'), duration: Duration(seconds: 2)),
    );
  }

  @override
  Widget build(BuildContext context) {
    final bgColor = widget.isDark ? const Color(0xFF1E1E1E) : Colors.white;
    final borderColor = widget.isDark ? Colors.white10 : Colors.black12;

    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      decoration: BoxDecoration(
        color: bgColor,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: borderColor),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          InkWell(
            onTap: () {
              setState(() {
                _isExpanded = !_isExpanded;
              });
            },
            borderRadius: _isExpanded
                ? const BorderRadius.vertical(top: Radius.circular(12))
                : BorderRadius.circular(12),
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Row(
                children: [
                  Icon(widget.icon, size: 20, color: AppColors.primary),
                  const SizedBox(width: 12),
                  Expanded(
                    child: Text(
                      widget.title,
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                    ),
                  ),
                  if (_isExpanded)
                    IconButton(
                      icon: const Icon(Icons.copy_rounded, size: 18),
                      padding: EdgeInsets.zero,
                      constraints: const BoxConstraints(),
                      onPressed: () => _copyToClipboard(context),
                    ),
                  const SizedBox(width: 8),
                  Icon(
                    _isExpanded ? Icons.keyboard_arrow_up_rounded : Icons.keyboard_arrow_down_rounded,
                    color: widget.isDark ? Colors.white54 : Colors.black54,
                  ),
                ],
              ),
            ),
          ),
          if (_isExpanded)
            Container(
              decoration: BoxDecoration(
                color: widget.isDark ? const Color(0xFF121212) : const Color(0xFFF8F9FA),
                borderRadius: const BorderRadius.vertical(bottom: Radius.circular(12)),
              ),
              padding: const EdgeInsets.all(16),
              child: SelectableText(
                _formattedJson,
                style: TextStyle(
                  fontFamily: 'monospace',
                  fontSize: 13,
                  color: widget.isDark ? const Color(0xFFA6E22E) : const Color(0xFF008000), // Code-like color
                  height: 1.5,
                ),
              ),
            ),
        ],
      ),
    );
  }
}
