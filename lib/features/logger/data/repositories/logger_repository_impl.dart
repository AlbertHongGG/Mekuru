import 'dart:convert';
import 'dart:io';
import 'package:path_provider/path_provider.dart';
import 'package:mekuru/features/logger/domain/models/log_entry.dart';
import 'package:mekuru/features/logger/domain/repositories/i_logger_repository.dart';

class LoggerRepositoryImpl implements ILoggerRepository {
  late final Future<Directory> _logDirFuture;
  final int maxFiles = 200;

  LoggerRepositoryImpl() {
    _logDirFuture = _initLogDir();
  }

  Future<Directory> _initLogDir() async {
    final appDir = await getApplicationDocumentsDirectory();
    final dir = Directory('${appDir.path}/.runtime/log/unified_logs');
    if (!await dir.exists()) {
      await dir.create(recursive: true);
    }
    return dir;
  }

  @override
  Future<void> log(LogEntry entry) async {
    try {
      final logDir = await _logDirFuture;
      
      final dt = entry.timestamp;
      final ymd = '${dt.year}${dt.month.toString().padLeft(2, '0')}${dt.day.toString().padLeft(2, '0')}';
      final hms = '${dt.hour.toString().padLeft(2, '0')}${dt.minute.toString().padLeft(2, '0')}${dt.second.toString().padLeft(2, '0')}';
      
      // Determine prefix based on type
      final prefix = entry is ApiLogEntry ? 'api' : 'system';
      final fileName = '${ymd}_${hms}_${prefix}_${entry.id}.json';

      final file = File('${logDir.path}/$fileName');
      await file.writeAsString(jsonEncode(entry.toJson()), mode: FileMode.write);

      await _enforceRetentionPolicy();
    } catch (e) {
      print('[LoggerRepository] Failed to write log: $e');
    }
  }

  @override
  Future<List<LogEntry>> getLogs({String? type}) async {
    try {
      final logDir = await _logDirFuture;
      if (!await logDir.exists()) return [];

      final files = await logDir.list().toList();
      files.sort((a, b) => b.path.compareTo(a.path)); // Newest first

      final List<LogEntry> logs = [];
      for (final file in files) {
        if (file is File && file.path.endsWith('.json')) {
          // If filtering by type, we can quickly skip files by prefix
          if (type != null) {
            final fileName = file.path.split(Platform.pathSeparator).last;
            if (!fileName.contains('_$type\_')) {
              continue;
            }
          }
          
          try {
            final content = await file.readAsString();
            final json = jsonDecode(content);
            logs.add(LogEntry.fromJson(json));
          } catch (e) {
            print('[LoggerRepository] Failed to parse log file ${file.path}: $e');
          }
        }
      }
      return logs;
    } catch (e) {
      print('[LoggerRepository] Failed to get logs: $e');
      return [];
    }
  }

  @override
  Future<void> clearLogs({String? type}) async {
    try {
      final logDir = await _logDirFuture;
      if (!await logDir.exists()) return;

      final files = await logDir.list().toList();
      for (final file in files) {
        if (file is File && file.path.endsWith('.json')) {
          if (type != null) {
            final fileName = file.path.split(Platform.pathSeparator).last;
            if (!fileName.contains('_$type\_')) {
              continue;
            }
          }
          await file.delete();
        }
      }
    } catch (e) {
      print('[LoggerRepository] Failed to clear logs: $e');
    }
  }

  Future<void> _enforceRetentionPolicy() async {
    try {
      final logDir = await _logDirFuture;
      if (!await logDir.exists()) return;

      final files = await logDir.list().toList();
      if (files.length <= maxFiles) return;

      files.sort((a, b) => b.path.compareTo(a.path)); // Newest first
      
      final filesToDelete = files.sublist(maxFiles);
      for (final file in filesToDelete) {
        await file.delete();
      }
    } catch (e) {
      print('[LoggerRepository] Failed to enforce retention policy: $e');
    }
  }
}
