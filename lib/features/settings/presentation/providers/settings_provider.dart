import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive_flutter/hive_flutter.dart';

class SettingsState {
  final ThemeMode themeMode;
  final String serverUrl;
  final String dataSourceMode;

  const SettingsState({
    required this.themeMode,
    required this.serverUrl,
    required this.dataSourceMode,
  });

  SettingsState copyWith({
    ThemeMode? themeMode,
    String? serverUrl,
    String? dataSourceMode,
  }) {
    return SettingsState(
      themeMode: themeMode ?? this.themeMode,
      serverUrl: serverUrl ?? this.serverUrl,
      dataSourceMode: dataSourceMode ?? this.dataSourceMode,
    );
  }
}

class SettingsNotifier extends Notifier<SettingsState> {
  late Box _settingsBox;

  @override
  SettingsState build() {
    _settingsBox = Hive.box('settings');
    
    // Default to light mode
    final themeIndex = _settingsBox.get('themeMode', defaultValue: ThemeMode.light.index) as int;
    final theme = ThemeMode.values.firstWhere((e) => e.index == themeIndex, orElse: () => ThemeMode.light);

    // Default server URL
    final url = _settingsBox.get('serverUrl', defaultValue: 'http://10.0.2.2:8000') as String;
    final mode = _settingsBox.get('dataSourceMode', defaultValue: 'source') as String;

    return SettingsState(themeMode: theme, serverUrl: url, dataSourceMode: mode);
  }

  void updateThemeMode(ThemeMode mode) {
    _settingsBox.put('themeMode', mode.index);
    state = state.copyWith(themeMode: mode);
  }

  void updateServerUrl(String url) {
    _settingsBox.put('serverUrl', url);
    state = state.copyWith(serverUrl: url);
  }

  void updateDataSourceMode(String mode) {
    _settingsBox.put('dataSourceMode', mode);
    state = state.copyWith(dataSourceMode: mode);
  }
}

final settingsProvider = NotifierProvider<SettingsNotifier, SettingsState>(() {
  return SettingsNotifier();
});
