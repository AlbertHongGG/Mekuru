import 'package:uuid/uuid.dart';

class ApiLogEntry {
  final String id;
  final String method;
  final String url;
  final Map<String, dynamic> requestHeaders;
  final dynamic requestBody;
  
  final int? statusCode;
  final Map<String, dynamic>? responseHeaders;
  final dynamic responseBody;
  
  final DateTime requestTime;
  final DateTime? responseTime;
  final String? error;

  ApiLogEntry({
    String? id,
    required this.method,
    required this.url,
    this.requestHeaders = const {},
    this.requestBody,
    this.statusCode,
    this.responseHeaders,
    this.responseBody,
    required this.requestTime,
    this.responseTime,
    this.error,
  }) : id = id ?? const Uuid().v4();

  int? get durationMs {
    if (responseTime == null) return null;
    return responseTime!.difference(requestTime).inMilliseconds;
  }

  ApiLogEntry copyWith({
    String? method,
    String? url,
    Map<String, dynamic>? requestHeaders,
    dynamic requestBody,
    int? statusCode,
    Map<String, dynamic>? responseHeaders,
    dynamic responseBody,
    DateTime? requestTime,
    DateTime? responseTime,
    String? error,
  }) {
    return ApiLogEntry(
      id: id,
      method: method ?? this.method,
      url: url ?? this.url,
      requestHeaders: requestHeaders ?? this.requestHeaders,
      requestBody: requestBody ?? this.requestBody,
      statusCode: statusCode ?? this.statusCode,
      responseHeaders: responseHeaders ?? this.responseHeaders,
      responseBody: responseBody ?? this.responseBody,
      requestTime: requestTime ?? this.requestTime,
      responseTime: responseTime ?? this.responseTime,
      error: error ?? this.error,
    );
  }
}
