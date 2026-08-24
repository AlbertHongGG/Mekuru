import 'package:mekuru/core/data/local/i_local_storage.dart';
import 'package:mekuru/features/logger/domain/models/log_entry.dart';
import 'package:mekuru/features/logger/domain/repositories/i_logger_repository.dart';

class LoggerRepositoryImpl implements ILoggerRepository {
  final ILocalStorage<LogEntry> apiBox;
  final ILocalStorage<LogEntry> systemBox;
  final int maxLogs = 200;

  LoggerRepositoryImpl({
    required this.apiBox,
    required this.systemBox,
  });

  @override
  Future<void> log(LogEntry entry) async {
    final box = entry is ApiLogEntry ? apiBox : systemBox;
    await box.put(entry.id, entry);
    await _enforceRetentionPolicy(box);
  }

  @override
  Future<List<LogEntry>> getLogs({String? type}) async {
    final List<LogEntry> logs = [];
    
    if (type == null || type == 'api') {
      logs.addAll(apiBox.getAll());
    }
    if (type == null || type == 'system') {
      logs.addAll(systemBox.getAll());
    }

    logs.sort((a, b) => b.timestamp.compareTo(a.timestamp));
    return logs;
  }

  @override
  Future<void> clearLogs({String? type}) async {
    if (type == null || type == 'api') {
      await apiBox.clear();
    }
    if (type == null || type == 'system') {
      await systemBox.clear();
    }
  }

  @override
  Future<void> deleteLog(String id, {String? type}) async {
    if (type == null || type == 'api') {
      await apiBox.delete(id);
    }
    if (type == null || type == 'system') {
      await systemBox.delete(id);
    }
  }

  Future<void> _enforceRetentionPolicy(ILocalStorage<LogEntry> box) async {
    final allValues = box.getAll();
    if (allValues.length <= maxLogs) return;

    // Delete the oldest logs
    final logs = allValues.toList();
    logs.sort((a, b) => a.timestamp.compareTo(b.timestamp)); // Oldest first
    
    final toDeleteCount = logs.length - maxLogs;
    final keysToDelete = logs.take(toDeleteCount).map((e) => e.id).toList();
    
    await box.deleteAll(keysToDelete);
  }
}
