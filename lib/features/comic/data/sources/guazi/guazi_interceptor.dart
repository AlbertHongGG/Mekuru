import 'package:dio/dio.dart';
import 'package:mekuru/features/comic/data/sources/base_comic_provider.dart'; // For ServerException
import 'guazi_crypto.dart';
import 'guazi_constants.dart';

class GuaziInterceptor extends Interceptor {
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    // Append identifier and versionCode to all requests
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
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    if (response.data is Map<String, dynamic>) {
      final resJson = response.data as Map<String, dynamic>;
      
      final int errorCode = resJson['error_code'] ?? -1;
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
            // Decryption failed, keep original or ignore
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
