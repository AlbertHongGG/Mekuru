import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mekuru/features/settings/presentation/providers/settings_provider.dart';
import 'package:mekuru/core/network/interceptors/api_log_interceptor.dart';

class ApiClient {
  late final Dio _dio;
  
  ApiClient(String baseUrl, {Dio? dioOverride, Interceptor? loggerInterceptor}) {
    _dio = dioOverride ?? Dio(
      BaseOptions(
        baseUrl: baseUrl,
        connectTimeout: const Duration(seconds: 30),
        receiveTimeout: const Duration(seconds: 30),
      ),
    );
    
    if (loggerInterceptor != null && dioOverride == null) {
      _dio.interceptors.add(loggerInterceptor);
    }
  }

  Dio get dio => _dio;
}

final apiClientProvider = Provider<ApiClient>((ref) {
  final settings = ref.watch(settingsProvider);
  return ApiClient(
    settings.serverUrl,
    loggerInterceptor: ApiLogInterceptor(ref),
  );
});

final dioProvider = Provider<Dio>((ref) {
  return ref.watch(apiClientProvider).dio;
});
