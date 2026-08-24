// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'log_entry.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ApiLogEntry _$ApiLogEntryFromJson(Map<String, dynamic> json) => ApiLogEntry(
  id: json['id'] as String,
  timestamp: DateTime.parse(json['timestamp'] as String),
  method: json['method'] as String,
  url: json['url'] as String,
  requestHeaders: json['requestHeaders'] as Map<String, dynamic>? ?? const {},
  requestBody: json['requestBody'],
  statusCode: (json['statusCode'] as num?)?.toInt(),
  responseHeaders: json['responseHeaders'] as Map<String, dynamic>?,
  responseBody: json['responseBody'],
  responseTime: json['responseTime'] == null
      ? null
      : DateTime.parse(json['responseTime'] as String),
  error: json['error'] as String?,
  $type: json['type'] as String?,
);

Map<String, dynamic> _$ApiLogEntryToJson(ApiLogEntry instance) =>
    <String, dynamic>{
      'id': instance.id,
      'timestamp': instance.timestamp.toIso8601String(),
      'method': instance.method,
      'url': instance.url,
      'requestHeaders': instance.requestHeaders,
      'requestBody': instance.requestBody,
      'statusCode': instance.statusCode,
      'responseHeaders': instance.responseHeaders,
      'responseBody': instance.responseBody,
      'responseTime': instance.responseTime?.toIso8601String(),
      'error': instance.error,
      'type': instance.$type,
    };

SystemLogEntry _$SystemLogEntryFromJson(Map<String, dynamic> json) =>
    SystemLogEntry(
      id: json['id'] as String,
      timestamp: DateTime.parse(json['timestamp'] as String),
      eventType: json['eventType'] as String,
      data: json['data'],
      $type: json['type'] as String?,
    );

Map<String, dynamic> _$SystemLogEntryToJson(SystemLogEntry instance) =>
    <String, dynamic>{
      'id': instance.id,
      'timestamp': instance.timestamp.toIso8601String(),
      'eventType': instance.eventType,
      'data': instance.data,
      'type': instance.$type,
    };
