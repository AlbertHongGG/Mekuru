import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:mekuru/core/theme/app_colors.dart';
import 'package:mekuru/core/network/models/api_log_entry.dart';
import 'package:mekuru/core/network/providers/api_logger_provider.dart';
import 'package:mekuru/core/widgets/swipe_to_obliterate_button.dart';
import 'api_log_detail_page.dart';

// --- ApiLogListTab WITH KEEPALIVE ---
class ApiLogListTab extends StatefulWidget {
  final List<ApiLogEntry> logs;
  final bool isDark;
  final void Function(ApiLogEntry, bool) onLogTap;

  const ApiLogListTab({
    super.key,
    required this.logs,
    required this.isDark,
    required this.onLogTap,
  });

  @override
  State<ApiLogListTab> createState() => _ApiLogListTabState();
}

class _ApiLogListTabState extends State<ApiLogListTab>
    with AutomaticKeepAliveClientMixin {
  @override
  bool get wantKeepAlive => true; // CRUCIAL: Keeps tab state alive off-screen

  Widget _buildEmptyState() {
    return const Center(
      child: Text(
        '目前沒有 API 日誌',
        style: TextStyle(fontFamily: 'Outfit', fontSize: 16),
      ),
    );
  }

  Widget _buildLogCard(ApiLogEntry log, String subtitle) {
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

    return Card(
      elevation: 0,
      margin: const EdgeInsets.only(bottom: 8),
      color: widget.isDark ? AppColors.surfaceDark : Colors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
        side: BorderSide(
          color: widget.isDark ? Colors.white12 : Colors.black12,
          width: 1,
        ),
      ),
      child: ListTile(
        contentPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
        leading: Container(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
          decoration: BoxDecoration(
            color: methodColor.withValues(alpha: 0.1),
            borderRadius: BorderRadius.circular(8),
          ),
          child: Text(
            log.method.toUpperCase(),
            style: TextStyle(
              color: methodColor,
              fontWeight: FontWeight.bold,
              fontSize: 12,
              fontFamily: 'Outfit',
            ),
          ),
        ),
        title: Text(
          log.url.length > 50 ? '${log.url.substring(0, 47)}...' : log.url,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            fontFamily: 'Outfit',
            fontSize: 14,
          ),
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
        ),
        subtitle: Row(
          children: [
            if (log.statusCode != null) ...[
              Text(
                '${log.statusCode}',
                style: TextStyle(
                  color: statusColor,
                  fontWeight: FontWeight.bold,
                  fontSize: 12,
                ),
              ),
              const SizedBox(width: 8),
            ],
            if (log.durationMs != null) ...[
              Icon(Icons.timer_outlined, size: 12, color: widget.isDark ? Colors.white54 : Colors.black54),
              const SizedBox(width: 4),
              Text(
                '${log.durationMs}ms',
                style: TextStyle(
                  color: widget.isDark ? Colors.white54 : Colors.black54,
                  fontSize: 12,
                ),
              ),
              const SizedBox(width: 8),
            ],
            Text(
              subtitle,
              style: TextStyle(
                color: widget.isDark ? Colors.white54 : Colors.black54,
                fontSize: 12,
              ),
            ),
          ],
        ),
        trailing: const Icon(Icons.chevron_right_rounded),
        onTap: () => widget.onLogTap(log, widget.isDark),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);

    if (widget.logs.isEmpty) {
      return _buildEmptyState();
    }

    return ListView.builder(
      padding: const EdgeInsets.only(left: 16, right: 16, bottom: 100, top: 8),
      itemCount: widget.logs.length,
      itemBuilder: (context, index) {
        final log = widget.logs[index];
        final subtitle = DateFormat('HH:mm:ss').format(log.requestTime);

        return LongPressDraggable<ApiLogEntry>(
          data: log,
          feedback: Material(
            color: Colors.transparent,
            child: Opacity(
              opacity: 0.8,
              child: SizedBox(
                width: MediaQuery.of(context).size.width - 32,
                child: _buildLogCard(log, subtitle),
              ),
            ),
          ),
          childWhenDragging: Opacity(
            opacity: 0.3,
            child: _buildLogCard(log, subtitle),
          ),
          child: _buildLogCard(log, subtitle),
        );
      },
    );
  }
}

// --- MAIN SCREEN ---
class ApiLogListPage extends ConsumerStatefulWidget {
  const ApiLogListPage({super.key});

  @override
  ConsumerState<ApiLogListPage> createState() => _ApiLogListPageState();
}

class _ApiLogListPageState extends ConsumerState<ApiLogListPage>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  final List<String?> _tabs = [null, 'GET', 'POST', 'PUT', 'DELETE', 'PATCH'];
  Map<String?, List<ApiLogEntry>> _cachedFilteredLogs = {};

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: _tabs.length, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  void _computeFilteredLogs(List<ApiLogEntry> allLogs) {
    final newCachedLogs = <String?, List<ApiLogEntry>>{};
    for (final tab in _tabs) {
      if (tab == null) {
        newCachedLogs[tab] = allLogs;
      } else {
        newCachedLogs[tab] = allLogs.where((l) => l.method.toUpperCase() == tab).toList();
      }
    }
    _cachedFilteredLogs = newCachedLogs;
  }

  void _clearLogsInTab() {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final currentTab = _tabs[_tabController.index];
    final titleText = currentTab == null ? 'CLEAR ALL API LOGS' : 'CLEAR $currentTab LOGS';

    showModalBottomSheet(
      context: context,
      backgroundColor: Colors.transparent,
      isScrollControlled: true,
      builder: (ctx) => Container(
        decoration: BoxDecoration(
          color: isDark ? const Color(0xFF1C1C1E) : const Color(0xFFF2F2F7),
          borderRadius: const BorderRadius.vertical(top: Radius.circular(24)),
        ),
        padding: const EdgeInsets.only(
          left: 24,
          right: 24,
          top: 12,
          bottom: 48,
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              width: 40,
              height: 4,
              decoration: BoxDecoration(
                color: isDark ? Colors.white24 : Colors.black12,
                borderRadius: BorderRadius.circular(2),
              ),
            ),
            const SizedBox(height: 24),
            Center(
              child: Text(
                titleText,
                style: TextStyle(
                  fontFamily: 'Outfit',
                  fontSize: 13,
                  fontWeight: FontWeight.w700,
                  letterSpacing: 2.0,
                  color: isDark ? Colors.white54 : Colors.black54,
                ),
              ),
            ),
            const SizedBox(height: 32),
            SwipeToObliterateButton(
              title: 'SLIDE TO WIPE',
              isLoading: false,
              activeColor: Colors.redAccent,
              onConfirmed: () async {
                Navigator.pop(ctx);
                if (currentTab == null) {
                  ref.read(apiLoggerProvider.notifier).clearLogs();
                } else {
                  ref.read(apiLoggerProvider.notifier).clearLogsByMethod(currentTab);
                }
              },
            ),
          ],
        ),
      ),
    );
  }

  void _openLogDetail(ApiLogEntry log, bool isDark) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => ApiLogDetailPage(log: log),
      ),
    );
  }
  
  Widget _buildEdgeSwipeDetector() {
    return Positioned(
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
    );
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;
    final allLogs = ref.watch(apiLoggerProvider);

    _computeFilteredLogs(allLogs);

    return Scaffold(
      backgroundColor: isDark ? AppColors.backgroundDark : AppColors.backgroundLight,
      body: Stack(
        children: [
          SafeArea(
            child: Column(
              children: [
                // TabBar Only (No Header)
                Container(
                  margin: const EdgeInsets.only(
                    left: 16,
                    right: 16,
                    top: 16,
                    bottom: 8,
                  ),
                  decoration: BoxDecoration(
                    color: isDark
                        ? Colors.white.withValues(alpha: 0.05)
                        : Colors.black.withValues(alpha: 0.04),
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: TabBar(
                    controller: _tabController,
                    isScrollable: true,
                    dividerColor: Colors.transparent,
                    tabAlignment: TabAlignment.start,
                    indicator: BoxDecoration(
                      color: isDark
                          ? Colors.white.withValues(alpha: 0.15)
                          : Colors.white,
                      borderRadius: BorderRadius.circular(12),
                      boxShadow: isDark
                          ? []
                          : [
                              BoxShadow(
                                color: Colors.black.withValues(alpha: 0.04),
                                blurRadius: 8,
                                offset: const Offset(0, 2),
                              ),
                            ],
                    ),
                    indicatorSize: TabBarIndicatorSize.tab,
                    indicatorPadding: const EdgeInsets.all(4),
                    labelColor: isDark ? Colors.white : AppColors.primary,
                    unselectedLabelColor: isDark ? Colors.white54 : Colors.black54,
                    labelStyle: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 14,
                    ),
                    unselectedLabelStyle: const TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 14,
                    ),
                    splashBorderRadius: BorderRadius.circular(12),
                    tabs: _tabs
                        .map(
                          (tab) => Padding(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 8.0,
                            ),
                            child: Tab(text: tab == null ? '全部' : tab),
                          ),
                        )
                        .toList(),
                  ),
                ),

                // Native TabBarView with KeepAlive Tabs
                Expanded(
                  child: TabBarView(
                    controller: _tabController,
                    children: _tabs.map((tab) {
                      final filteredLogs = _cachedFilteredLogs[tab] ?? [];
                      return ApiLogListTab(
                        key: ValueKey(tab ?? 'all'),
                        logs: filteredLogs,
                        isDark: isDark,
                        onLogTap: _openLogDetail,
                      );
                    }).toList(),
                  ),
                ),
              ],
            ),
          ),

          // Floating Trash Can Target
          Positioned(
            bottom: 32,
            left: 0,
            right: 0,
            child: Center(
              child: DragTarget<ApiLogEntry>(
                onAcceptWithDetails: (details) {
                  final log = details.data;
                  ref.read(apiLoggerProvider.notifier).removeLog(log.id);
                },
                builder: (context, candidateData, rejectedData) {
                  final isHovering = candidateData.isNotEmpty;

                  return GestureDetector(
                    onTap: _clearLogsInTab,
                    child: AnimatedContainer(
                      duration: const Duration(milliseconds: 200),
                      width: isHovering ? 64 : 56,
                      height: isHovering ? 64 : 56,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: isHovering
                            ? Colors.redAccent.withValues(alpha: 0.9)
                            : (isDark
                                  ? Colors.black.withValues(alpha: 0.6)
                                  : Colors.white.withValues(alpha: 0.8)),
                        boxShadow: [
                          BoxShadow(
                            color: isHovering
                                ? Colors.redAccent.withValues(alpha: 0.4)
                                : Colors.black.withValues(alpha: 0.1),
                            blurRadius: isHovering ? 20 : 10,
                            offset: const Offset(0, 4),
                          ),
                        ],
                        border: Border.all(
                          color: isHovering
                              ? Colors.red
                              : (isDark ? Colors.white12 : Colors.black12),
                          width: isHovering ? 2 : 1,
                        ),
                      ),
                      child: ClipOval(
                        child: BackdropFilter(
                          filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
                          child: Icon(
                            isHovering
                                ? Icons.delete_forever
                                : Icons.delete_outline,
                            color: isHovering
                                ? Colors.white
                                : (isDark
                                      ? Colors.white70
                                      : Colors.black54),
                            size: isHovering ? 28 : 24,
                          ),
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
          ),
          
          // Edge Swipe Detector for popping the screen
          _buildEdgeSwipeDetector(),
        ],
      ),
    );
  }
}
