import 'package:flutter/material.dart';
import 'package:mekuru/features/library/domain/strategies/library_sort_strategy.dart';

enum LibrarySortMode {
  added,
  updated,
  read,
  title,
}

extension LibrarySortModeExtension on LibrarySortMode {
  String get label {
    switch (this) {
      case LibrarySortMode.added:
        return '近期加入';
      case LibrarySortMode.updated:
        return '近期更新';
      case LibrarySortMode.read:
        return '近期閱讀';
      case LibrarySortMode.title:
        return '名稱排序';
    }
  }

  IconData get icon {
    switch (this) {
      case LibrarySortMode.added:
        return Icons.add;
      case LibrarySortMode.updated:
        return Icons.local_fire_department;
      case LibrarySortMode.read:
        return Icons.schedule;
      case LibrarySortMode.title:
        return Icons.sort_by_alpha_rounded;
    }
  }

  LibrarySortStrategy get strategy {
    switch (this) {
      case LibrarySortMode.added:
        return AddedSortStrategy();
      case LibrarySortMode.updated:
        return UpdatedSortStrategy();
      case LibrarySortMode.read:
        return ReadSortStrategy();
      case LibrarySortMode.title:
        return TitleSortStrategy();
    }
  }

  static LibrarySortMode fromString(String value) {
    return LibrarySortMode.values.firstWhere(
      (e) => e.name == value,
      orElse: () => LibrarySortMode.added,
    );
  }
}
