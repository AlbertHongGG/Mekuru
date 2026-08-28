import 'dart:async';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mekuru/core/models/archive_task.dart';
import 'package:mekuru/features/archive/domain/managers/i_archive_task_manager.dart';
import 'package:mekuru/features/archive/domain/services/archive_download_service.dart';

class ArchiveTaskManager extends Notifier<List<ArchiveTask>> implements IArchiveTaskManager {
  late ArchiveDownloadService _downloadService;
  StreamSubscription? _subscription;

  @override
  List<ArchiveTask> build() {
    _downloadService = ref.watch(archiveDownloadServiceProvider);
    
    // Initial state from memory if available
    final initialTasks = _downloadService.progressStream.isBroadcast 
        ? <ArchiveTask>[] // Wait for first emit
        : <ArchiveTask>[];
        
    _subscription?.cancel();
    _subscription = _downloadService.progressStream.listen((tasks) {
      state = tasks;
    });
    
    // We can fetch the current tasks directly but service emits initially
    return initialTasks;
  }

  @override
  Future<void> enqueueTask(String providerId, String comicId) async {
    await _downloadService.enqueueTask(providerId, comicId);
  }

  @override
  Future<void> pauseTask(String providerId, String comicId) async {
    await _downloadService.pauseTask(providerId, comicId);
  }

  @override
  Future<void> resumeTask(String providerId, String comicId) async {
    await _downloadService.resumeTask(providerId, comicId);
  }

  @override
  Future<void> cancelTask(String providerId, String comicId) async {
    await _downloadService.cancelTask(providerId, comicId);
  }
}

final archiveTaskManagerProvider = NotifierProvider<ArchiveTaskManager, List<ArchiveTask>>(() {
  return ArchiveTaskManager();
});
