import 'package:flutter/material.dart';

enum LibrarySortMode {
  added,
  updated,
  read,
}

extension LibrarySortModeExtension on LibrarySortMode {
  String get label {
    switch (this) {
      case LibrarySortMode.added:
        return '近期加入';
      case LibrarySortMode.updated:
        return '最近更新';
      case LibrarySortMode.read:
        return '近期閱讀';
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
    }
  }

  static LibrarySortMode fromString(String value) {
    return LibrarySortMode.values.firstWhere(
      (e) => e.name == value,
      orElse: () => LibrarySortMode.added,
    );
  }
}
