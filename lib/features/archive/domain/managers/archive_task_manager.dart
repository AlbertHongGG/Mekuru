import 'dart:async';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mekuru/features/archive/data/sources/archive_storage.dart';
import 'package:mekuru/features/archive/domain/models/archive_task.dart';
import 'package:mekuru/features/comic/data/sources/provider_registry.dart';
import 'package:mekuru/features/archive/domain/managers/i_local_library_manager.dart';
import 'package:mekuru/features/archive/domain/managers/local_library_manager.dart';
import 'package:mekuru/core/data/local/models/local_comic_entity.dart';
import 'package:mekuru/core/data/local/models/local_chapter_entity.dart';
import 'package:mekuru/core/data/local/local_storage_providers.dart';
import 'package:mekuru/features/archive/domain/managers/i_archive_task_manager.dart';

class ArchiveTaskManager extends Notifier<List<ArchiveTask>> implements IArchiveTaskManager {
  late IArchiveTaskStorage _taskStorage;
  late IMediaStorage _mediaStorage;
  late ProviderRegistry _providerRegistry;
  late ILocalLibraryManager _libraryManager;

  bool _isProcessing = false;

  @override
  List<ArchiveTask> build() {
    _taskStorage = ref.watch(archiveTaskStorageProvider);
    _mediaStorage = ref.watch(mediaStorageProvider);
    _providerRegistry = ref.watch(providerRegistryProvider);
    _libraryManager = ref.watch(localLibraryManagerProvider);
    
    Future.microtask(() => _init());
    return [];
  }

  Future<void> _init() async {
    final tasks = await _taskStorage.getActiveTasks();
    
    bool hasActive = false;
    final newTasks = <ArchiveTask>[];
    for (int i = 0; i < tasks.length; i++) {
      var task = tasks[i];
      if (task.status == ArchiveTaskStatus.downloading || task.status == ArchiveTaskStatus.queued) {
        hasActive = true;
        task = task.copyWith(status: ArchiveTaskStatus.queued);
        await _taskStorage.saveTask(task);
      }
      newTasks.add(task);
    }
    
    state = newTasks;
    if (hasActive) {
      _processQueue();
    }
  }

  Future<void> reloadTasksFromStorage() async {
    final storedTasks = await _taskStorage.getActiveTasks();
    final newTasks = List<ArchiveTask>.from(state);
    
    for (final st in storedTasks) {
      final index = newTasks.indexWhere((t) => t.taskId == st.taskId);
      if (index == -1) {
        newTasks.add(st);
      } else {
        newTasks[index] = st;
      }
    }
    state = newTasks;
    _processQueue();
  }

  Future<void> _persistTask(ArchiveTask task) async {
    await _taskStorage.saveTask(task);
  }

  void _updateTaskMemory(ArchiveTask task, {bool persist = false}) {
    final idx = state.indexWhere((t) => t.taskId == task.taskId);
    if (idx != -1) {
      final newTasks = List<ArchiveTask>.from(state);
      newTasks[idx] = task;
      state = newTasks;
      if (persist) {
        _persistTask(task);
      }
    }
  }

  ArchiveTask _updateChapterMemory(String taskId, ChapterTask chTask, {bool persist = false}) {
    final idx = state.indexWhere((t) => t.taskId == taskId);
    if (idx == -1) return const ArchiveTask(providerId: '', comicId: '');
    final currentTask = state[idx];
    final newChapters = Map<String, ChapterTask>.from(currentTask.chapters);
    newChapters[chTask.chapterId] = chTask;
    final newTask = currentTask.copyWith(chapters: newChapters, updatedAt: DateTime.now());
    _updateTaskMemory(newTask, persist: persist);
    return newTask;
  }

  @override
  Future<void> enqueueTask(String providerId, String comicId) async {
    final idx = state.indexWhere((t) => t.providerId == providerId && t.comicId == comicId);
    if (idx != -1) {
      final existing = state[idx];
      if (existing.status == ArchiveTaskStatus.paused || existing.status == ArchiveTaskStatus.error) {
        await resumeTask(providerId, comicId);
      }
      return;
    }

    try {
      final provider = _providerRegistry.getProvider(providerId);
      final detailResult = await provider.getComicDetail(comicId);
      
      String comicTitle = 'Loading...';
      String coverUrl = '';
      if (detailResult.isSuccess) {
         final d = detailResult.getOrThrow();
         comicTitle = d.title;
         coverUrl = d.coverUrl;
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
      
      state = [...state, task];
      await _persistTask(task);
      _processQueue();
    } catch (e) {
      throw Exception('Failed to enqueue task: $e');
    }
  }

  @override
  Future<int> enqueueUpdateTask(String providerId, String comicId) async {
    final provider = _providerRegistry.getProvider(providerId);
    final detailResult = await provider.getComicDetail(comicId);
    if (detailResult.isFailure) throw Exception('Failed to get comic details');
    final comicDetail = detailResult.getOrThrow();
    
    final chaptersResult = await provider.getChapterList(comicId, isDescending: false);
    if (chaptersResult.isFailure) throw Exception('Failed to get chapters');
    final remoteChapters = chaptersResult.getOrThrow();

    final localComic = await _libraryManager.getComic(comicId);
    if (localComic == null) throw Exception('Comic not found locally. Please perform a full download first.');

    final newChapterIds = remoteChapters.map((c) => c.id).where((id) => !localComic.chapterIds.contains(id)).toList();
    
    if (newChapterIds.isEmpty) {
      return 0; // nothing to update
    }

    final newRemoteChapters = remoteChapters.where((c) => newChapterIds.contains(c.id)).toList();
    
    final newLocalChapters = List<LocalChapterEntity>.from(localComic.chapters);
    for (final ch in newRemoteChapters) {
      newLocalChapters.add(LocalChapterEntity(
        chapterId: ch.id,
        title: ch.title,
        archivedAt: null, // Will be populated when the chapter finishes downloading
      ));
    }

    final updatedComic = localComic.copyWith(
      chapterIds: remoteChapters.map((c) => c.id).toList(),
      chapters: newLocalChapters,
      title: comicDetail.title,
      coverUrl: comicDetail.coverUrl,
    );
    await _libraryManager.saveComic(updatedComic);

    final chapterTasks = <String, ChapterTask>{};
    for (final ch in newRemoteChapters) {
      chapterTasks[ch.id] = ChapterTask(
        chapterId: ch.id,
        title: ch.title,
        status: ArchiveTaskStatus.queued,
      );
    }

    final taskId = '${providerId}_$comicId';
    final existingIndex = state.indexWhere((t) => t.taskId == taskId);

    if (existingIndex != -1) {
      var existingTask = state[existingIndex];
      final newChapters = Map<String, ChapterTask>.from(existingTask.chapters);
      newChapters.addAll(chapterTasks);
      existingTask = existingTask.copyWith(
        chapters: newChapters,
        status: ArchiveTaskStatus.queued,
        updatedAt: DateTime.now(),
      );
      _updateTaskMemory(existingTask, persist: true);
    } else {
      final task = ArchiveTask(
        providerId: providerId,
        comicId: comicId,
        comicTitle: comicDetail.title,
        coverUrl: comicDetail.coverUrl,
        chapters: chapterTasks,
        createdAt: DateTime.now(),
        updatedAt: DateTime.now(),
      );
      state = [...state, task];
      await _taskStorage.saveTask(task);
    }

    _processQueue();
    return newChapterIds.length;
  }

  @override
  Future<void> pauseTask(String providerId, String comicId) async {
    final idx = state.indexWhere((t) => t.providerId == providerId && t.comicId == comicId);
    if (idx != -1) {
      final t = state[idx].copyWith(status: ArchiveTaskStatus.paused, updatedAt: DateTime.now());
      _updateTaskMemory(t, persist: true);
    }
  }

  @override
  Future<void> resumeTask(String providerId, String comicId) async {
    final idx = state.indexWhere((t) => t.providerId == providerId && t.comicId == comicId);
    if (idx != -1) {
      final t = state[idx].copyWith(status: ArchiveTaskStatus.queued, errorMessage: null, updatedAt: DateTime.now());
      _updateTaskMemory(t, persist: true);
      _processQueue();
    }
  }

  @override
  Future<void> cancelTask(String providerId, String comicId) async {
    final idx = state.indexWhere((t) => t.providerId == providerId && t.comicId == comicId);
    if (idx != -1) {
      final task = state[idx];
      final newTasks = List<ArchiveTask>.from(state);
      newTasks.removeAt(idx);
      state = newTasks;
      await _taskStorage.deleteTask(task.taskId);
    }
  }

  Future<void> _processQueue() async {
    if (_isProcessing) return;
    _isProcessing = true;

    try {
      while (true) {
        final activeTasks = state.where((t) => t.status == ArchiveTaskStatus.queued || t.status == ArchiveTaskStatus.downloading).toList();
        if (activeTasks.isEmpty) break;

        ArchiveTask task = activeTasks.first;

        if (task.status == ArchiveTaskStatus.queued) {
          task = task.copyWith(status: ArchiveTaskStatus.downloading, updatedAt: DateTime.now());
          _updateTaskMemory(task, persist: true);
        }

        try {
          final provider = _providerRegistry.getProvider(task.providerId);
          await _mediaStorage.getComicDirectory(task.providerId, task.comicId);
          
          LocalComicEntity? localComic = await _libraryManager.getComic(task.comicId);
          
          // 1. Fetch metadata and chapters if task has no chapters
          if (task.chapters.isEmpty) {
            final detailResult = await provider.getComicDetail(task.comicId);
            if (detailResult.isFailure) throw Exception('Failed to fetch comic details');
            final comicDetail = detailResult.getOrThrow();
            
            final chaptersResult = await provider.getChapterList(task.comicId, isDescending: false);
            if (chaptersResult.isFailure) throw Exception('Failed to fetch chapters');
            final chapters = chaptersResult.getOrThrow();
            
            final chapterTasks = <String, ChapterTask>{};
            final localChapters = <LocalChapterEntity>[];
            
            for (final ch in chapters) {
              chapterTasks[ch.id] = ChapterTask(
                chapterId: ch.id,
                title: ch.title,
                status: ArchiveTaskStatus.queued,
              );
              localChapters.add(LocalChapterEntity(
                chapterId: ch.id,
                title: ch.title,
                archivedAt: null, // Will be updated when actually downloaded
              ));
            }
            
            localComic = LocalComicEntity(
              comicId: task.comicId,
              providerId: task.providerId,
              archivedAt: DateTime.now(),
              chapterIds: chapters.map((c) => c.id).toList(),
              chapters: localChapters,
              tags: comicDetail.tags,
              author: comicDetail.author,
              description: comicDetail.description,
              coverUrl: comicDetail.coverUrl,
              title: comicDetail.title,
            );
            await _libraryManager.saveComic(localComic);
            
            task = task.copyWith(
              chapters: chapterTasks,
              comicTitle: comicDetail.title,
              coverUrl: comicDetail.coverUrl,
            );
            _updateTaskMemory(task, persist: true);
          }
          
          // 2. Download Chapters
          for (final chId in task.chapters.keys) {
            final currentTask = state.firstWhere((t) => t.taskId == task.taskId, orElse: () => task);
            if (currentTask.status != ArchiveTaskStatus.downloading) {
              return; 
            }
            
            task = currentTask; 
            final chTask = task.chapters[chId]!;
            if (chTask.status == ArchiveTaskStatus.completed) continue;
            
            task = _updateChapterMemory(task.taskId, chTask.copyWith(status: ArchiveTaskStatus.downloading), persist: true);
            
            try {
              final pagesResult = await provider.getChapterImages(task.comicId, chId);
              final pages = pagesResult.getOrThrow();
              
              task = _updateChapterMemory(task.taskId, task.chapters[chId]!.copyWith(totalPages: pages.length), persist: true);
              
              int downloaded = task.chapters[chId]!.downloadedPages;
              
              const int batchSize = 5;
              for (int i = downloaded; i < pages.length; i += batchSize) {
                 final checkTask = state.firstWhere((t) => t.taskId == task.taskId, orElse: () => task);
                 if (checkTask.status != ArchiveTaskStatus.downloading) return;
                 
                 final end = (i + batchSize < pages.length) ? i + batchSize : pages.length;
                 final batch = pages.sublist(i, end);
                 
                 await Future.wait(batch.asMap().entries.map((entry) async {
                   final pageIndex = i + entry.key;
                   final page = entry.value;
                   
                   final bytes = await provider.fetchImageBytes(page.imageUrl);
                   
                   String ext = 'jpg';
                   if (page.imageUrl.contains('.png')) {
                     ext = 'png';
                   } else if (page.imageUrl.contains('.webp')) {
                     ext = 'webp';
                   }
                   
                   await _mediaStorage.saveImage(task.providerId, task.comicId, chId, pageIndex, bytes, ext);
                 }));
                 
                 downloaded += batch.length;
                 task = _updateChapterMemory(task.taskId, task.chapters[chId]!.copyWith(downloadedPages: downloaded), persist: false);
              }
              
              // Mark chapter as completed and set archivedAt
              final completedAt = DateTime.now();
              task = _updateChapterMemory(task.taskId, task.chapters[chId]!.copyWith(
                status: ArchiveTaskStatus.completed,
                archivedAt: completedAt,
              ), persist: true);
              
              // Update local comic chapter metadata
              if (localComic != null) {
                final newChapters = List<LocalChapterEntity>.from(localComic.chapters);
                final idx = newChapters.indexWhere((c) => c.chapterId == chId);
                if (idx != -1) {
                  newChapters[idx] = newChapters[idx].copyWith(archivedAt: completedAt);
                } else {
                  // Fallback for chapters added during update
                  newChapters.add(LocalChapterEntity(
                    chapterId: chId,
                    title: task.chapters[chId]!.title,
                    archivedAt: completedAt,
                  ));
                }
                localComic = localComic.copyWith(chapters: newChapters, archivedAt: completedAt);
                await _libraryManager.saveComic(localComic);
              }
              
            } catch (e) {
              task = _updateChapterMemory(task.taskId, task.chapters[chId]!.copyWith(status: ArchiveTaskStatus.error, errorMessage: e.toString()), persist: true);
              rethrow;
            }
          }
          
          final finalTask = state.firstWhere((t) => t.taskId == task.taskId, orElse: () => task);
          if (finalTask.status == ArchiveTaskStatus.downloading) {
             _updateTaskMemory(finalTask.copyWith(status: ArchiveTaskStatus.completed, updatedAt: DateTime.now()), persist: true);
             
             if (localComic != null) {
               await _libraryManager.saveComic(
                 localComic.copyWith(archivedAt: DateTime.now())
               );
             }
          }
          
        } catch (e) {
          final errTask = state.firstWhere((t) => t.taskId == task.taskId, orElse: () => task);
          _updateTaskMemory(errTask.copyWith(status: ArchiveTaskStatus.error, errorMessage: e.toString(), updatedAt: DateTime.now()), persist: true);
        }
      }
    } finally {
      _isProcessing = false;
    }
  }
}

final archiveTaskManagerProvider = NotifierProvider<ArchiveTaskManager, List<ArchiveTask>>(() {
  return ArchiveTaskManager();
});
