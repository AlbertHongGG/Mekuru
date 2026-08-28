import 'dart:async';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mekuru/features/archive/data/sources/archive_storage.dart';
import 'package:mekuru/features/archive/domain/models/archive_task.dart';
import 'package:mekuru/features/comic/data/sources/provider_registry.dart';
import 'package:mekuru/features/archive/domain/managers/i_local_library_manager.dart';
import 'package:mekuru/features/archive/domain/managers/local_library_manager.dart';
import 'package:mekuru/core/data/local/models/local_comic_entity.dart';
import 'package:mekuru/core/data/local/local_storage_providers.dart';

class ArchiveDownloadService {
  final IArchiveTaskStorage _taskStorage;
  final IMediaStorage _mediaStorage;
  final ProviderRegistry _providerRegistry;
  final ILocalLibraryManager _libraryManager;

  // State in memory
  List<ArchiveTask> _tasks = [];
  bool _isProcessing = false;

  // Stream for UI
  final _progressController = StreamController<List<ArchiveTask>>.broadcast();
  Stream<List<ArchiveTask>> get progressStream => _progressController.stream;

  ArchiveDownloadService({
    required IArchiveTaskStorage taskStorage,
    required IMediaStorage mediaStorage,
    required ProviderRegistry providerRegistry,
    required ILocalLibraryManager libraryManager,
  })  : _taskStorage = taskStorage,
        _mediaStorage = mediaStorage,
        _providerRegistry = providerRegistry,
        _libraryManager = libraryManager {
    _init();
  }

  Future<void> _init() async {
    _tasks = await _taskStorage.getActiveTasks();
    
    // Auto-resume previously downloading tasks
    bool hasActive = false;
    for (int i = 0; i < _tasks.length; i++) {
      if (_tasks[i].status == ArchiveTaskStatus.downloading || _tasks[i].status == ArchiveTaskStatus.queued) {
        hasActive = true;
        _tasks[i] = _tasks[i].copyWith(status: ArchiveTaskStatus.queued);
        await _taskStorage.saveTask(_tasks[i]);
      }
    }
    
    _emit(force: true);
    if (hasActive) {
      _processQueue();
    }
  }

  // Throttle emit logic
  DateTime _lastEmitTime = DateTime.now();
  void _emit({bool force = false}) {
    if (force || DateTime.now().difference(_lastEmitTime).inMilliseconds > 500) {
      _progressController.add(List.unmodifiable(_tasks));
      _lastEmitTime = DateTime.now();
    }
  }

  // Save to DB (only when important state changes like completion, error, or pause)
  Future<void> _persistTask(ArchiveTask task) async {
    await _taskStorage.saveTask(task);
  }

  void _updateTaskMemory(ArchiveTask task, {bool persist = false, bool emit = true}) {
    final idx = _tasks.indexWhere((t) => t.taskId == task.taskId);
    if (idx != -1) {
      _tasks[idx] = task;
      if (persist) {
        _persistTask(task);
      }
      if (emit) {
        _emit();
      }
    }
  }

  ArchiveTask _updateChapterMemory(String taskId, ChapterTask chTask, {bool persist = false, bool emit = true}) {
    final idx = _tasks.indexWhere((t) => t.taskId == taskId);
    if (idx == -1) return const ArchiveTask(providerId: '', comicId: '');
    final currentTask = _tasks[idx];
    final newChapters = Map<String, ChapterTask>.from(currentTask.chapters);
    newChapters[chTask.chapterId] = chTask;
    final newTask = currentTask.copyWith(chapters: newChapters, updatedAt: DateTime.now());
    _updateTaskMemory(newTask, persist: persist, emit: emit);
    return newTask;
  }

  Future<void> enqueueTask(String providerId, String comicId) async {
    final idx = _tasks.indexWhere((t) => t.providerId == providerId && t.comicId == comicId);
    if (idx != -1) {
      final existing = _tasks[idx];
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
      
      _tasks.add(task);
      await _persistTask(task);
      _emit(force: true);
      
      _processQueue();
    } catch (e) {
      throw Exception('Failed to enqueue task: $e');
    }
  }

  Future<void> pauseTask(String providerId, String comicId) async {
    final idx = _tasks.indexWhere((t) => t.providerId == providerId && t.comicId == comicId);
    if (idx != -1) {
      final t = _tasks[idx].copyWith(status: ArchiveTaskStatus.paused, updatedAt: DateTime.now());
      _updateTaskMemory(t, persist: true, emit: true);
    }
  }

  Future<void> resumeTask(String providerId, String comicId) async {
    final idx = _tasks.indexWhere((t) => t.providerId == providerId && t.comicId == comicId);
    if (idx != -1) {
      final t = _tasks[idx].copyWith(status: ArchiveTaskStatus.queued, errorMessage: null, updatedAt: DateTime.now());
      _updateTaskMemory(t, persist: true, emit: true);
      _processQueue();
    }
  }

  Future<void> cancelTask(String providerId, String comicId) async {
    final idx = _tasks.indexWhere((t) => t.providerId == providerId && t.comicId == comicId);
    if (idx != -1) {
      final task = _tasks[idx];
      _tasks.removeAt(idx);
      await _taskStorage.deleteTask(task.taskId);
      _emit(force: true);
    }
  }

  // Queue Processing
  Future<void> _processQueue() async {
    if (_isProcessing) return;
    _isProcessing = true;

    try {
      while (true) {
        final activeTasks = _tasks.where((t) => t.status == ArchiveTaskStatus.queued || t.status == ArchiveTaskStatus.downloading).toList();
        if (activeTasks.isEmpty) break;

        final task = activeTasks.first;
        if (task.status == ArchiveTaskStatus.queued) {
          _updateTaskMemory(task.copyWith(status: ArchiveTaskStatus.downloading), persist: true, emit: true);
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
        
        final chaptersResult = await provider.getChapterList(task.comicId, isDescending: false);
        final chapters = chaptersResult.getOrThrow();
        
        localComic = LocalComicEntity(
          providerId: task.providerId,
          comicId: task.comicId,
          title: comicDetail.title,
          coverUrl: comicDetail.coverUrl,
          tags: comicDetail.tags,
          author: comicDetail.author,
          description: comicDetail.description,
          chapterIds: chapters.map((c) => c.id).toList(),
          archivedAt: DateTime.now(),
        );
        
        await _libraryManager.saveComic(localComic);
        
        final chapterTasks = <String, ChapterTask>{};
        for (final ch in chapters) {
          chapterTasks[ch.id] = ChapterTask(
            chapterId: ch.id,
            title: ch.title,
            status: ArchiveTaskStatus.queued,
          );
        }
        
        task = task.copyWith(
          chapters: chapterTasks, 
          coverUrl: comicDetail.coverUrl,
          comicTitle: comicDetail.title,
        );
        _updateTaskMemory(task, persist: true, emit: true);
      } else {
        localComic = await _libraryManager.getComic(task.comicId);
      }
      
      // 2. Download Chapters (with Concurrency)
      for (final chId in task.chapters.keys) {
        final currentTask = _tasks.firstWhere((t) => t.taskId == task.taskId, orElse: () => task);
        if (currentTask.status != ArchiveTaskStatus.downloading) {
          return; // Task paused or cancelled
        }
        
        task = currentTask; 
        final chTask = task.chapters[chId]!;
        if (chTask.status == ArchiveTaskStatus.completed) continue;
        
        task = _updateChapterMemory(task.taskId, chTask.copyWith(status: ArchiveTaskStatus.downloading), persist: true, emit: true);
        
        try {
          final pagesResult = await provider.getChapterImages(task.comicId, chId);
          final pages = pagesResult.getOrThrow();
          
          task = _updateChapterMemory(task.taskId, task.chapters[chId]!.copyWith(totalPages: pages.length), persist: true, emit: true);
          
          int downloaded = task.chapters[chId]!.downloadedPages;
          
          // CONCURRENCY: Download 5 pages at a time
          const int batchSize = 5;
          for (int i = downloaded; i < pages.length; i += batchSize) {
             final checkTask = _tasks.firstWhere((t) => t.taskId == task.taskId, orElse: () => task);
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
             // ONLY update memory/emit, DO NOT persist to DB yet
             task = _updateChapterMemory(task.taskId, task.chapters[chId]!.copyWith(downloadedPages: downloaded), persist: false, emit: true);
          }
          
          // Persist to DB when chapter is completely finished
          task = _updateChapterMemory(task.taskId, task.chapters[chId]!.copyWith(status: ArchiveTaskStatus.completed), persist: true, emit: true);
          
        } catch (e) {
          task = _updateChapterMemory(task.taskId, task.chapters[chId]!.copyWith(status: ArchiveTaskStatus.error, errorMessage: e.toString()), persist: true, emit: true);
          rethrow;
        }
      }
      
      // 3. Finalize
      final finalTask = _tasks.firstWhere((t) => t.taskId == task.taskId, orElse: () => task);
      if (finalTask.status == ArchiveTaskStatus.downloading) {
         _updateTaskMemory(finalTask.copyWith(status: ArchiveTaskStatus.completed, updatedAt: DateTime.now()), persist: true, emit: true);
         
         if (localComic != null) {
           await _libraryManager.saveComic(
             localComic.copyWith(archivedAt: DateTime.now())
           );
         }
      }
      
    } catch (e) {
       final errTask = _tasks.firstWhere((t) => t.taskId == task.taskId, orElse: () => task);
       if (errTask.status == ArchiveTaskStatus.downloading) {
         _updateTaskMemory(errTask.copyWith(status: ArchiveTaskStatus.error, errorMessage: e.toString(), updatedAt: DateTime.now()), persist: true, emit: true);
       }
    }
  }
}

final archiveDownloadServiceProvider = Provider<ArchiveDownloadService>((ref) {
  return ArchiveDownloadService(
    taskStorage: ref.watch(archiveTaskStorageProvider),
    mediaStorage: ref.watch(mediaStorageProvider),
    providerRegistry: ref.watch(providerRegistryProvider),
    libraryManager: ref.watch(localLibraryManagerProvider),
  );
});
