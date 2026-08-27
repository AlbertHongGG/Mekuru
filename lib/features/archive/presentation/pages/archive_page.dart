import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mekuru/core/theme/app_colors.dart';
import 'package:mekuru/core/notifications/presentation/controllers/notification_controller.dart';
import 'package:mekuru/features/archive/presentation/providers/archive_provider.dart';
import 'package:mekuru/core/models/archive_task.dart';
import 'package:mekuru/core/widgets/comic_image.dart';

class ArchivePage extends ConsumerWidget {
  const ArchivePage({super.key});

  ChapterTask? _getCurrentChapter(ArchiveTask task) {
    for (final ch in task.chapters.values) {
      if (ch.status == ArchiveTaskStatus.downloading) return ch;
    }
    for (final ch in task.chapters.values) {
      if (ch.status == ArchiveTaskStatus.queued) return ch;
    }
    return null;
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
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
            Text('錯誤: ${state.error}', style: const TextStyle(color: Colors.redAccent)),
          ],
        ),
      );
    }

    if (state.tasks.isEmpty) {
      return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.inbox_rounded, size: 64, color: Colors.grey.withValues(alpha: 0.5)),
            const SizedBox(height: 16),
            Text(
              '目前沒有進行中的封存任務',
              style: TextStyle(fontSize: 16, color: Colors.grey.withValues(alpha: 0.8)),
            ),
          ],
        ),
      );
    }

    return ListView.separated(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      itemCount: state.tasks.length,
      separatorBuilder: (_, __) => const SizedBox(height: 16),
      itemBuilder: (context, index) {
        final task = state.tasks[index];
        final title = task.comicTitle.isNotEmpty ? task.comicTitle : task.comicId;
        final coverUrl = task.coverUrl.isNotEmpty ? task.coverUrl : null;
        
        final isDark = Theme.of(context).brightness == Brightness.dark;
        final currentChapter = _getCurrentChapter(task);
        
        return Container(
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: isDark ? const Color(0xFF1E1E1E) : Colors.white,
            borderRadius: BorderRadius.circular(20),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withValues(alpha: isDark ? 0.2 : 0.05),
                blurRadius: 15,
                offset: const Offset(0, 5),
              ),
            ],
          ),
          clipBehavior: Clip.antiAlias,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Top Row: Badge & Actions
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  _buildStatusBadge(task.status.name),
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      if (task.status == ArchiveTaskStatus.downloading || task.status == ArchiveTaskStatus.queued)
                        InkWell(
                          onTap: () => ref.read(archiveProvider.notifier).pauseTask(task.providerId, task.comicId),
                          borderRadius: BorderRadius.circular(20),
                          child: const Padding(
                            padding: EdgeInsets.all(4.0),
                            child: Icon(Icons.pause_rounded, size: 22, color: AppColors.primary),
                          ),
                        )
                      else if (task.status == ArchiveTaskStatus.paused || task.status == ArchiveTaskStatus.error)
                        InkWell(
                          onTap: () => ref.read(archiveProvider.notifier).resumeTask(task.providerId, task.comicId),
                          borderRadius: BorderRadius.circular(20),
                          child: const Padding(
                            padding: EdgeInsets.all(4.0),
                            child: Icon(Icons.play_arrow_rounded, size: 22, color: AppColors.primary),
                          ),
                        ),
                      const SizedBox(width: 16),
                      InkWell(
                        onTap: () => _confirmDelete(context, ref, task),
                        borderRadius: BorderRadius.circular(20),
                        child: const Padding(
                          padding: EdgeInsets.all(4.0),
                          child: Icon(Icons.delete_outline_rounded, size: 22, color: Colors.redAccent),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              const SizedBox(height: 12),
              
              // Body: Image + Content
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Cover Image
                  Container(
                    width: 84,
                    height: 112,
                    decoration: BoxDecoration(
                      color: isDark ? Colors.grey[800] : Colors.grey[200],
                      borderRadius: BorderRadius.circular(12),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withValues(alpha: 0.1),
                          blurRadius: 4,
                          offset: const Offset(0, 2),
                        ),
                      ],
                    ),
                    clipBehavior: Clip.antiAlias,
                    child: Builder(
                      builder: (context) {
                        if (coverUrl == null) {
                          return const Center(child: Icon(Icons.image_not_supported_rounded, color: Colors.grey));
                        }
                        
                        return ComicImage(imageUrl: coverUrl, fit: BoxFit.cover, providerId: task.providerId);
                      },
                    ),
                  ),
                  const SizedBox(width: 16),
                  // Content
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // Title
                        Text(
                          title,
                          style: const TextStyle(fontWeight: FontWeight.w800, fontSize: 16, height: 1.3),
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                        ),
                        const SizedBox(height: 4),
                        // Subtitle (Provider)
                        Text(
                          '來源: ${task.providerId}',
                          style: TextStyle(
                            color: isDark ? Colors.white54 : Colors.black45,
                            fontSize: 12,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        const SizedBox(height: 16),
                        
                        // Progress Bars
                        _buildProgressBar(
                          context: context,
                          isDark: isDark,
                          label: '整體進度',
                          valueText: '${task.completedChapters} / ${task.totalChapters} 章',
                          progress: task.progress.clamp(0.0, 1.0),
                          color: _getStatusColor(task.status.name),
                        ),
                        if (currentChapter != null) ...[
                          const SizedBox(height: 10),
                          _buildProgressBar(
                            context: context,
                            isDark: isDark,
                            label: currentChapter.title,
                            valueText: '${currentChapter.downloadedPages} / ${currentChapter.totalPages} 頁',
                            progress: currentChapter.totalPages > 0 
                                ? (currentChapter.downloadedPages / currentChapter.totalPages).clamp(0.0, 1.0) 
                                : 0.0,
                            color: _getStatusColor(task.status.name),
                          ),
                        ],
                        
                        if (task.errorMessage != null && task.errorMessage!.isNotEmpty) ...[
                          const SizedBox(height: 12),
                          Container(
                            padding: const EdgeInsets.all(8),
                            decoration: BoxDecoration(
                              color: Colors.redAccent.withValues(alpha: 0.1),
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: Text(
                              '錯誤: ${task.errorMessage}',
                              style: const TextStyle(color: Colors.redAccent, fontSize: 12, fontWeight: FontWeight.w500),
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                        ],
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        );
      },
    );
  }
  
  Widget _buildProgressBar({
    required BuildContext context,
    required bool isDark,
    required String label,
    required String valueText,
    required double progress,
    required Color color,
  }) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: Text(
                label,
                style: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w600,
                  color: isDark ? Colors.white70 : Colors.black87,
                ),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
            ),
            const SizedBox(width: 8),
            Text(
              valueText,
              style: TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.w800,
                color: color,
              ),
            ),
          ],
        ),
        const SizedBox(height: 6),
        LayoutBuilder(
          builder: (context, constraints) {
            return Stack(
              children: [
                Container(
                  height: 6,
                  decoration: BoxDecoration(
                    color: isDark ? Colors.white10 : Colors.black12,
                    borderRadius: BorderRadius.circular(3),
                  ),
                ),
                AnimatedContainer(
                  duration: const Duration(milliseconds: 300),
                  height: 6,
                  width: constraints.maxWidth * progress, 
                  decoration: BoxDecoration(
                    color: color,
                    borderRadius: BorderRadius.circular(3),
                    boxShadow: [
                      BoxShadow(
                        color: color.withValues(alpha: 0.4),
                        blurRadius: 4,
                        offset: const Offset(0, 1),
                      ),
                    ],
                  ),
                ),
              ],
            );
          },
        ),
      ],
    );
  }
  
  Widget _buildStatusBadge(String status) {
    final color = _getStatusColor(status);
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      decoration: BoxDecoration(
        color: color.withValues(alpha: 0.1),
        borderRadius: BorderRadius.circular(6),
        border: Border.all(color: color.withValues(alpha: 0.3), width: 1),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            width: 6,
            height: 6,
            decoration: BoxDecoration(
              color: color,
              shape: BoxShape.circle,
            ),
          ),
          const SizedBox(width: 6),
          Text(
            status.toUpperCase(),
            style: TextStyle(
              color: color,
              fontSize: 10,
              fontWeight: FontWeight.w900,
              letterSpacing: 0.5,
            ),
          ),
        ],
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
      case 'error':
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
      final success = await ref.read(archiveProvider.notifier).deleteComic(task.providerId, task.comicId);
      final notificationCtrl = ref.read(notificationProvider.notifier);
      if (success) {
        notificationCtrl.showSuccess('已刪除任務');
      } else {
        notificationCtrl.showError('刪除失敗');
      }
    }
  }
}
