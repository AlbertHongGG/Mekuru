import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mekuru/features/archive/domain/models/archive_task.dart';
import 'package:mekuru/features/archive/domain/managers/archive_task_manager.dart';
import 'package:mekuru/features/archive/domain/managers/local_library_manager.dart';

class ArchiveState {
  final bool isLoading;
  final List<ArchiveTask> tasks;
  final String? error;

  ArchiveState({
    this.isLoading = false,
    this.tasks = const [],
    this.error,
  });

  ArchiveState copyWith({
    bool? isLoading,
    List<ArchiveTask>? tasks,
    String? error,
    bool clearError = false,
  }) {
    return ArchiveState(
      isLoading: isLoading ?? this.isLoading,
      tasks: tasks ?? this.tasks,
      error: clearError ? null : (error ?? this.error),
    );
  }
}

class ArchiveNotifier extends Notifier<ArchiveState> {
  @override
  ArchiveState build() {
    // Reactively watch the task list from ArchiveTaskManager
    final tasks = ref.watch(archiveTaskManagerProvider);
    return ArchiveState(tasks: tasks);
  }

  Future<bool> pauseTask(String providerId, String comicId) async {
    await ref.read(archiveTaskManagerProvider.notifier).pauseTask(providerId, comicId);
    return true;
  }

  Future<bool> resumeTask(String providerId, String comicId) async {
    await ref.read(archiveTaskManagerProvider.notifier).resumeTask(providerId, comicId);
    return true;
  }

  Future<bool> cancelTask(String providerId, String comicId) async {
    // Used specifically for cancelling an ongoing download without wiping previously saved local data
    await ref.read(archiveTaskManagerProvider.notifier).cancelTask(providerId, comicId);
    return true;
  }

  Future<bool> deleteComic(String providerId, String comicId) async {
    // Now explicitly delegates to LocalLibraryManager which safely halts tasks and wipes media
    try {
      await ref.read(localLibraryManagerProvider).deleteComic(providerId, comicId);
      return true;
    } catch (e) {
      return false;
    }
  }

  Future<String?> startDownload(String providerId, String comicId) async {
    try {
      await ref.read(archiveTaskManagerProvider.notifier).enqueueTask(providerId, comicId);
      return null;
    } catch (e) {
      return e.toString();
    }
  }
}

final archiveProvider = NotifierProvider<ArchiveNotifier, ArchiveState>(() {
  return ArchiveNotifier();
});
