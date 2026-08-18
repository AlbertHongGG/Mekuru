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

  void clearLogs() {
    state = [];
  }
}

final apiLoggerProvider = StateNotifierProvider<ApiLoggerNotifier, List<ApiLogEntry>>((ref) {
  return ApiLoggerNotifier();
});
