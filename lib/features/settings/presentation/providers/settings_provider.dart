import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mekuru/core/models/enums/library_sort_mode.dart';
import 'package:mekuru/core/data/local/i_local_storage.dart';
import 'package:mekuru/core/data/local/local_storage_providers.dart';

class SettingsState {
  final ThemeMode themeMode;
  final String currentSourceId;
  final LibrarySortMode librarySortMode;

  const SettingsState({
    required this.themeMode,
    required this.currentSourceId,
    required this.librarySortMode,
  });

  SettingsState copyWith({
    ThemeMode? themeMode,
    String? currentSourceId,
    LibrarySortMode? librarySortMode,
  }) {
    return SettingsState(
      themeMode: themeMode ?? this.themeMode,
      currentSourceId: currentSourceId ?? this.currentSourceId,
      librarySortMode: librarySortMode ?? this.librarySortMode,
    );
  }
}

class SettingsNotifier extends Notifier<SettingsState> {
  late ILocalStorage<dynamic> _settingsBox;

  @override
  SettingsState build() {
    _settingsBox = ref.watch(settingsBoxProvider);
    
    // Default to light mode
    final themeIndex = _settingsBox.get('themeMode') as int? ?? ThemeMode.light.index;
    final theme = ThemeMode.values.firstWhere((e) => e.index == themeIndex, orElse: () => ThemeMode.light);

    final defaultProviderId = 'comicwf';
    final sourceId = _settingsBox.get('currentSourceId') as String? ?? defaultProviderId;

    final sortModeStr = _settingsBox.get('librarySortMode') as String? ?? 'added';
    final sortMode = LibrarySortMode.values.firstWhere(
      (e) => e.name == sortModeStr, 
      orElse: () => LibrarySortMode.added
    );

    return SettingsState(
      themeMode: theme, 
      currentSourceId: sourceId,
      librarySortMode: sortMode,
    );
  }

  Future<void> updateTheme(ThemeMode mode) async {
    await _settingsBox.put('themeMode', mode.index);
    state = state.copyWith(themeMode: mode);
  }

  Future<void> updateCurrentSourceId(String sourceId) async {
    await _settingsBox.put('currentSourceId', sourceId);
    state = state.copyWith(currentSourceId: sourceId);
  }

  Future<void> updateLibrarySortMode(LibrarySortMode mode) async {
    await _settingsBox.put('librarySortMode', mode.name);
    state = state.copyWith(librarySortMode: mode);
  }
}

final settingsProvider = NotifierProvider<SettingsNotifier, SettingsState>(() {
  return SettingsNotifier();
});
