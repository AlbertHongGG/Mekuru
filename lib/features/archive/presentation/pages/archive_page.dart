import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mekuru/core/theme/app_colors.dart';
import 'package:mekuru/core/notifications/presentation/controllers/notification_controller.dart';
import 'package:mekuru/features/archive/presentation/providers/archive_provider.dart';
import 'package:mekuru/core/models/archive_task.dart';
import 'package:mekuru/core/widgets/comic_image.dart';

class ArchivePage extends ConsumerStatefulWidget {
  const ArchivePage({super.key});

  @override
  ConsumerState<ArchivePage> createState() => _ArchivePageState();
}

class _ArchivePageState extends ConsumerState<ArchivePage> with RouteAware {
  Timer? _pollingTimer;

  @override
  void initState() {
    super.initState();
    Future.microtask(() => ref.read(archiveProvider.notifier).loadTasks());
    _startPolling();
  }

  void _startPolling() {
    _pollingTimer = Timer.periodic(const Duration(seconds: 2), (_) {
      if (mounted) {
        ref.read(archiveProvider.notifier).loadTasks(silent: true);
      }
    });
  }

  @override
  void dispose() {
    _pollingTimer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(archiveProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('封存任務', style: TextStyle(fontWeight: FontWeight.bold)),
        centerTitle: true,
      ),
      body: _buildBody(context, ref, state),
    );
  }

  Widget _buildBody(BuildContext context, WidgetRef ref, ArchiveState state) {
    if (state.isLoading && state.tasks.isEmpty) {
      return const Center(child: CircularProgressIndicator(color: AppColors.primary));
    }

    if (state.error != null && state.tasks.isEmpty) {
      return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(Icons.error_outline_rounded, size: 48, color: Colors.redAccent),
            const SizedBox(height: 16),
            Text('錯誤: ' + state.error.toString(), style: const TextStyle(color: Colors.redAccent)),
            const SizedBox(height: 16),
            ElevatedButton.icon(
              onPressed: () => ref.read(archiveProvider.notifier).loadTasks(),
              icon: const Icon(Icons.refresh_rounded),
              label: const Text('重試'),
            ),
          ],
        ),
      );
    }

    if (state.tasks.isEmpty) {
      return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.inbox_rounded, size: 64, color: Colors.grey.withOpacity(0.5)),
            const SizedBox(height: 16),
            Text(
              '目前沒有進行中的封存任務',
              style: TextStyle(fontSize: 16, color: Colors.grey.withOpacity(0.8)),
            ),
          ],
        ),
      );
    }

    return RefreshIndicator(
      onRefresh: () => ref.read(archiveProvider.notifier).loadTasks(),
      color: AppColors.primary,
      child: ListView.separated(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        itemCount: state.tasks.length,
        separatorBuilder: (_, __) => const SizedBox(height: 16),
        itemBuilder: (context, index) {
          final task = state.tasks[index];
          final meta = state.metadata[task.comicId];
          final title = meta != null && meta['title'] != null ? meta['title'] as String : task.comicId;
          final coverUrl = meta != null && meta['cover_url'] != null ? meta['cover_url'] as String : null;
          
          final isDark = Theme.of(context).brightness == Brightness.dark;
          
          final totalImages = task.totalImages;
          final downloadedImages = task.downloadedImages;
          final hasImageStats = totalImages > 0;
          final progress = (hasImageStats ? task.imageProgress : task.progress).clamp(0.0, 1.0);
          
          return Container(
            decoration: BoxDecoration(
              color: isDark ? const Color(0xFF1E1E1E) : Colors.white,
              borderRadius: BorderRadius.circular(20),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(isDark ? 0.2 : 0.05),
                  blurRadius: 15,
                  offset: const Offset(0, 5),
                ),
              ],
            ),
            clipBehavior: Clip.antiAlias,
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(16),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        width: 72,
                        height: 96,
                        decoration: BoxDecoration(
                          color: isDark ? Colors.grey[800] : Colors.grey[200],
                          borderRadius: BorderRadius.circular(12),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.1),
                              blurRadius: 4,
                              offset: const Offset(0, 2),
                            ),
                          ],
                        ),
                        clipBehavior: Clip.antiAlias,
                        child: coverUrl != null 
                            ? ComicImage(imageUrl: coverUrl, fit: BoxFit.cover, providerId: task.providerId)
                            : const Center(child: Icon(Icons.image_not_supported_rounded, color: Colors.grey)),
                      ),
                      const SizedBox(width: 16),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Expanded(
                                  child: Text(
                                    title,
                                    style: const TextStyle(fontWeight: FontWeight.w800, fontSize: 16, height: 1.2),
                                    maxLines: 2,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ),
                                const SizedBox(width: 8),
                                _buildStatusBadge(task.status),
                              ],
                            ),
                            const SizedBox(height: 8),
                            Text(
                              '來源: ' + task.providerId,
                              style: TextStyle(
                                color: isDark ? Colors.white60 : Colors.black54,
                                fontSize: 12,
                              ),
                            ),
                            const SizedBox(height: 4),
                            Text(
                              hasImageStats 
                                  ? '已下載 ' + downloadedImages.toString() + ' / 總共 ' + totalImages.toString() + ' 頁'
                                  : '已下載 ' + task.completedChapters.toString() + ' / 總共 ' + task.totalChapters.toString() + ' 章節',
                              style: TextStyle(
                                color: isDark ? Colors.white70 : Colors.black87,
                                fontSize: 13,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                  color: isDark ? Colors.white.withOpacity(0.02) : Colors.black.withOpacity(0.02),
                  child: Row(
                    children: [
                      Expanded(
                        child: LayoutBuilder(
                          builder: (context, constraints) {
                            return Stack(
                              children: [
                                Container(
                                  height: 8,
                                  decoration: BoxDecoration(
                                    color: isDark ? Colors.white10 : Colors.black12,
                                    borderRadius: BorderRadius.circular(4),
                                  ),
                                ),
                                AnimatedContainer(
                                  duration: const Duration(milliseconds: 300),
                                  height: 8,
                                  width: constraints.maxWidth * progress, 
                                  decoration: BoxDecoration(
                                    color: _getStatusColor(task.status),
                                    borderRadius: BorderRadius.circular(4),
                                    boxShadow: [
                                      BoxShadow(
                                        color: _getStatusColor(task.status).withOpacity(0.3),
                                        blurRadius: 6,
                                        offset: const Offset(0, 2),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            );
                          },
                        ),
                      ),
                      const SizedBox(width: 12),
                      SizedBox(
                        width: 48,
                        child: Text(
                          ((progress * 100).toStringAsFixed(1)) + '%',
                          style: TextStyle(
                            fontSize: 13, 
                            fontWeight: FontWeight.w900,
                            color: _getStatusColor(task.status),
                          ),
                          textAlign: TextAlign.end,
                        ),
                      ),
                    ],
                  ),
                ),
                if (task.errorMessage != null && task.errorMessage!.isNotEmpty)
                  Container(
                    width: double.infinity,
                    padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                    color: Colors.redAccent.withOpacity(0.1),
                    child: Text(
                      '錯誤: ' + task.errorMessage!,
                      style: const TextStyle(color: Colors.redAccent, fontSize: 12, fontWeight: FontWeight.w500),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      if (task.status == 'downloading' || task.status == 'queued')
                        TextButton.icon(
                          icon: const Icon(Icons.pause_rounded, size: 20),
                          label: const Text('暫停', style: TextStyle(fontWeight: FontWeight.w600)),
                          onPressed: () => ref.read(archiveProvider.notifier).pauseTask(task.providerId, task.comicId),
                        )
                      else if (task.status == 'paused' || task.status == 'failed')
                        TextButton.icon(
                          icon: const Icon(Icons.play_arrow_rounded, size: 20),
                          label: const Text('繼續', style: TextStyle(fontWeight: FontWeight.w600)),
                          onPressed: () => ref.read(archiveProvider.notifier).resumeTask(task.providerId, task.comicId),
                        ),
                      const SizedBox(width: 8),
                      TextButton.icon(
                        icon: const Icon(Icons.delete_outline_rounded, size: 20, color: Colors.redAccent),
                        label: const Text('刪除', style: TextStyle(color: Colors.redAccent, fontWeight: FontWeight.w600)),
                        style: TextButton.styleFrom(foregroundColor: Colors.redAccent),
                        onPressed: () => _confirmDelete(context, ref, task),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
  
  Widget _buildStatusBadge(String status) {
    final color = _getStatusColor(status);
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      decoration: BoxDecoration(
        color: color.withOpacity(0.1),
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: color.withOpacity(0.3), width: 1),
      ),
      child: Text(
        status.toUpperCase(),
        style: TextStyle(
          color: color,
          fontSize: 10,
          fontWeight: FontWeight.w900,
          letterSpacing: 0.5,
        ),
      ),
    );
  }
  
  Color _getStatusColor(String status) {
    switch (status) {
      case 'downloading':
        return Colors.blueAccent;
      case 'queued':
        return Colors.orangeAccent;
      case 'paused':
        return Colors.grey;
      case 'completed':
        return Colors.green;
      case 'failed':
        return Colors.redAccent;
      default:
        return AppColors.primary;
    }
  }
  
  Future<void> _confirmDelete(BuildContext context, WidgetRef ref, ArchiveTask task) async {
    final result = await showDialog<bool>(
      context: context,
      builder: (context) => AlertDialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        title: const Text('確認刪除', style: TextStyle(fontWeight: FontWeight.bold)),
        content: const Text('您確定要刪除這個下載任務與已下載的檔案嗎？這項操作無法還原。'),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context, false),
            child: const Text('取消', style: TextStyle(fontWeight: FontWeight.w600)),
          ),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.redAccent,
              foregroundColor: Colors.white,
              elevation: 0,
            ),
            onPressed: () => Navigator.pop(context, true),
            child: const Text('刪除', style: TextStyle(fontWeight: FontWeight.bold)),
          ),
        ],
      ),
    );
    
    if (result == true) {
      final success = await ref.read(archiveProvider.notifier).cancelTask(task.providerId, task.comicId);
      final notificationCtrl = ref.read(notificationProvider.notifier);
      if (success) {
        notificationCtrl.showSuccess('已刪除任務');
      } else {
        notificationCtrl.showError('刪除失敗');
      }
    }
  }
}
