import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
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
                  _buildUnifiedHeaderBlock(context, isDark),
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
                ],
              ),
            ),
          ),
          // Edge Swipe Detector for popping the screen
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

  Widget _buildUnifiedHeaderBlock(BuildContext context, bool isDark) {
    Color statusColor = Colors.grey;
    if (log.statusCode != null) {
      if (log.statusCode! >= 200 && log.statusCode! < 300) {
        statusColor = Colors.green[600]!;
      } else if (log.statusCode! >= 400 && log.statusCode! < 500) {
        statusColor = Colors.orange[700]!;
      } else if (log.statusCode! >= 500) {
        statusColor = Colors.red[600]!;
      }
    }

    final timestamp = log.requestTime.toLocal().toString().split('.')[0];
    final duration = log.durationMs != null ? '${log.durationMs} ms' : 'N/A';

    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: isDark ? const Color(0xFF1E1E1E) : Colors.white,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(
          color: isDark ? Colors.white12 : Colors.black12,
          width: 1,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // Solid Method Tag
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                decoration: BoxDecoration(
                  color: statusColor,
                  borderRadius: BorderRadius.circular(4),
                ),
                child: Text(
                  log.method.toUpperCase(),
                  style: const TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 12,
                  ),
                ),
              ),
              const SizedBox(width: 8),
              
              // Status Code
              if (log.statusCode != null)
                Text(
                  '${log.statusCode}',
                  style: TextStyle(
                    color: statusColor,
                    fontWeight: FontWeight.bold,
                    fontSize: 13,
                  ),
                )
              else
                const SizedBox(
                  width: 12,
                  height: 12,
                  child: CircularProgressIndicator(strokeWidth: 2),
                ),
                
              const Spacer(),
              
              // Copy Button
              InkWell(
                onTap: () {
                  Clipboard.setData(ClipboardData(text: log.url));
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text('已複製網址'),
                      duration: Duration(seconds: 2),
                      behavior: SnackBarBehavior.floating,
                    ),
                  );
                },
                borderRadius: BorderRadius.circular(4),
                child: Padding(
                  padding: const EdgeInsets.all(4.0),
                  child: Icon(
                    Icons.copy_rounded,
                    size: 16,
                    color: isDark ? Colors.white54 : Colors.black54,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),
          
          // URL
          SelectableText(
            log.url,
            style: TextStyle(
              fontFamily: 'monospace',
              fontSize: 13,
              height: 1.4,
              color: isDark ? Colors.grey[300] : Colors.grey[800],
            ),
          ),
          
          const SizedBox(height: 12),
          Divider(height: 1, color: isDark ? Colors.white12 : Colors.black12),
          const SizedBox(height: 10),
          
          // Metadata
          Row(
            children: [
              Text(
                duration,
                style: TextStyle(
                  fontSize: 12,
                  fontFamily: 'monospace',
                  color: isDark ? Colors.white54 : Colors.black54,
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8),
                child: Text('•', style: TextStyle(color: isDark ? Colors.white24 : Colors.black26, fontSize: 12)),
              ),
              Text(
                timestamp,
                style: TextStyle(
                  fontSize: 12,
                  fontFamily: 'monospace',
                  color: isDark ? Colors.white54 : Colors.black54,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
