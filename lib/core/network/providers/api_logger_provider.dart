import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../models/api_log_entry.dart';

class ApiLoggerNotifier extends StateNotifier<List<ApiLogEntry>> {
  final int maxLogs;

  ApiLoggerNotifier({this.maxLogs = 500}) : super([]);

  void addLog(ApiLogEntry log) {
    // Insert at top, keep within max limits
    state = [log, ...state];
    if (state.length > maxLogs) {
      state = state.sublist(0, maxLogs);
    }
  }

  void updateLog(ApiLogEntry log) {
    state = [
      for (final l in state)
        if (l.id == log.id) log else l
    ];
  }

  void removeLog(String id) {
    state = state.where((l) => l.id != id).toList();
  }

  void clearLogsByMethod(String method) {
    state = state.where((l) => l.method.toUpperCase() != method.toUpperCase()).toList();
  }

  void clearLogs() {
    state = [];
  }
}

final apiLoggerProvider = StateNotifierProvider<ApiLoggerNotifier, List<ApiLogEntry>>((ref) {
  return ApiLoggerNotifier();
});
