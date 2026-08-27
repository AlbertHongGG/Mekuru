import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mekuru/core/models/enums/data_source_mode.dart';
import 'package:mekuru/core/models/enums/library_sort_mode.dart';
import 'package:mekuru/core/data/local/i_local_storage.dart';
import 'package:mekuru/core/data/local/local_storage_providers.dart';
import 'package:mekuru/core/data/sources/provider_registry.dart';

class SettingsState {
  final ThemeMode themeMode;
  final String serverUrl;
  final DataSourceMode dataSourceMode;
  final String currentSourceId;
  final LibrarySortMode librarySortMode;

  const SettingsState({
    required this.themeMode,
    required this.serverUrl,
    required this.dataSourceMode,
    required this.currentSourceId,
    required this.librarySortMode,
  });

  SettingsState copyWith({
    ThemeMode? themeMode,
    String? serverUrl,
    DataSourceMode? dataSourceMode,
    String? currentSourceId,
    LibrarySortMode? librarySortMode,
  }) {
    return SettingsState(
      themeMode: themeMode ?? this.themeMode,
      serverUrl: serverUrl ?? this.serverUrl,
      dataSourceMode: dataSourceMode ?? this.dataSourceMode,
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

    // Default server URL
    final url = _settingsBox.get('serverUrl') as String? ?? 'http://10.0.2.2:8000';
    
    final modeStr = _settingsBox.get('dataSourceMode') as String? ?? 'source';
    final mode = DataSourceModeExtension.fromString(modeStr);
    
    final defaultProviderId = 'comicwf';
    final sourceId = _settingsBox.get('currentSourceId') as String? ?? defaultProviderId;

    final sortModeStr = _settingsBox.get('librarySortMode') as String? ?? 'added';
    final sortMode = LibrarySortMode.values.firstWhere(
      (e) => e.name == sortModeStr, 
      orElse: () => LibrarySortMode.added
    );

    return SettingsState(
      themeMode: theme, 
      serverUrl: url,
      dataSourceMode: mode,
      currentSourceId: sourceId,
      librarySortMode: sortMode,
    );
  }

  Future<void> updateTheme(ThemeMode mode) async {
    await _settingsBox.put('themeMode', mode.index);
    state = state.copyWith(themeMode: mode);
  }

  Future<void> updateServerUrl(String url) async {
    await _settingsBox.put('serverUrl', url);
    state = state.copyWith(serverUrl: url);
  }
  
  Future<void> updateDataSourceMode(DataSourceMode mode) async {
    await _settingsBox.put('dataSourceMode', mode.name);
    state = state.copyWith(dataSourceMode: mode);
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
