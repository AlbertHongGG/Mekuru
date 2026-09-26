import 'dart:async';

/// Coordinates reading progress persistence with an isolated debounce timer.
/// Ensures reading history is saved safely without blocking UI or preloading.
class ViewerProgressCoordinator {
  final Future<void> Function(int anchorIndex, double anchorOffset) onSaveProgress;
  final Duration debounceDuration;

  Timer? _debounceTimer;
  int _currentAnchorIndex = 0;
  double _currentAnchorOffset = 0.0;
  int _lastSavedPacked = -1;

  ViewerProgressCoordinator({
    required this.onSaveProgress,
    this.debounceDuration = const Duration(milliseconds: 800),
  });

  /// Update the current reading anchor position during scroll.
  void onAnchorChanged(int anchorIndex, double anchorOffset) {
    _currentAnchorIndex = anchorIndex;
    _currentAnchorOffset = anchorOffset;

    _debounceTimer?.cancel();
    _debounceTimer = Timer(debounceDuration, () {
      _save();
    });
  }

  void _save() {
    final packed = (_currentAnchorIndex * 1000000) + _currentAnchorOffset.toInt();
    if (packed != _lastSavedPacked) {
      _lastSavedPacked = packed;
      onSaveProgress(_currentAnchorIndex, _currentAnchorOffset);
    }
  }

  /// Force immediate save (e.g. when exiting viewer or switching chapters).
  void saveNow() {
    _debounceTimer?.cancel();
    _save();
  }

  void dispose() {
    saveNow();
  }
}
