import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../models/api_log_entry.dart';
import '../providers/api_logger_provider.dart';

class ApiLogInterceptor extends Interceptor {
  final Ref ref;

  ApiLogInterceptor(this.ref);

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    final entry = ApiLogEntry(
      method: options.method,
      url: options.uri.toString(),
      requestHeaders: options.headers,
      requestBody: options.data,
      requestTime: DateTime.now(),
    );

    // Save ID in extra to retrieve it in response
    options.extra['api_log_id'] = entry.id;
    
    ref.read(apiLoggerProvider.notifier).addLog(entry);
    
    super.onRequest(options, handler);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    _updateLog(response.requestOptions, response);
    super.onResponse(response, handler);
  }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    _updateLog(err.requestOptions, err.response, error: err.toString());
    super.onError(err, handler);
  }

  void _updateLog(RequestOptions options, Response? response, {String? error}) {
    final id = options.extra['api_log_id'] as String?;
    if (id == null) return;

    final logs = ref.read(apiLoggerProvider);
    final existingLogIndex = logs.indexWhere((l) => l.id == id);
    if (existingLogIndex == -1) return;

    final existingLog = logs[existingLogIndex];
    final updatedLog = existingLog.copyWith(
      statusCode: response?.statusCode,
      responseHeaders: response?.headers.map,
      responseBody: response?.data,
      responseTime: DateTime.now(),
      error: error,
    );

    ref.read(apiLoggerProvider.notifier).updateLog(updatedLog);
  }
}
