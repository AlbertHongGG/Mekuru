import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mekuru/features/settings/presentation/providers/settings_provider.dart';
import 'package:mekuru/core/network/interceptors/api_log_interceptor.dart';
import 'package:mekuru/features/logger/presentation/providers/logger_provider.dart';
import 'package:mekuru/features/logger/domain/repositories/i_logger_repository.dart';

class ApiClient {
  late final Dio _dio;
  final Ref _ref;
  final ProviderListenable<ILoggerRepository> _loggerRepositoryProvider;
  
  ApiClient(String baseUrl, this._ref, this._loggerRepositoryProvider, {Dio? dioOverride}) {
    _dio = dioOverride ?? Dio(
      BaseOptions(
        baseUrl: baseUrl,
        connectTimeout: const Duration(seconds: 30),
        receiveTimeout: const Duration(seconds: 30),
      ),
    );
    
    if (dioOverride == null) {
      _dio.interceptors.add(ApiLogInterceptor(_ref, _loggerRepositoryProvider));
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
    newDio.interceptors.add(ApiLogInterceptor(_ref, _loggerRepositoryProvider, providerId: providerId));
    return newDio;
  }
}

final apiClientProvider = Provider<ApiClient>((ref) {
  final settings = ref.watch(settingsProvider);
  return ApiClient(
    settings.serverUrl,
    ref,
    loggerRepositoryProvider,
  );
});

final dioProvider = Provider<Dio>((ref) {
  return ref.watch(apiClientProvider).dio;
});
