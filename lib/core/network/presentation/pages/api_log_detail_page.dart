import 'package:flutter/material.dart';
import 'package:mekuru/core/theme/app_colors.dart';
import 'package:mekuru/core/widgets/json_tree_viewer.dart';
import '../../models/api_log_entry.dart';

class ApiLogDetailPage extends StatelessWidget {
  final ApiLogEntry log;

  const ApiLogDetailPage({
    super.key,
    required this.log,
  });

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final url = log.url;
    final duration = log.durationMs != null ? '${log.durationMs} ms' : 'N/A';
    final timestamp = log.requestTime.toLocal().toString().split('.')[0];
    final method = log.method.toUpperCase();
    final status = log.statusCode?.toString() ?? 'N/A';

    return Scaffold(
      backgroundColor: isDark
          ? AppColors.backgroundDark
          : AppColors.backgroundLight,
      body: Stack(
        children: [
          SafeArea(
            child: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Icon(
                  Icons.timer_rounded,
                  size: 16,
                  color: isDark ? Colors.white54 : Colors.black54,
                ),
                const SizedBox(width: 8),
                Text(
                  'Duration: $duration',
                  style: TextStyle(
                    color: isDark ? Colors.white70 : Colors.black87,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 4),
            Row(
              children: [
                Icon(
                  Icons.calendar_today_rounded,
                  size: 16,
                  color: isDark ? Colors.white54 : Colors.black54,
                ),
                const SizedBox(width: 8),
                Text(
                  'Time: $timestamp',
                  style: TextStyle(
                    color: isDark ? Colors.white70 : Colors.black87,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 12),
            SelectableText(
              url,
              style: TextStyle(
                color: isDark ? Colors.white : Colors.black87,
                fontSize: 15,
                fontWeight: FontWeight.w500,
              ),
            ),
            const SizedBox(height: 24),

            if (log.requestHeaders.isNotEmpty) ...[
              JsonTreeViewer(
                data: log.requestHeaders,
                isDark: isDark,
                rootName: 'Request Headers',
              ),
              const SizedBox(height: 8),
            ],

            if (log.requestBody != null) ...[
              JsonTreeViewer(
                data: log.requestBody,
                isDark: isDark,
                rootName: 'Request Body',
              ),
              const SizedBox(height: 8),
            ],

            if (log.responseHeaders != null && log.responseHeaders!.isNotEmpty) ...[
              JsonTreeViewer(
                data: log.responseHeaders,
                isDark: isDark,
                rootName: 'Response Headers',
              ),
              const SizedBox(height: 8),
            ],

            if (log.responseBody != null) ...[
              JsonTreeViewer(
                data: log.responseBody,
                isDark: isDark,
                rootName: 'Response Body',
              ),
            ],
            const SizedBox(height: 40),
          ],
        ),
      ),
    ),
    Positioned(
      left: 0,
      top: 0,
      bottom: 0,
      width: 40,
      child: GestureDetector(
        behavior: HitTestBehavior.translucent,
        onHorizontalDragEnd: (details) {
          if (details.primaryVelocity != null && details.primaryVelocity! > 300) {
            Navigator.of(context).pop();
          }
        },
      ),
    ),
  ],
),
    );
  }
}
