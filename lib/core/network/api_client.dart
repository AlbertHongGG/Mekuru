import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mekuru/features/settings/presentation/providers/settings_provider.dart';
import 'package:mekuru/core/network/interceptors/api_log_interceptor.dart';
import 'package:mekuru/features/logger/domain/services/app_logger_service.dart';

class ApiClient {
  late final Dio _dio;
  final Ref _ref;
  final ProviderListenable<IAppLogger> _appLoggerProvider;
  
  ApiClient(String baseUrl, this._ref, this._appLoggerProvider, {Dio? dioOverride}) {
    _dio = dioOverride ?? Dio(
      BaseOptions(
        baseUrl: baseUrl,
        connectTimeout: const Duration(seconds: 30),
        receiveTimeout: const Duration(seconds: 30),
      ),
    );
    
    if (dioOverride == null) {
      _dio.interceptors.add(ApiLogInterceptor(_ref, _appLoggerProvider));
    }
  }

  Dio get dio => _dio;

  Dio createProviderDio(String baseUrl, {String? providerId}) {
    final newDio = Dio(
      BaseOptions(
        baseUrl: baseUrl,
        connectTimeout: const Duration(seconds: 15),
        receiveTimeout: const Duration(seconds: 15),
      ),
    );
    newDio.interceptors.add(ApiLogInterceptor(_ref, _appLoggerProvider, providerId: providerId));
    return newDio;
  }
}

final apiClientProvider = Provider<ApiClient>((ref) {
  final settings = ref.watch(settingsProvider);
  return ApiClient(
    '' /* Legacy serverUrl removed */,
    ref,
    appLoggerProvider,
  );
});

final dioProvider = Provider<Dio>((ref) {
  return ref.watch(apiClientProvider).dio;
});
