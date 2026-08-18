import 'dart:io';
import 'package:mekuru/core/logger/base_file_logger.dart';
import '../models/api_log_entry.dart';

class ApiFileLogger extends BaseFileLogger<Map<String, dynamic>> {
  ApiFileLogger() : super('api_logs');

  String _currentFileName = '';

  void setContext(ApiLogEntry entry) {
    _currentFileName = 'api_log_${entry.id}.json';
  }

  @override
  String getFileName() {
    return _currentFileName;
  }
  
  Future<File?> getFileById(String id) async {
    try {
      final logDir = await logDirFuture;
      final file = File('${logDir.path}/api_log_$id.json');
      if (await file.exists()) {
        return file;
      }
    } catch (_) {}
    return null;
  }
}
