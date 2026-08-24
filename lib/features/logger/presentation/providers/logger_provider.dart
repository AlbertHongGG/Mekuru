import 'dart:async';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mekuru/features/logger/domain/models/log_entry.dart';
import 'package:mekuru/features/logger/domain/repositories/i_logger_repository.dart';
import 'package:mekuru/core/data/local/local_storage_providers.dart';
import 'package:mekuru/features/logger/data/repositories/logger_repository_impl.dart';

final loggerRepositoryProvider = Provider<ILoggerRepository>((ref) {
  return LoggerRepositoryImpl(
    apiBox: ref.watch(apiLogsBoxProvider),
    systemBox: ref.watch(systemLogsBoxProvider),
  );
});

class LoggerNotifier extends StateNotifier<AsyncValue<List<LogEntry>>> {
  final ILoggerRepository repository;
  final String? filterType;
  StreamSubscription<void>? _subscription;

  LoggerNotifier(this.repository, {this.filterType}) : super(const AsyncValue.loading()) {
    loadLogs();
    _subscription = repository.watchLogs(type: filterType).listen((_) {
      loadLogs();
    });
  }

  @override
  void dispose() {
    _subscription?.cancel();
    super.dispose();
  }

  Future<void> loadLogs() async {
    try {
      final logs = await repository.getLogs(type: filterType);
      state = AsyncValue.data(logs);
    } catch (e, st) {
      state = AsyncValue.error(e, st);
    }
  }

  Future<void> clearLogs() async {
    await repository.clearLogs(type: filterType);
    await loadLogs();
  }

  Future<void> removeLog(String id) async {
    await repository.deleteLog(id, type: filterType);
    await loadLogs();
  }
}

final apiLogsProvider = StateNotifierProvider<LoggerNotifier, AsyncValue<List<LogEntry>>>((ref) {
  return LoggerNotifier(ref.watch(loggerRepositoryProvider), filterType: 'api');
});

final systemLogsProvider = StateNotifierProvider<LoggerNotifier, AsyncValue<List<LogEntry>>>((ref) {
  return LoggerNotifier(ref.watch(loggerRepositoryProvider), filterType: 'system');
});
