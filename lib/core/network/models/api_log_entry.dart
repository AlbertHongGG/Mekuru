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

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'method': method,
      'url': url,
      'requestHeaders': requestHeaders,
      'requestBody': requestBody,
      'statusCode': statusCode,
      'responseHeaders': responseHeaders,
      'responseBody': responseBody,
      'requestTime': requestTime.toIso8601String(),
      'responseTime': responseTime?.toIso8601String(),
      'error': error,
    };
  }

  factory ApiLogEntry.fromJson(Map<String, dynamic> json) {
    return ApiLogEntry(
      id: json['id'],
      method: json['method'],
      url: json['url'],
      requestHeaders: Map<String, dynamic>.from(json['requestHeaders'] ?? {}),
      requestBody: json['requestBody'],
      statusCode: json['statusCode'],
      responseHeaders: json['responseHeaders'] != null 
          ? Map<String, dynamic>.from(json['responseHeaders']) 
          : null,
      responseBody: json['responseBody'],
      requestTime: DateTime.parse(json['requestTime']),
      responseTime: json['responseTime'] != null 
          ? DateTime.parse(json['responseTime']) 
          : null,
      error: json['error'],
    );
  }
}
