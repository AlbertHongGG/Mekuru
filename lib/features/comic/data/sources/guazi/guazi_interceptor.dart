import 'package:dio/dio.dart';
import 'package:mekuru/features/comic/data/sources/base_comic_provider.dart';
import 'guazi_auth_session.dart';
import 'guazi_crypto.dart';
import 'guazi_constants.dart';

/// Dio interceptor for Guazi that handles:
/// 1. Dynamic token injection and common parameter attachment.
/// 2. Transparent token refresh and request retry on token expiration (error_code 10002).
/// 3. Transparent AES decryption of encrypted fields (name, img).
class GuaziInterceptor extends Interceptor {
  final GuaziAuthSession _session;
  final Dio _dio;

  GuaziInterceptor(this._session, this._dio);

  @override
  Future<void> onRequest(
    RequestOptions options,
    RequestInterceptorHandler handler,
  ) async {
    try {
      // 1. Dynamically retrieve a valid token
      final token = await _session.getToken();
      options.headers['token'] = token;
      options.headers['devicetype'] = 'android';
      options.headers['user-agent'] = 'okhttp/4.7.2';
      options.headers['accept-encoding'] = 'gzip';
      options.headers['content-type'] = 'application/x-www-form-urlencoded';

      // 2. Append identifier and versionCode to all requests
      if (options.method.toUpperCase() == 'GET') {
        options.queryParameters['identifier'] = GuaziConstants.identifier;
        options.queryParameters['versionCode'] = GuaziConstants.versionCode.toString();
      } else {
        if (options.data is Map<String, dynamic>) {
          options.data['identifier'] = GuaziConstants.identifier;
          options.data['versionCode'] = GuaziConstants.versionCode.toString();
        }
      }

      super.onRequest(options, handler);
    } catch (e) {
      handler.reject(
        DioException(
          requestOptions: options,
          error: e is AuthException ? e : AuthException('無法取得 Guazi 認證 Token: $e'),
          type: DioExceptionType.unknown,
        ),
      );
    }
  }

  @override
  Future<void> onResponse(
    Response response,
    ResponseInterceptorHandler handler,
  ) async {
    if (response.data is Map<String, dynamic>) {
      final resJson = response.data as Map<String, dynamic>;
      final int errorCode = resJson['error_code'] ?? -1;

      // Handle token expired / invalid format (error_code 10002)
      if (errorCode == 10002) {
        final isRetry = response.requestOptions.extra['is_retry'] == true;
        if (isRetry) {
          // Already retried once, prevent infinite loop and reject
          handler.reject(
            DioException(
              requestOptions: response.requestOptions,
              response: response,
              error: AuthException('Guazi Token 換發後驗證依然無效'),
              type: DioExceptionType.badResponse,
            ),
          );
          return;
        }

        try {
          // Force refresh the token
          final newToken = await _session.getToken(forceRefresh: true);

          // Prepare retry request options
          final retryOptions = response.requestOptions;
          retryOptions.extra['is_retry'] = true;
          retryOptions.headers['token'] = newToken;

          // Re-dispatch request
          final retryResponse = await _dio.fetch(retryOptions);
          handler.resolve(retryResponse);
          return;
        } catch (e) {
          handler.reject(
            DioException(
              requestOptions: response.requestOptions,
              response: response,
              error: AuthException('Guazi Token 自動換發失敗: $e'),
              type: DioExceptionType.badResponse,
            ),
          );
          return;
        }
      }

      // Handle other API errors
      if (errorCode != 0) {
        final msg = resJson['msg'] ?? 'Unknown error';
        handler.reject(
          DioException(
            requestOptions: response.requestOptions,
            response: response,
            error: ServerException(msg),
            type: DioExceptionType.badResponse,
          ),
        );
        return;
      }

      // Decrypt specific fields
      response.data = _decryptDict(resJson);
    }

    super.onResponse(response, handler);
  }

  dynamic _decryptDict(dynamic data) {
    if (data is Map<String, dynamic>) {
      for (final entry in data.entries) {
        final key = entry.key;
        final value = entry.value;
        if ((key == 'name' || key == 'img') && value is String && value.isNotEmpty) {
          try {
            final decrypted = GuaziCrypto.decrypt(value);
            if (decrypted.isNotEmpty) {
              data[key] = decrypted;
            }
          } catch (e) {
            // Decryption failed, keep original
          }
        } else {
          data[key] = _decryptDict(value);
        }
      }
      return data;
    } else if (data is List) {
      for (int i = 0; i < data.length; i++) {
        data[i] = _decryptDict(data[i]);
      }
      return data;
    }
    return data;
  }
}
