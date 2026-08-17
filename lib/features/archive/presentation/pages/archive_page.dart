import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mekuru/core/theme/app_colors.dart';
import 'package:mekuru/features/archive/presentation/providers/archive_provider.dart';

class ArchivePage extends ConsumerWidget {
  const ArchivePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(archiveProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('封存任務'),
        actions: [
          IconButton(
            icon: const Icon(Icons.refresh),
            onPressed: () => ref.read(archiveProvider.notifier).loadTasks(),
          ),
        ],
      ),
      body: _buildBody(context, ref, state),
    );
  }

  Widget _buildBody(BuildContext context, WidgetRef ref, ArchiveState state) {
    if (state.isLoading && state.tasks.isEmpty) {
      return const Center(child: CircularProgressIndicator(color: AppColors.primary));
    }

    if (state.error != null && state.tasks.isEmpty) {
      return Center(child: Text('錯誤: ${state.error}'));
    }

    if (state.tasks.isEmpty) {
      return const Center(child: Text('目前沒有進行中的封存任務'));
    }

    return RefreshIndicator(
      onRefresh: () => ref.read(archiveProvider.notifier).loadTasks(),
      color: AppColors.primary,
      child: ListView.builder(
        itemCount: state.tasks.length,
        itemBuilder: (context, index) {
          final task = state.tasks[index];
          return ListTile(
            leading: const Icon(Icons.downloading, color: AppColors.primary),
            title: Text(task.comicId), // In reality we'd fetch comic metadata or include title in task
            subtitle: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(task.status ?? '處理中...'),
                const SizedBox(height: 8),
                LinearProgressIndicator(
                  value: task.progress / 100,
                  backgroundColor: Colors.grey.withOpacity(0.2),
                  valueColor: const AlwaysStoppedAnimation<Color>(AppColors.primary),
                ),
              ],
            ),
            trailing: Text('${task.progress.toInt()}%'),
            isThreeLine: true,
          );
        },
      ),
    );
  }
}
