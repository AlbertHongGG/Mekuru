import 'dart:async';
import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:mekuru/features/comic/data/sources/base_comic_provider.dart';
import 'guazi_constants.dart';

/// Manages authentication session, token lifecycle, local persistence,
/// and concurrency-safe token renewal for the Guazi source provider.
class GuaziAuthSession {
  static const String _storageKey = 'guazi_visitor_token';

  String? _inMemoryToken;
  Completer<String>? _refreshCompleter;

  /// Retrieves a valid token.
  /// Checks in-memory cache first, then SharedPreferences, and finally fetches
  /// a new token from the visitor login API if absent or when [forceRefresh] is true.
  Future<String> getToken({bool forceRefresh = false}) async {
    if (!forceRefresh && _inMemoryToken != null && _inMemoryToken!.isNotEmpty) {
      return _inMemoryToken!;
    }

    // Concurrency lock: If a token fetch is already underway, wait for it
    if (_refreshCompleter != null) {
      return _refreshCompleter!.future;
    }

    _refreshCompleter = Completer<String>();

    try {
      if (!forceRefresh) {
        // Try reading from local persistent storage
        try {
          final prefs = await SharedPreferences.getInstance();
          final savedToken = prefs.getString(_storageKey);
          if (savedToken != null && savedToken.isNotEmpty) {
            _inMemoryToken = savedToken;
            _refreshCompleter!.complete(savedToken);
            return savedToken;
          }
        } catch (_) {
          // If storage read fails, gracefully proceed to network fetch
        }
      }

      // Fetch a new token from visitor login API
      final newToken = await _fetchVisitorToken();
      _inMemoryToken = newToken;

      // Persist to local storage
      try {
        final prefs = await SharedPreferences.getInstance();
        await prefs.setString(_storageKey, newToken);
      } catch (_) {
        // Non-fatal if persistence fails, in-memory cache remains valid
      }

      _refreshCompleter!.complete(newToken);
      return newToken;
    } catch (e) {
      _refreshCompleter!.completeError(e);
      rethrow;
    } finally {
      _refreshCompleter = null;
    }
  }

  /// Clears in-memory and persisted tokens.
  Future<void> clearToken() async {
    _inMemoryToken = null;
    try {
      final prefs = await SharedPreferences.getInstance();
      await prefs.remove(_storageKey);
    } catch (_) {}
  }

  /// Performs a visitor login request using an isolated Dio instance
  /// to avoid circular dependency with interceptors.
  Future<String> _fetchVisitorToken() async {
    final dio = Dio(BaseOptions(
      baseUrl: GuaziConstants.baseUrl,
      connectTimeout: const Duration(seconds: 15),
      receiveTimeout: const Duration(seconds: 15),
      headers: {
        'devicetype': 'android',
        'user-agent': 'okhttp/4.7.2',
        'content-type': 'application/x-www-form-urlencoded',
        'accept-encoding': 'gzip',
      },
    ));

    try {
      final response = await dio.post(
        '/index.php/api/v2/login/visitor',
        data: {
          'identifier': GuaziConstants.identifier,
          'versionCode': GuaziConstants.versionCode.toString(),
        },
      );

      final resData = response.data;
      if (resData is Map<String, dynamic>) {
        final int errorCode = resData['error_code'] ?? -1;
        if (errorCode == 0) {
          final token = resData['data']?['token'] as String?;
          if (token != null && token.isNotEmpty) {
            return token;
          }
        }
        final msg = resData['msg'] ?? '訪客登入失敗 (code: $errorCode)';
        throw AuthException(msg.toString());
      }

      throw AuthException('訪客登入伺服器回應格式異常');
    } on DioException catch (e) {
      throw AuthException('訪客登入連線失敗: ${e.message}');
    }
  }
}
