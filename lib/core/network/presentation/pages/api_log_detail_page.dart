import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mekuru/core/theme/app_colors.dart';
import 'package:mekuru/core/widgets/json_tree_viewer.dart';
import '../../models/api_log_entry.dart';
import '../../providers/api_logger_provider.dart';

class ApiLogDetailPage extends ConsumerWidget {
  final ApiLogEntry shallowLog;

  const ApiLogDetailPage({
    super.key,
    required this.shallowLog,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    
    // Lazy-load the full log payload
    final fullLogAsync = ref.watch(apiLogDetailProvider(shallowLog.id));
    
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
                  // Header can be rendered immediately using shallow metadata
                  _buildUnifiedHeaderBlock(context, isDark, shallowLog),
                  const SizedBox(height: 24),

                  fullLogAsync.when(
                    data: (fullLog) {
                      if (fullLog == null) {
                        return const Center(child: Text('日誌檔案已遺失'));
                      }
                      
                      return Column(
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
                      );
                    },
                    loading: () => Center(
                      child: Padding(
                        padding: const EdgeInsets.all(32.0),
                        child: CircularProgressIndicator(
                          color: isDark ? Colors.white54 : Colors.black54,
                          strokeWidth: 2,
                        ),
                      ),
                    ),
                    error: (e, st) => Center(child: Text('解析錯誤: $e')),
                  ),
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

  Widget _buildUnifiedHeaderBlock(BuildContext context, bool isDark, ApiLogEntry log) {
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
