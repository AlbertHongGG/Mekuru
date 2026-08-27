import 'dart:async';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mekuru/core/data/local/archive_storage.dart';
import 'package:mekuru/core/data/local/local_storage_providers.dart';
import 'package:mekuru/core/data/local/models/local_comic_entity.dart';
import 'package:mekuru/core/models/archive_task.dart';
import 'package:mekuru/core/data/sources/provider_registry.dart';
import 'package:mekuru/features/archive/domain/managers/i_archive_task_manager.dart';
import 'package:mekuru/features/archive/domain/managers/local_library_manager.dart';

class ArchiveTaskManager extends Notifier<List<ArchiveTask>> implements IArchiveTaskManager {
  late IArchiveTaskStorage _taskStorage;
  late IMediaStorage _mediaStorage;
  late ProviderRegistry _providerRegistry;

  bool _isProcessing = false;

  @override
  List<ArchiveTask> build() {
    _taskStorage = ref.watch(archiveTaskStorageProvider);
    _mediaStorage = ref.watch(mediaStorageProvider);
    _providerRegistry = ref.watch(providerRegistryProvider);
    
    Future.microtask(_init);
    return [];
  }

  Future<void> _init() async {
    final tasks = await _taskStorage.getActiveTasks();
    state = tasks;
    
    bool hasActive = false;
    final newTasks = state.map((t) {
      if (t.status == ArchiveTaskStatus.downloading || t.status == ArchiveTaskStatus.queued) {
        hasActive = true;
        return t.copyWith(status: ArchiveTaskStatus.queued);
      }
      return t;
    }).toList();
    
    if (hasActive) {
      state = newTasks;
      for (final t in newTasks) {
        await _taskStorage.saveTask(t);
      }
      _processQueue();
    }
  }

  @override
  Future<void> enqueueTask(String providerId, String comicId) async {
    final existing = state.firstWhere(
      (t) => t.providerId == providerId && t.comicId == comicId, 
      orElse: () => const ArchiveTask(providerId: '', comicId: '')
    );
    
    if (existing.providerId.isNotEmpty) {
      if (existing.status == ArchiveTaskStatus.paused || existing.status == ArchiveTaskStatus.error) {
        await resumeTask(providerId, comicId);
      }
      return;
    }

    try {
      final provider = _providerRegistry.getProvider(providerId);
      final detailResult = await provider.getComicDetail(comicId);
      
      String comicTitle = '';
      String coverUrl = '';
      if (detailResult.isSuccess) {
         final d = detailResult.getOrThrow();
         comicTitle = d.title ?? '';
         coverUrl = d.coverUrl ?? '';
      }
      
      final task = ArchiveTask(
        providerId: providerId,
        comicId: comicId,
        comicTitle: comicTitle,
        coverUrl: coverUrl,
        status: ArchiveTaskStatus.queued,
        createdAt: DateTime.now(),
        updatedAt: DateTime.now(),
      );
      
      await _taskStorage.saveTask(task);
      state = [...state, task];
      
      _processQueue();
    } catch (e) {
      // Could push an error state or let UI handle the exception
      throw Exception('Failed to enqueue task: $e');
    }
  }

  @override
  Future<void> pauseTask(String providerId, String comicId) async {
    final idx = state.indexWhere((t) => t.providerId == providerId && t.comicId == comicId);
    if (idx != -1) {
      final t = state[idx].copyWith(status: ArchiveTaskStatus.paused, updatedAt: DateTime.now());
      await _taskStorage.saveTask(t);
      state = [...state]..[idx] = t;
    }
  }

  @override
  Future<void> resumeTask(String providerId, String comicId) async {
    final idx = state.indexWhere((t) => t.providerId == providerId && t.comicId == comicId);
    if (idx != -1) {
      final t = state[idx].copyWith(status: ArchiveTaskStatus.queued, errorMessage: null, updatedAt: DateTime.now());
      await _taskStorage.saveTask(t);
      state = [...state]..[idx] = t;
      _processQueue();
    }
  }

  @override
  Future<void> cancelTask(String providerId, String comicId) async {
    final idx = state.indexWhere((t) => t.providerId == providerId && t.comicId == comicId);
    if (idx != -1) {
      final task = state[idx];
      state = state.where((t) => t.taskId != task.taskId).toList();
      await _taskStorage.deleteTask(task.taskId);
    }
  }

  void _updateTask(ArchiveTask task) {
    final idx = state.indexWhere((t) => t.taskId == task.taskId);
    if (idx != -1) {
      state = [...state]..[idx] = task;
      _taskStorage.saveTask(task);
    }
  }

  Future<void> _processQueue() async {
    if (_isProcessing) return;
    _isProcessing = true;

    try {
      while (true) {
        final activeTasks = state.where((t) => t.status == ArchiveTaskStatus.queued || t.status == ArchiveTaskStatus.downloading).toList();
        if (activeTasks.isEmpty) break;

        final task = activeTasks.first;
        if (task.status == ArchiveTaskStatus.queued) {
          _updateTask(task.copyWith(status: ArchiveTaskStatus.downloading));
        }
        
        await _downloadComic(task);
      }
    } finally {
      _isProcessing = false;
    }
  }

  Future<void> _downloadComic(ArchiveTask initialTask) async {
    ArchiveTask task = initialTask;
    final provider = _providerRegistry.getProvider(task.providerId);
    
    try {
      LocalComicEntity? localComic;
      
      // 1. Fetch metadata and chapter list if not already done
      if (task.chapters.isEmpty) {
        final detailResult = await provider.getComicDetail(task.comicId);
        final comicDetail = detailResult.getOrThrow();
        
        // Explicitly request ascending order (chronological) from the provider
        final chaptersResult = await provider.getChapterList(task.comicId, isDescending: false);
        final chapters = chaptersResult.getOrThrow();
        
        // Prepare local entity representation
        localComic = LocalComicEntity(
          providerId: task.providerId,
          comicId: task.comicId,
          title: comicDetail.title ?? '',
          coverUrl: comicDetail.coverUrl ?? '',
          tags: comicDetail.tags,
          author: comicDetail.author ?? '',
          description: comicDetail.description ?? '',
          chapterIds: chapters.map((c) => c.id).toList(),
          archivedAt: DateTime.now(),
        );
        
        // Save initial skeleton to library
        await ref.read(localLibraryManagerProvider).saveComic(localComic);
        
        final chapterTasks = <String, ChapterTask>{};
        for (final ch in chapters) {
          chapterTasks[ch.id] = ChapterTask(
            chapterId: ch.id,
            title: ch.title,
            status: ArchiveTaskStatus.queued,
          );
        }
        
        task = task.copyWith(chapters: chapterTasks, coverUrl: comicDetail.coverUrl ?? task.coverUrl);
        _updateTask(task);
      } else {
        // Retrieve existing skeleton if resuming
        localComic = await ref.read(localLibraryManagerProvider).getComic(task.comicId);
      }
      
      // 2. Download Chapters
      for (final chId in task.chapters.keys) {
        final currentTask = state.firstWhere((t) => t.taskId == task.taskId, orElse: () => task);
        if (currentTask.status != ArchiveTaskStatus.downloading) {
          return; // Task paused or cancelled
        }
        
        task = currentTask; 
        final chTask = task.chapters[chId]!;
        if (chTask.status == ArchiveTaskStatus.completed) continue;
        
        task = _updateChapterTask(task.taskId, chTask.copyWith(status: ArchiveTaskStatus.downloading));
        
        try {
          final pagesResult = await provider.getChapterImages(task.comicId, chId);
          final pages = pagesResult.getOrThrow();
          
          task = _updateChapterTask(task.taskId, task.chapters[chId]!.copyWith(totalPages: pages.length));
          
          int downloaded = task.chapters[chId]!.downloadedPages;
          for (int i = downloaded; i < pages.length; i++) {
             final checkTask = state.firstWhere((t) => t.taskId == task.taskId, orElse: () => task);
             if (checkTask.status != ArchiveTaskStatus.downloading) return;
             
             final page = pages[i];
             final bytes = await provider.fetchImageBytes(page.imageUrl);
             
             String ext = 'jpg';
             if (page.imageUrl.contains('.png')) ext = 'png';
             else if (page.imageUrl.contains('.webp')) ext = 'webp';
             
             await _mediaStorage.saveImage(task.providerId, task.comicId, chId, i, bytes, ext);
             
             downloaded++;
             task = _updateChapterTask(task.taskId, task.chapters[chId]!.copyWith(downloadedPages: downloaded));
          }
          
          task = _updateChapterTask(task.taskId, task.chapters[chId]!.copyWith(status: ArchiveTaskStatus.completed));
          
        } catch (e) {
          task = _updateChapterTask(task.taskId, task.chapters[chId]!.copyWith(status: ArchiveTaskStatus.error, errorMessage: e.toString()));
          rethrow;
        }
      }
      
      // 3. Finalize
      final finalTask = state.firstWhere((t) => t.taskId == task.taskId, orElse: () => task);
      if (finalTask.status == ArchiveTaskStatus.downloading) {
         _updateTask(finalTask.copyWith(status: ArchiveTaskStatus.completed, updatedAt: DateTime.now()));
         
         // Explicitly update Library Manager that it is complete (archivedAt)
         if (localComic != null) {
           await ref.read(localLibraryManagerProvider).saveComic(
             localComic.copyWith(archivedAt: DateTime.now())
           );
         }
      }
      
    } catch (e) {
       final errTask = state.firstWhere((t) => t.taskId == task.taskId, orElse: () => task);
       if (errTask.status == ArchiveTaskStatus.downloading) {
         _updateTask(errTask.copyWith(status: ArchiveTaskStatus.error, errorMessage: e.toString(), updatedAt: DateTime.now()));
       }
    }
  }
  
  ArchiveTask _updateChapterTask(String taskId, ChapterTask chTask) {
    final idx = state.indexWhere((t) => t.taskId == taskId);
    if (idx == -1) {
      // If task was cancelled while updating, just return a dummy
      return ArchiveTask(providerId: '', comicId: ''); 
    }
    final currentTask = state[idx];
    final newChapters = Map<String, ChapterTask>.from(currentTask.chapters);
    newChapters[chTask.chapterId] = chTask;
    final newTask = currentTask.copyWith(chapters: newChapters, updatedAt: DateTime.now());
    _updateTask(newTask);
    return newTask;
  }
}

final archiveTaskManagerProvider = NotifierProvider<ArchiveTaskManager, List<ArchiveTask>>(() {
  return ArchiveTaskManager();
});
