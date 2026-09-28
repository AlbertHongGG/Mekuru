import 'dart:async';
import 'dart:convert';
import 'dart:math';
import 'package:crypto/crypto.dart';
import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:mekuru/features/comic/data/sources/base_comic_provider.dart';
import 'guazi_crypto.dart';

/// Dio interceptor for Guazi comic provider that encapsulates:
/// 1. Dynamic token lifecycle (visitor login, caching, concurrency lock).
/// 2. Device identity management (stable per-device identifier).
/// 3. Transparent retry on token invalidation (error_code 10002: expired, 10010: mismatch).
/// 4. AES decryption of sensitive response fields.
class GuaziInterceptor extends Interceptor {
  static const String baseUrl = 'https://api.guaziapp.com';
  static const int versionCode = 53;
  static const String _defaultIdentifier =
      'EB806861B10DDD3854CDB02887A3F1AC3ED45644';
  static const String _tokenStorageKey = 'guazi_visitor_token';
  static const String _deviceStorageKey = 'guazi_device_identifier';

  final Dio _dio;
  String? _token;
  String? _identifier;
  Completer<String>? _refreshCompleter;

  GuaziInterceptor(this._dio);

  @override
  Future<void> onRequest(
    RequestOptions options,
    RequestInterceptorHandler handler,
  ) async {
    try {
      final token = await _getToken();
      final identifier = await _getIdentifier();

      options.headers['token'] = token;
      options.headers['devicetype'] = 'android';
      options.headers['user-agent'] = 'okhttp/4.7.2';
      options.headers['accept-encoding'] = 'gzip';
      options.headers['content-type'] = 'application/x-www-form-urlencoded';

      if (options.method.toUpperCase() == 'GET') {
        options.queryParameters['identifier'] = identifier;
        options.queryParameters['versionCode'] = versionCode.toString();
      } else {
        if (options.data is Map<String, dynamic>) {
          options.data['identifier'] = identifier;
          options.data['versionCode'] = versionCode.toString();
        }
      }

      super.onRequest(options, handler);
    } catch (e) {
      handler.reject(
        DioException(
          requestOptions: options,
          error: e is AuthException ? e : AuthException('無法取得 Guazi 認證: $e'),
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

      // Handle token expiration (10002) or token mismatch / logged in elsewhere (10010)
      if (errorCode == 10002 || errorCode == 10010) {
        final isRetry = response.requestOptions.extra['is_retry'] == true;
        if (isRetry) {
          handler.reject(
            DioException(
              requestOptions: response.requestOptions,
              response: response,
              error: AuthException(
                'Guazi Token 換發後驗證依然無效 (code: $errorCode, msg: ${resJson['msg']})',
              ),
              type: DioExceptionType.badResponse,
            ),
          );
          return;
        }

        try {
          // Force refresh token and retry once
          final newToken = await _getToken(forceRefresh: true);
          final retryOptions = response.requestOptions;
          retryOptions.extra['is_retry'] = true;
          retryOptions.headers['token'] = newToken;

          final retryResponse = await _dio.fetch(retryOptions);
          handler.resolve(retryResponse);
          return;
        } catch (e) {
          handler.reject(
            DioException(
              requestOptions: response.requestOptions,
              response: response,
              error: AuthException('Guazi Token 自動換發重試失敗: $e'),
              type: DioExceptionType.badResponse,
            ),
          );
          return;
        }
      }

      // Handle other non-zero server errors
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

      // Decrypt sensitive fields
      response.data = _decryptDict(resJson);
    }

    super.onResponse(response, handler);
  }

  /// Retrieves a valid visitor token, using memory cache, SharedPreferences,
  /// or performing a visitor login if necessary. Concurrency-safe via Completer.
  Future<String> _getToken({bool forceRefresh = false}) async {
    if (!forceRefresh && _token != null && _token!.isNotEmpty) {
      return _token!;
    }

    if (_refreshCompleter != null) {
      return _refreshCompleter!.future;
    }

    _refreshCompleter = Completer<String>();

    try {
      if (!forceRefresh) {
        try {
          final prefs = await SharedPreferences.getInstance();
          final savedToken = prefs.getString(_tokenStorageKey);
          if (savedToken != null && savedToken.isNotEmpty) {
            _token = savedToken;
            _refreshCompleter!.complete(savedToken);
            return savedToken;
          }
        } catch (_) {}
      }

      // Fetch a new token from visitor login API
      final identifier = await _getIdentifier();
      final loginDio = Dio(BaseOptions(
        baseUrl: baseUrl,
        connectTimeout: const Duration(seconds: 15),
        receiveTimeout: const Duration(seconds: 15),
        headers: {
          'devicetype': 'android',
          'user-agent': 'okhttp/4.7.2',
          'content-type': 'application/x-www-form-urlencoded',
          'accept-encoding': 'gzip',
        },
      ));

      final res = await loginDio.post(
        '/index.php/api/v2/login/visitor',
        data: {
          'identifier': identifier,
          'versionCode': versionCode.toString(),
        },
      );

      final resData = res.data;
      if (resData is Map<String, dynamic> && resData['error_code'] == 0) {
        final newToken = resData['data']?['token'] as String?;
        if (newToken != null && newToken.isNotEmpty) {
          _token = newToken;
          try {
            final prefs = await SharedPreferences.getInstance();
            await prefs.setString(_tokenStorageKey, newToken);
          } catch (_) {}
          _refreshCompleter!.complete(newToken);
          return newToken;
        }
      }

      final msg = resData is Map ? resData['msg'] : '未知登入異常';
      throw AuthException('訪客登入失敗: $msg');
    } catch (e) {
      _refreshCompleter!.completeError(e);
      rethrow;
    } finally {
      _refreshCompleter = null;
    }
  }

  /// Retrieves or generates a unique, stable 40-character uppercase hex device identifier.
  Future<String> _getIdentifier() async {
    if (_identifier != null && _identifier!.isNotEmpty) {
      return _identifier!;
    }

    try {
      final prefs = await SharedPreferences.getInstance();
      var id = prefs.getString(_deviceStorageKey);
      if (id == null || id.isEmpty) {
        final seed =
            '${DateTime.now().microsecondsSinceEpoch}-${Random().nextInt(9999999)}';
        id = sha1.convert(utf8.encode(seed)).toString().toUpperCase();
        await prefs.setString(_deviceStorageKey, id);
      }
      _identifier = id;
      return id;
    } catch (_) {
      return _defaultIdentifier;
    }
  }

  dynamic _decryptDict(dynamic data) {
    if (data is Map<String, dynamic>) {
      for (final entry in data.entries) {
        final key = entry.key;
        final value = entry.value;
        if ((key == 'name' || key == 'img') &&
            value is String &&
            value.isNotEmpty) {
          try {
            final decrypted = GuaziCrypto.decrypt(value);
            if (decrypted.isNotEmpty) {
              data[key] = decrypted;
            }
          } catch (_) {}
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
