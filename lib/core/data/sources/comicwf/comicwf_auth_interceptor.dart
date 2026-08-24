import 'dart:convert';
import 'package:crypto/crypto.dart';
import 'package:dio/dio.dart';

class ComicWFAuthInterceptor extends Interceptor {
  static const String _salt = "#X2u%rXE^dk%FUpdRH8BvjmZnPDDXLhZ";

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    // Only process POST requests that match form-urlencoded body (or we can just apply to all specific comicwf POSTs)
    if (options.method == 'POST' && options.data is Map<String, dynamic>) {
      final Map<String, dynamic> data = Map.from(
        options.data as Map<String, dynamic>,
      );

      // Inject requestTime
      final requestTime = DateTime.now().millisecondsSinceEpoch.toString();
      data['requestTime'] = requestTime;

      // Generate sign
      final sign = _generateSign(data);
      data['sign'] = sign;

      options.data = data;

      // Ensure content type is application/x-www-form-urlencoded
      options.headers['content-type'] = 'application/x-www-form-urlencoded';
    }

    super.onRequest(options, handler);
  }

  String _generateSign(Map<String, dynamic> params) {
    // 1. Sort keys alphabetically A-Z
    final sortedKeys = params.keys.toList()..sort();

    // 2. Concat Salt + values
    final buffer = StringBuffer(_salt);
    for (final key in sortedKeys) {
      buffer.write(params[key]?.toString() ?? '');
    }

    // 3. Return MD5 lower hex
    final bytes = utf8.encode(buffer.toString());
    return md5.convert(bytes).toString().toLowerCase();
  }
}
