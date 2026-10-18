import 'dart:async';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:mekuru/core/cache/comic_image_pipeline.dart';
import 'package:mekuru/features/comic/data/sources/i_comic_provider.dart';
import 'package:mekuru/features/comic/domain/models/page.dart';

enum PreloadPriority {
  immediate, // 1-3 ahead - Download & Memory Prime with highest priority
  high,      // 4-6 ahead - Download & Memory Prime
  medium,    // 7-10 ahead - Disk Preload
  low,       // 11-aheadCount ahead, 1-2 behind - Disk Preload
}

class PreloadTask {
  final int index;
  final String url;
  PreloadPriority priority;
  final CancelToken cancelToken;

  bool isExecuting = false;
  bool isExecutingSpeculative = false;
  bool isCompleted = false;
  bool isCancelled = false;

  bool get isSpeculative => priority == PreloadPriority.medium || priority == PreloadPriority.low;

  PreloadTask({
    required this.index,
    required this.url,
    required this.priority,
  }) : cancelToken = CancelToken();

  void cancel() {
    if (!isCompleted && !isCancelled) {
      isCancelled = true;
      if (!cancelToken.isCancelled) {
        cancelToken.cancel('Preload task cancelled because it moved far out of window');
      }
    }
  }
}

/// High-throughput, sliding-window preload scheduler with soft-cancellation and dual-tier channels.
///
/// Features:
/// 1. Concurrency: 6 parallel connections for rapid forward buffering.
/// 2. Dual-Tier Channel Allocation: Speculative background tasks (medium/low) are capped
///    at [maxSpeculativeConcurrent] slots so that critical immediate/high pages (1-6 ahead)
///    always have dedicated slots and zero head-of-line blocking.
/// 3. Forward-focused: Focuses 100% of download slots on FUTURE pages (currentIndex + 1..15)
///    without wasting slots on the current on-screen page (which the UI handles).
/// 4. Disk-Cache Pre-check: Immediately marks cached pages as completed without consuming concurrency slots.
/// 5. Soft-Cancellation: Protects in-flight downloads within [graceDistance].
/// 6. Comprehensive telemetry logging for ADB diagnostics.
class ViewerPreloadScheduler {
  final ComicImagePipeline pipeline;
  final int maxConcurrent;
  final int maxSpeculativeConcurrent;
  final int aheadCount;
  final int behindCount;
  final int graceDistance;

  IComicProvider? _provider;
  List<ComicPage> _pages = const [];
  int _currentIndex = 0;

  final Map<int, PreloadTask> _activeTasks = {};
  final Set<int> _completedIndices = {};
  int _runningCount = 0;
  int _runningSpeculativeCount = 0;
  bool _isDisposed = false;

  ViewerPreloadScheduler({
    ComicImagePipeline? pipeline,
    this.maxConcurrent = 6,
    this.maxSpeculativeConcurrent = 3,
    this.aheadCount = 15,
    this.behindCount = 2,
    this.graceDistance = 4,
  }) : pipeline = pipeline ?? ComicImagePipeline.instance;

  /// Starts or re-initializes the preload scheduler for the given chapter.
  void start({
    required IComicProvider provider,
    required List<ComicPage> pages,
    required int initialIndex,
  }) {
    if (_isDisposed) return;
    _provider = provider;
    _pages = pages;
    _currentIndex = initialIndex;

    debugPrint('[ViewerPreloadScheduler] Starting scheduler at index $initialIndex (total ${pages.length} pages, maxConcurrent: $maxConcurrent, aheadCount: $aheadCount)');
    updateWindow(currentIndex: initialIndex);
  }

  /// Updates the reading sliding window centered at [currentIndex].
  void updateWindow({required int currentIndex}) {
    if (_isDisposed || _provider == null || _pages.isEmpty) return;
    _currentIndex = currentIndex;

    final targetIndices = <int, PreloadPriority>{};

    // Forward preloading focuses on FUTURE pages (currentIndex + 1 onwards)
    // 1. Immediate priority: Next 1-3 pages ahead
    for (int i = 1; i <= 3; i++) {
      final idx = currentIndex + i;
      if (idx < _pages.length) {
        targetIndices[idx] = PreloadPriority.immediate;
      }
    }

    // 2. High priority: Next 4-6 pages ahead
    for (int i = 4; i <= 6; i++) {
      final idx = currentIndex + i;
      if (idx < _pages.length) {
        targetIndices[idx] = PreloadPriority.high;
      }
    }

    // 3. Medium priority: Next 7-10 pages ahead
    for (int i = 7; i <= 10; i++) {
      final idx = currentIndex + i;
      if (idx < _pages.length) {
        targetIndices[idx] = PreloadPriority.medium;
      }
    }

    // 4. Low priority: Next 11-aheadCount ahead
    for (int i = 11; i <= aheadCount; i++) {
      final idx = currentIndex + i;
      if (idx < _pages.length) {
        targetIndices[idx] = PreloadPriority.low;
      }
    }

    // 5. Low priority: Behind 1-behindCount pages
    for (int i = 1; i <= behindCount; i++) {
      final idx = currentIndex - i;
      if (idx >= 0) {
        targetIndices[idx] = PreloadPriority.low;
      }
    }

    // Evaluate active tasks: soft cancellation for tasks that scrolled far out of window
    final keysToRemove = <int>[];
    for (final entry in _activeTasks.entries) {
      final idx = entry.key;
      final task = entry.value;

      if (!targetIndices.containsKey(idx)) {
        final distance = (idx - currentIndex).abs();

        if (task.isExecuting) {
          // Soft Retention: If the task is already actively downloading and within graceDistance,
          // DO NOT cancel it! Let it finish saving to cache so bandwidth is not thrown away.
          if (distance > graceDistance) {
            task.cancel();
            keysToRemove.add(idx);
          }
        } else {
          // Pending non-executing task outside window: cancel and remove immediately
          task.cancel();
          keysToRemove.add(idx);
        }
      } else {
        // Still in target window: update priority if it changed
        final oldPriority = task.priority;
        final newPriority = targetIndices[idx]!;
        if (oldPriority != newPriority) {
          task.priority = newPriority;
          if (task.isExecutingSpeculative && !task.isSpeculative) {
            // Task promoted to immediate/high while executing: release speculative slot
            task.isExecutingSpeculative = false;
            _runningSpeculativeCount--;
          }
        }
      }
    }

    for (final key in keysToRemove) {
      _activeTasks.remove(key);
    }

    // Register new target tasks
    for (final entry in targetIndices.entries) {
      final idx = entry.key;
      final priority = entry.value;

      if (_completedIndices.contains(idx)) continue;
      if (_activeTasks.containsKey(idx)) continue;

      final url = _pages[idx].imageUrl;
      final task = PreloadTask(
        index: idx,
        url: url,
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

      // Rate limit speculative background downloads to preserve bandwidth for immediate pages
      if (nextTask.isSpeculative && _runningSpeculativeCount >= maxSpeculativeConcurrent) {
        break;
      }

      _executeTask(nextTask);
    }
  }

  PreloadTask? _getNextPendingTask() {
    final pending = _activeTasks.values
        .where((t) => !t.isExecuting && !t.isCompleted && !t.isCancelled)
        .toList();

    if (pending.isEmpty) return null;

    // Strict Multi-Criteria Sorting:
    // 1. Priority index (immediate < high < medium < low)
    // 2. Absolute distance from _currentIndex (closer first)
    // 3. Ahead over behind (idx >= currentIndex preferred)
    pending.sort((a, b) {
      final pDiff = a.priority.index.compareTo(b.priority.index);
      if (pDiff != 0) return pDiff;

      final distA = (a.index - _currentIndex).abs();
      final distB = (b.index - _currentIndex).abs();
      final dDiff = distA.compareTo(distB);
      if (dDiff != 0) return dDiff;

      final dirA = a.index >= _currentIndex ? 0 : 1;
      final dirB = b.index >= _currentIndex ? 0 : 1;
      return dirA.compareTo(dirB);
    });

    return pending.first;
  }

  Future<void> _executeTask(PreloadTask task) async {
    task.isExecuting = true;
    _runningCount++;
    if (task.isSpeculative) {
      task.isExecutingSpeculative = true;
      _runningSpeculativeCount++;
    }

    final provider = _provider;
    if (provider == null || _isDisposed) {
      _runningCount--;
      if (task.isExecutingSpeculative) {
        task.isExecutingSpeculative = false;
        _runningSpeculativeCount--;
      }
      task.isExecuting = false;
      return;
    }

    try {
      final shouldPrime = (task.priority == PreloadPriority.immediate || task.priority == PreloadPriority.high);

      // Fast check: is this image already cached on disk?
      final isCached = await pipeline.isCached(providerId: provider.providerId, url: task.url);
      if (isCached) {
        if (shouldPrime) {
          pipeline.primeMemoryCache(provider: provider, url: task.url);
        }
        task.isCompleted = true;
        _completedIndices.add(task.index);
        return;
      }

      final sw = Stopwatch()..start();
      await pipeline.preloadImage(
        provider: provider,
        url: task.url,
        cancelToken: task.cancelToken,
        primeMemory: shouldPrime,
      );
      sw.stop();

      task.isCompleted = true;
      _completedIndices.add(task.index);
      debugPrint('[ViewerPreloadScheduler] Page ${task.index} preloaded in ${sw.elapsedMilliseconds}ms (${task.priority})');
    } catch (e) {
      if (e is DioException && CancelToken.isCancel(e)) {
        // Expected cancellation, silence
      } else {
        debugPrint('[ViewerPreloadScheduler] Error preloading page ${task.index}: $e');
      }
    } finally {
      task.isExecuting = false;
      if (task.isExecutingSpeculative) {
        task.isExecutingSpeculative = false;
        _runningSpeculativeCount--;
      }
      _runningCount--;
      _activeTasks.remove(task.index);
      _pump();
    }
  }

  /// Reset completed and active queues (e.g. on chapter reload).
  void clear() {
    for (final task in _activeTasks.values) {
      task.cancel();
    }
    _activeTasks.clear();
    _completedIndices.clear();
    _runningCount = 0;
    _runningSpeculativeCount = 0;
  }

  /// Clean up all tasks, cancel all in-flight requests, and release resources.
  void dispose() {
    _isDisposed = true;
    clear();
  }
}
