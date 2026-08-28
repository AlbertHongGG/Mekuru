import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mekuru/features/logger/domain/models/log_entry.dart';
import 'package:mekuru/features/logger/domain/repositories/i_logger_repository.dart';
import 'package:uuid/uuid.dart';

class ApiLogInterceptor extends Interceptor {
  final ProviderListenable<ILoggerRepository> loggerRepositoryProvider;
  final Ref ref;
  final String? providerId;

  ApiLogInterceptor(this.ref, this.loggerRepositoryProvider, {this.providerId});

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    dynamic reqBody = options.data;
    if (reqBody is List<int> || options.contentType?.contains('multipart/form-data') == true) {
      reqBody = '[Binary Data / Stream]';
    }

    final entry = LogEntry.api(
      id: const Uuid().v4(),
      method: options.method,
      url: options.uri.toString(),
      providerId: providerId,
      actionType: options.extra['actionType'] as String? ?? 'Other',
      requestHeaders: options.headers,
      requestBody: reqBody,
      timestamp: DateTime.now(),
    );

    // Save entire entry in extra to retrieve it in response
    options.extra['api_log_entry'] = entry;
    
    ref.read(loggerRepositoryProvider).log(entry);
    
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
    final existingLog = options.extra['api_log_entry'] as LogEntry?;
    if (existingLog == null || existingLog is! ApiLogEntry) return;

    dynamic resBody = response?.data;
    if (options.responseType == ResponseType.bytes || options.responseType == ResponseType.stream) {
      resBody = '[Binary Data / Stream]';
    } else if (resBody is List<int>) {
      resBody = '[Binary Data]';
    }

    final updatedLog = existingLog.copyWith(
      statusCode: response?.statusCode,
      responseHeaders: response?.headers.map,
      responseBody: resBody,
      responseTime: DateTime.now(),
      error: error,
    );

    ref.read(loggerRepositoryProvider).log(updatedLog);
  }
}

