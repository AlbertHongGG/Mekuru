import 'package:mekuru/features/logger/domain/models/log_entry.dart';

abstract class ILoggerRepository {
  /// Log an entry
  Future<void> log(LogEntry entry);

  /// Get all logs, optionally filtered by type string ('api' or 'system')
  Future<List<LogEntry>> getLogs({String? type});

  /// Clear logs, optionally filtered by type string
  Future<void> clearLogs({String? type});

  /// Delete a specific log by id
  Future<void> deleteLog(String id, {String? type});
}
