import 'package:flutter/foundation.dart';
import 'package:mekuru/features/comic/data/sources/i_comic_provider.dart';
import 'package:mekuru/features/comic/domain/models/page.dart';
import 'package:mekuru/features/viewer/domain/services/preload_task_queue.dart';

/// Coordinates reading preloading for the viewer, managing sliding-window updates.
class ViewerPreloadCoordinator {
  final PreloadTaskQueue _queue;
  IComicProvider? _provider;
  List<ComicPage> _pages = const [];
  int _lastIndex = -1;

  ViewerPreloadCoordinator({PreloadTaskQueue? queue})
      : _queue = queue ?? PreloadTaskQueue();

  /// Initialize and start preloading for the loaded chapter.
  void start({
    required IComicProvider provider,
    required List<ComicPage> pages,
    required int initialIndex,
  }) {
    _provider = provider;
    _pages = pages;
    _lastIndex = initialIndex;

    debugPrint('[ViewerPreloadCoordinator] Starting preloader for chapter at index $initialIndex (total ${pages.length} pages)');
    _queue.updateWindow(
      currentIndex: initialIndex,
      pages: _pages,
      provider: _provider!,
    );
  }

  /// Called immediately whenever the user scrolls to a new visible page index.
  /// No artificial debounce is applied here to ensure immediate responsiveness.
  void onCurrentIndexChanged(int newIndex) {
    if (_provider == null || _pages.isEmpty) return;
    if (_lastIndex == newIndex) return;

    _lastIndex = newIndex;
    _queue.updateWindow(
      currentIndex: newIndex,
      pages: _pages,
      provider: _provider!,
    );
  }

  /// Clean up all tasks and cancel all in-flight requests.
  void dispose() {
    _queue.dispose();
  }
}
