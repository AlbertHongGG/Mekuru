import 'package:freezed_annotation/freezed_annotation.dart';

part 'log_entry.freezed.dart';
part 'log_entry.g.dart';

@Freezed(unionKey: 'type')
sealed class LogEntry with _$LogEntry {
  const LogEntry._();

  const factory LogEntry.api({
    required String id,
    required DateTime timestamp,
    required String method,
    required String url,
    @Default({}) Map<String, dynamic> requestHeaders,
    dynamic requestBody,
    int? statusCode,
    Map<String, dynamic>? responseHeaders,
    dynamic responseBody,
    DateTime? responseTime,
    String? error,
  }) = ApiLogEntry;

  const factory LogEntry.system({
    required String id,
    required DateTime timestamp,
    required String eventType,
    required dynamic data,
  }) = SystemLogEntry;

  factory LogEntry.fromJson(Map<String, dynamic> json) => _$LogEntryFromJson(json);

  int? get durationMs {
    if (this is ApiLogEntry) {
      final api = this as ApiLogEntry;
      if (api.responseTime == null) return null;
      return api.responseTime!.difference(api.timestamp).inMilliseconds;
    }
    return null;
  }
}
