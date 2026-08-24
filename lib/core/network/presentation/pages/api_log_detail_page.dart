import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mekuru/core/theme/app_colors.dart';
import 'package:mekuru/core/widgets/json_tree_viewer.dart';
import 'package:mekuru/features/logger/domain/models/log_entry.dart';

class ApiLogDetailPage extends ConsumerWidget {
  final ApiLogEntry shallowLog;

  const ApiLogDetailPage({
    super.key,
    required this.shallowLog,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    
    // In the new DAO architecture, shallowLog IS the full log.
    final fullLog = shallowLog;
    
    return Scaffold(
      backgroundColor: isDark
          ? AppColors.backgroundDark
          : AppColors.backgroundLight,
      body: Stack(
        children: [
          SafeArea(
            child: SingleChildScrollView(
              padding: const EdgeInsets.only(left: 16, right: 16, top: 24, bottom: 40),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _buildUnifiedHeaderBlock(context, isDark, shallowLog),
                  const SizedBox(height: 24),
                  
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      if (fullLog.requestHeaders.isNotEmpty) ...[
                        JsonTreeViewer(
                          data: fullLog.requestHeaders,
                          isDark: isDark,
                          rootName: 'Request Headers',
                        ),
                        const SizedBox(height: 8),
                      ],

                      if (fullLog.requestBody != null) ...[
                        JsonTreeViewer(
                          data: fullLog.requestBody,
                          isDark: isDark,
                          rootName: 'Request Body',
                        ),
                        const SizedBox(height: 8),
                      ],

                      if (fullLog.responseHeaders != null && fullLog.responseHeaders!.isNotEmpty) ...[
                        JsonTreeViewer(
                          data: fullLog.responseHeaders,
                          isDark: isDark,
                          rootName: 'Response Headers',
                        ),
                        const SizedBox(height: 8),
                      ],

                      if (fullLog.responseBody != null) ...[
                        JsonTreeViewer(
                          data: fullLog.responseBody,
                          isDark: isDark,
                          rootName: 'Response Body',
                        ),
                      ],
                    ],
                  ),
                ],
              ),
            ),
          ),
          
          Positioned(
            left: 16,
            bottom: 24,
            child: FloatingActionButton(
              heroTag: 'back_btn',
              mini: true,
              backgroundColor: isDark ? const Color(0xFF2C2C2E) : Colors.white,
              elevation: 4,
              onPressed: () => Navigator.pop(context),
              child: Icon(
                Icons.arrow_back_rounded,
                color: isDark ? Colors.white : Colors.black87,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildUnifiedHeaderBlock(BuildContext context, bool isDark, ApiLogEntry log) {
    Color methodColor;
    switch (log.method.toUpperCase()) {
      case 'GET':
        methodColor = Colors.blue;
        break;
      case 'POST':
        methodColor = Colors.green;
        break;
      case 'PUT':
        methodColor = Colors.orange;
        break;
      case 'DELETE':
        methodColor = Colors.red;
        break;
      case 'PATCH':
        methodColor = Colors.purple;
        break;
      default:
        methodColor = Colors.grey;
    }

    Color statusColor = Colors.grey;
    if (log.statusCode != null) {
      if (log.statusCode! >= 200 && log.statusCode! < 300) {
        statusColor = Colors.green;
      } else if (log.statusCode! >= 400 && log.statusCode! < 500) {
        statusColor = Colors.orange;
      } else if (log.statusCode! >= 500) {
        statusColor = Colors.red;
      }
    }

    final timestamp = log.timestamp.toLocal().toString().split('.')[0];
    final duration = log.durationMs != null ? '${log.durationMs} ms' : 'N/A';

    return Container(
      decoration: BoxDecoration(
        color: isDark ? const Color(0xFF1C1C1E) : Colors.white,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(
          color: isDark ? Colors.white.withValues(alpha: 0.08) : Colors.black.withValues(alpha: 0.05),
          width: 1,
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.03),
            blurRadius: 10,
            offset: const Offset(0, 4),
          )
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                  decoration: BoxDecoration(
                    color: methodColor.withValues(alpha: 0.1),
                    borderRadius: BorderRadius.circular(6),
                  ),
                  child: Text(
                    log.method.toUpperCase(),
                    style: TextStyle(
                      fontFamily: 'Outfit',
                      fontWeight: FontWeight.w700,
                      color: methodColor,
                      fontSize: 14,
                    ),
                  ),
                ),
                const SizedBox(width: 12),
                if (log.statusCode != null)
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                    decoration: BoxDecoration(
                      color: statusColor.withValues(alpha: 0.1),
                      borderRadius: BorderRadius.circular(6),
                    ),
                    child: Text(
                      '${log.statusCode}',
                      style: TextStyle(
                        fontFamily: 'Outfit',
                        fontWeight: FontWeight.w700,
                        color: statusColor,
                        fontSize: 14,
                      ),
                    ),
                  ),
                const Spacer(),
                IconButton(
                  icon: const Icon(Icons.copy_rounded, size: 20),
                  color: isDark ? Colors.white54 : Colors.black54,
                  onPressed: () {
                    Clipboard.setData(ClipboardData(text: log.url));
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text('URL Copied!')),
                    );
                  },
                ),
              ],
            ),
            const SizedBox(height: 16),
            Text(
              log.url,
              style: TextStyle(
                fontSize: 16,
                height: 1.4,
                color: isDark ? Colors.white : Colors.black87,
                fontWeight: FontWeight.w500,
              ),
            ),
            const SizedBox(height: 16),
            Divider(color: isDark ? Colors.white12 : Colors.black12, height: 1),
            const SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                _buildMetaInfoRow(Icons.calendar_today_rounded, timestamp, isDark),
                _buildMetaInfoRow(Icons.timer_outlined, duration, isDark),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildMetaInfoRow(IconData icon, String text, bool isDark) {
    return Row(
      children: [
        Icon(icon, size: 14, color: isDark ? Colors.white54 : Colors.black54),
        const SizedBox(width: 6),
        Text(
          text,
          style: TextStyle(
            fontFamily: 'Outfit',
            fontSize: 13,
            color: isDark ? Colors.white54 : Colors.black54,
          ),
        ),
      ],
    );
  }
}
