import 'dart:async';
import 'package:flutter/material.dart';

/// A robust, deadlock-free viewport scroll and reading progress tracker.
///
/// Features:
/// 1. Dual-Pass Geometry Search: Fast local scan with a safe global fallback
///    that guarantees the visible index tracker NEVER freezes during fast scrolling.
/// 2. Bifurcated Output:
///    - Immediate notification for preloader sliding window adjustments.
///    - Debounced notification (default 800ms) for database history persistence.
class ViewerScrollTracker {
  final ScrollController scrollController;
  final Map<int, GlobalKey> activeKeys;
  final int Function() getTotalPages;
  final void Function(int visibleIndex) onVisibleIndexChanged;
  final void Function(int anchorIndex, double anchorOffset) onSaveProgress;
  final Duration saveDebounceDuration;

  Timer? _saveDebounceTimer;
  int _currentVisibleIndex = 0;
  int _currentAnchorIndex = 0;
  double _currentAnchorOffset = 0.0;
  int _lastSavedPacked = -1;
  bool _isDisposed = false;

  ViewerScrollTracker({
    required this.scrollController,
    required this.activeKeys,
    required this.getTotalPages,
    required this.onVisibleIndexChanged,
    required this.onSaveProgress,
    this.saveDebounceDuration = const Duration(milliseconds: 800),
    int initialIndex = 0,
    double initialOffset = 0.0,
  })  : _currentVisibleIndex = initialIndex,
        _currentAnchorIndex = initialIndex,
        _currentAnchorOffset = initialOffset;

  int get currentVisibleIndex => _currentVisibleIndex;
  int get currentAnchorIndex => _currentAnchorIndex;
  double get currentAnchorOffset => _currentAnchorOffset;

  /// Call whenever the scroll position changes.
  void onScroll() {
    if (_isDisposed || !scrollController.hasClients) return;

    final totalPages = getTotalPages();
    if (totalPages == 0 || activeKeys.isEmpty) return;

    final position = scrollController.position;
    final context = position.context.notificationContext;
    if (context == null) return;
    final viewportBox = context.findRenderObject() as RenderBox?;
    if (viewportBox == null) return;

    final viewportHeight = viewportBox.size.height;

    // Edge lock: Min scroll extent (Top)
    if (position.pixels <= position.minScrollExtent + 2) {
      _updateVisibleIndex(0);
      _scheduleSave(0, 0.0);
      return;
    }

    // Edge lock: Max scroll extent (Bottom)
    if (position.pixels >= position.maxScrollExtent - 2) {
      final lastIdx = totalPages - 1;
      _updateVisibleIndex(lastIdx);
      _scheduleSave(lastIdx, 0.0);
      return;
    }

    // --- Pass 1: Local Neighborhood Search ---
    int bestVisibleIndex = -1;
    double maxVisibleArea = -1.0;

    int? anchorIndex;
    double anchorOffset = 0.0;
    double? bestTopCandidate;
    int? bestTopCandidateIndex;

    final localStart = (_currentVisibleIndex - 2).clamp(0, totalPages - 1);
    final localEnd = (_currentVisibleIndex + 4).clamp(0, totalPages - 1);

    for (int i = localStart; i <= localEnd; i++) {
      final key = activeKeys[i];
      if (key?.currentContext == null) continue;

      final renderBox = key!.currentContext!.findRenderObject() as RenderBox?;
      if (renderBox == null || !renderBox.hasSize) continue;

      final positionInViewport = renderBox.localToGlobal(Offset.zero, ancestor: viewportBox);
      final top = positionInViewport.dy;
      final bottom = top + renderBox.size.height;

      // 1. Calculate visible height in viewport
      if (bottom > 0 && top < viewportHeight) {
        final visibleTop = top < 0 ? 0.0 : top;
        final visibleBottom = bottom > viewportHeight ? viewportHeight : bottom;
        final visibleArea = visibleBottom - visibleTop;

        if (visibleArea > maxVisibleArea) {
          maxVisibleArea = visibleArea;
          bestVisibleIndex = i;
        }
      }

      // 2. Calculate save anchor (item crossing top of viewport)
      if (bottom > 0) {
        if (top <= 0 && bottom > 0) {
          anchorIndex = i;
          anchorOffset = -top;
        } else if (top > 0) {
          if (bestTopCandidate == null || top < bestTopCandidate) {
            bestTopCandidate = top;
            bestTopCandidateIndex = i;
          }
        }
      }
    }

    // --- Pass 2: Global Fallback Search (Prevent Deadlock) ---
    // If fast scrolling leaped outside local bounds, search all mounted tiles
    if (bestVisibleIndex == -1) {
      for (final entry in activeKeys.entries) {
        final i = entry.key;
        final key = entry.value;
        if (key.currentContext == null) continue;

        final renderBox = key.currentContext!.findRenderObject() as RenderBox?;
        if (renderBox == null || !renderBox.hasSize) continue;

        final positionInViewport = renderBox.localToGlobal(Offset.zero, ancestor: viewportBox);
        final top = positionInViewport.dy;
        final bottom = top + renderBox.size.height;

        if (bottom > 0 && top < viewportHeight) {
          final visibleTop = top < 0 ? 0.0 : top;
          final visibleBottom = bottom > viewportHeight ? viewportHeight : bottom;
          final visibleArea = visibleBottom - visibleTop;

          if (visibleArea > maxVisibleArea) {
            maxVisibleArea = visibleArea;
            bestVisibleIndex = i;
          }
        }

        if (bottom > 0 && anchorIndex == null) {
          if (top <= 0 && bottom > 0) {
            anchorIndex = i;
            anchorOffset = -top;
          } else if (top > 0) {
            if (bestTopCandidate == null || top < bestTopCandidate) {
              bestTopCandidate = top;
              bestTopCandidateIndex = i;
            }
          }
        }
      }
    }

    // If still no item in visible area (rare fling gap), find the closest item to center
    if (bestVisibleIndex == -1) {
      double minCenterDist = double.infinity;
      final viewportCenter = viewportHeight / 2;

      for (final entry in activeKeys.entries) {
        final i = entry.key;
        final key = entry.value;
        if (key.currentContext == null) continue;

        final renderBox = key.currentContext!.findRenderObject() as RenderBox?;
        if (renderBox == null || !renderBox.hasSize) continue;

        final pos = renderBox.localToGlobal(Offset.zero, ancestor: viewportBox);
        final itemCenter = pos.dy + (renderBox.size.height / 2);
        final dist = (itemCenter - viewportCenter).abs();

        if (dist < minCenterDist) {
          minCenterDist = dist;
          bestVisibleIndex = i;
        }
      }
    }

    if (bestVisibleIndex != -1) {
      _updateVisibleIndex(bestVisibleIndex);
    }

    final finalAnchorIndex = anchorIndex ?? bestTopCandidateIndex ?? bestVisibleIndex;
    if (finalAnchorIndex != -1) {
      _scheduleSave(finalAnchorIndex, anchorIndex != null ? anchorOffset : 0.0);
    }
  }

  void _updateVisibleIndex(int newIndex) {
    if (_currentVisibleIndex != newIndex) {
      debugPrint('[ViewerScrollTracker] Visible page changed: $_currentVisibleIndex -> $newIndex');
      _currentVisibleIndex = newIndex;
      // Preloader gets notified IMMEDIATELY without debounce
      onVisibleIndexChanged(newIndex);
    }
  }

  void _scheduleSave(int anchorIndex, double anchorOffset) {
    _currentAnchorIndex = anchorIndex;
    _currentAnchorOffset = anchorOffset;

    _saveDebounceTimer?.cancel();
    _saveDebounceTimer = Timer(saveDebounceDuration, () {
      _flushSave();
    });
  }

  void _flushSave() {
    if (_isDisposed) return;
    final packed = (_currentAnchorIndex * 1000000) + _currentAnchorOffset.toInt();
    if (packed != _lastSavedPacked) {
      _lastSavedPacked = packed;
      onSaveProgress(_currentAnchorIndex, _currentAnchorOffset);
    }
  }

  /// Forces immediate persistence flush (e.g. when popping route or navigating away).
  void saveNow() {
    _saveDebounceTimer?.cancel();
    _flushSave();
  }

  /// Release timer and resources.
  void dispose() {
    if (_isDisposed) return;
    saveNow();
    _isDisposed = true;
  }
}
