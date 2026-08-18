import 'dart:convert';
import 'dart:io';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../models/api_log_entry.dart';
import '../logger/api_file_logger.dart';

// 1. Unified DI for the Logger
final apiFileLoggerProvider = Provider<ApiFileLogger>((ref) {
  return ApiFileLogger();
});

class ApiLoggerNotifier extends StateNotifier<List<ApiLogEntry>> {
  final int maxLogs;
  final ApiFileLogger _fileLogger;

  // We keep a map of pending requests in memory with full payload
  final Map<String, ApiLogEntry> _pendingLogs = {};

  ApiLoggerNotifier(this._fileLogger, {this.maxLogs = 500}) : super([]) {
    _loadLogs();
  }

  Future<void> _loadLogs() async {
    final files = await _fileLogger.getLogs();
    final List<ApiLogEntry> loadedLogs = [];
    
    for (final file in files) {
      try {
        if (file is File && await file.exists()) {
          final content = await file.readAsString();
          final json = jsonDecode(content);
          
          // Phase 1: Lightweight Metadata Extraction
          // We intentionally discard the heavy request/response bodies for the list view
          final shallowEntry = ApiLogEntry(
            id: json['id'],
            method: json['method'],
            url: json['url'],
            statusCode: json['statusCode'],
            requestTime: DateTime.parse(json['requestTime']),
            responseTime: json['responseTime'] != null 
                ? DateTime.parse(json['responseTime']) 
                : null,
            error: json['error'],
            requestHeaders: const {},
            requestBody: null,
            responseHeaders: null,
            responseBody: null,
          );
          
          loadedLogs.add(shallowEntry);
        }
      } catch (e) {
        print('[ApiLoggerNotifier] Failed to load log file: $e');
      }
    }
    
    loadedLogs.sort((a, b) => b.requestTime.compareTo(a.requestTime));
    state = loadedLogs;
  }

  void addLog(ApiLogEntry log) {
    _pendingLogs[log.id] = log;
    
    // UI gets the shallow version
    final shallowLog = _createShallow(log);
    state = [shallowLog, ...state];
    
    if (state.length > maxLogs) {
      state = state.sublist(0, maxLogs);
    }
  }

  void updateLog(ApiLogEntry log) {
    _pendingLogs[log.id] = log;
    
    final shallowLog = _createShallow(log);
    state = [
      for (final l in state)
        if (l.id == log.id) shallowLog else l
    ];
    
    // When log is updated (i.e. response received), we persist the FULL log to disk.
    // If it's the final update, we could remove it from pendingLogs, but leaving it 
    // in pendingLogs for a while is fine or we just write to disk.
    _saveLog(log);
    _pendingLogs.remove(log.id);
  }
  
  ApiLogEntry _createShallow(ApiLogEntry log) {
    return log.copyWith(
      requestHeaders: const {},
      requestBody: null,
      responseHeaders: null,
      responseBody: null,
    );
  }
  
  Future<void> _saveLog(ApiLogEntry log) async {
    _fileLogger.setContext(log);
    _fileLogger.log(log.toJson());
  }

  void removeLog(String id) async {
    try {
      _pendingLogs.remove(id);
      final logToRemove = state.firstWhere((l) => l.id == id);
      state = state.where((l) => l.id != id).toList();
      
      _fileLogger.setContext(logToRemove);
      final logDir = await _fileLogger.logDirFuture;
      final fileName = _fileLogger.getFileName();
      final file = File('${logDir.path}/$fileName');
      if (await file.exists()) {
        await file.delete();
      }
    } catch (e) {
      print('[ApiLoggerNotifier] Failed to remove log: $e');
    }
  }

  void clearLogsByMethod(String method) async {
    final targetMethod = method.toUpperCase();
    
    // Remove from UI state
    state = state.where((l) => l.method.toUpperCase() != targetMethod).toList();
    
    // Remove from pending
    _pendingLogs.removeWhere((key, value) => value.method.toUpperCase() == targetMethod);
    
    // Remove from disk
    final files = await _fileLogger.getLogs();
    for (final file in files) {
      try {
        if (file is File && await file.exists()) {
          final content = await file.readAsString();
          final json = jsonDecode(content);
          if (json['method'].toString().toUpperCase() == targetMethod) {
            await file.delete();
          }
        }
      } catch (_) {}
    }
  }

  void clearLogs() async {
    _pendingLogs.clear();
    state = [];
    await _fileLogger.clearLogs();
  }
}

// StateNotifier Provider
final apiLoggerProvider = StateNotifierProvider<ApiLoggerNotifier, List<ApiLogEntry>>((ref) {
  final fileLogger = ref.watch(apiFileLoggerProvider);
  return ApiLoggerNotifier(fileLogger);
});

// Phase 3: Lazy-Loading Detail Mechanism
final apiLogDetailProvider = FutureProvider.autoDispose.family<ApiLogEntry?, String>((ref, id) async {
  final fileLogger = ref.watch(apiFileLoggerProvider);
  final file = await fileLogger.getFileById(id);
  
  if (file != null && await file.exists()) {
    final content = await file.readAsString();
    return ApiLogEntry.fromJson(jsonDecode(content));
  }
  
  // If it's still pending (not written to disk yet)
  final notifier = ref.read(apiLoggerProvider.notifier);
  if (notifier._pendingLogs.containsKey(id)) {
    return notifier._pendingLogs[id];
  }
  
  return null;
});
