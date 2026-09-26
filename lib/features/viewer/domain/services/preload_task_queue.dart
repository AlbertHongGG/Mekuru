import 'dart:async';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:mekuru/core/cache/comic_disk_cache_manager.dart';
import 'package:mekuru/core/cache/i_comic_cache_manager.dart';
import 'package:mekuru/core/widgets/provider_image_provider.dart';
import 'package:mekuru/features/comic/data/sources/i_comic_provider.dart';
import 'package:mekuru/features/comic/domain/models/page.dart';

enum PreloadPriority {
  high,   // Immediate upcoming pages (1-3 ahead) - Download & Memory Prime
  medium, // Ahead (4-7 ahead) - Disk Preload
  low,    // Far ahead or behind (8-10 ahead, 1-2 behind) - Disk Preload
}

class PreloadTask {
  final int index;
  final String url;
  final IComicProvider provider;
  PreloadPriority priority;
  final CancelToken cancelToken;

  bool isExecuting = false;
  bool isCompleted = false;
  bool isCancelled = false;

  PreloadTask({
    required this.index,
    required this.url,
    required this.provider,
    required this.priority,
  }) : cancelToken = CancelToken();

  void cancel() {
    if (!isCompleted && !isCancelled) {
      isCancelled = true;
      if (!cancelToken.isCancelled) {
        cancelToken.cancel('Preload task cancelled because it moved out of window');
      }
    }
  }
}

/// An intelligent, sliding-window concurrent preload task queue.
class PreloadTaskQueue {
  final int maxConcurrent;
  final IComicCacheManager cacheManager;

  final Map<int, PreloadTask> _activeTasks = {};
  final Set<int> _completedIndices = {};
  int _runningCount = 0;
  bool _isDisposed = false;

  PreloadTaskQueue({
    this.maxConcurrent = 3,
    IComicCacheManager? cacheManager,
  }) : cacheManager = cacheManager ?? ComicDiskCacheManager.instance;

  /// Update the active sliding window centered around [currentIndex].
  /// Cancels any in-flight downloads that have scrolled out of range,
  /// and schedules new downloads prioritized by distance from [currentIndex].
  void updateWindow({
    required int currentIndex,
    required List<ComicPage> pages,
    required IComicProvider provider,
    int aheadCount = 10,
    int behindCount = 2,
  }) {
    if (_isDisposed || pages.isEmpty) return;

    final targetIndices = <int, PreloadPriority>{};

    // 1. High priority: next 1-3 pages ahead
    for (int i = 1; i <= 3; i++) {
      final idx = currentIndex + i;
      if (idx < pages.length) {
        targetIndices[idx] = PreloadPriority.high;
      }
    }

    // 2. Medium priority: next 4-7 pages ahead
    for (int i = 4; i <= 7; i++) {
      final idx = currentIndex + i;
      if (idx < pages.length) {
        targetIndices[idx] = PreloadPriority.medium;
      }
    }

    // 3. Low priority: next 8-aheadCount ahead
    for (int i = 8; i <= aheadCount; i++) {
      final idx = currentIndex + i;
      if (idx < pages.length) {
        targetIndices[idx] = PreloadPriority.low;
      }
    }

    // 4. Low priority: behind 1-behindCount pages
    for (int i = 1; i <= behindCount; i++) {
      final idx = currentIndex - i;
      if (idx >= 0) {
        targetIndices[idx] = PreloadPriority.low;
      }
    }

    // Cancel and remove any active tasks that are no longer within our sliding window
    final keysToRemove = <int>[];
    for (final entry in _activeTasks.entries) {
      final idx = entry.key;
      final task = entry.value;

      if (!targetIndices.containsKey(idx)) {
        if (!task.isCompleted) {
          task.cancel();
        }
        keysToRemove.add(idx);
      } else {
        // Update priority if changed
        task.priority = targetIndices[idx]!;
      }
    }

    for (final key in keysToRemove) {
      _activeTasks.remove(key);
    }

    // Add new target tasks
    for (final entry in targetIndices.entries) {
      final idx = entry.key;
      final priority = entry.value;

      if (_completedIndices.contains(idx)) continue;
      if (_activeTasks.containsKey(idx)) continue;

      final url = pages[idx].imageUrl;
      final task = PreloadTask(
        index: idx,
        url: url,
        provider: provider,
        priority: priority,
      );
      _activeTasks[idx] = task;
    }

    // Trigger queue pump
    _pump();
  }

  void _pump() {
    if (_isDisposed) return;

    while (_runningCount < maxConcurrent) {
      final nextTask = _getNextPendingTask();
      if (nextTask == null) break;

      _executeTask(nextTask);
    }
  }

  PreloadTask? _getNextPendingTask() {
    final pending = _activeTasks.values
        .where((t) => !t.isExecuting && !t.isCompleted && !t.isCancelled)
        .toList();

    if (pending.isEmpty) return null;

    // Sort by priority: high first, then medium, then low
    pending.sort((a, b) => a.priority.index.compareTo(b.priority.index));
    return pending.first;
  }

  Future<void> _executeTask(PreloadTask task) async {
    task.isExecuting = true;
    _runningCount++;

    try {
      final isCached = await cacheManager.isCached(task.provider.providerId, task.url);
      if (!isCached && !task.isCancelled) {
        // Tier 1: Download to disk
        final bytes = await task.provider.fetchImageBytes(
          task.url,
          cancelToken: task.cancelToken,
        );
        if (!task.isCancelled && bytes.length >= 100) {
          await cacheManager.putBytes(task.provider.providerId, task.url, bytes);
        }
      }

      // Tier 2: Memory Warm-up for high priority
      if (!task.isCancelled && task.priority == PreloadPriority.high) {
        _primeMemoryCache(task.provider, task.url);
      }

      task.isCompleted = true;
      _completedIndices.add(task.index);
    } catch (e) {
      if (e is DioException && CancelToken.isCancel(e)) {
        // Normal cancellation, silence
      } else {
        debugPrint('[PreloadTaskQueue] Error preloading page ${task.index}: $e');
      }
    } finally {
      task.isExecuting = false;
      _runningCount--;
      _activeTasks.remove(task.index);
      _pump();
    }
  }

  /// Warm-up Flutter's in-memory image cache without requiring a BuildContext.
  void _primeMemoryCache(IComicProvider provider, String url) {
    try {
      final imageProvider = ProviderImageProvider(url, provider, cacheManager: cacheManager);
      final stream = imageProvider.resolve(ImageConfiguration.empty);
      late final ImageStreamListener listener;
      listener = ImageStreamListener(
        (image, synchronousCall) {
          stream.removeListener(listener);
        },
        onError: (dynamic exception, StackTrace? stackTrace) {
          stream.removeListener(listener);
        },
      );
      stream.addListener(listener);
    } catch (e) {
      debugPrint('[PreloadTaskQueue] Memory prime error: $e');
    }
  }

  /// Reset the completed list and active queue (e.g. on chapter reload).
  void clear() {
    for (final task in _activeTasks.values) {
      task.cancel();
    }
    _activeTasks.clear();
    _completedIndices.clear();
    _runningCount = 0;
  }

  /// Dispose queue and abort all network operations.
  void dispose() {
    _isDisposed = true;
    clear();
  }
}
