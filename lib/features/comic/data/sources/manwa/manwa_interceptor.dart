import 'dart:convert';
import 'package:dio/dio.dart';
import 'manwa_crypto.dart';

class ManwaInterceptor extends Interceptor {
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    final tokens = ManwaCrypto.generateTokens();
    
    options.headers.addAll({
      'User-Agent': 'Mozilla/5.0 (Linux; Android 10; SM-A315G) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Mobile Safari/537.36 mwa-1.1.26+1',
      'Accept': 'application/json, text/plain, */*',
      'devid': tokens['devid']!,
      'x-token': tokens['x-token']!,
      'Origin': 'http://mseeowpm1.xyz',
      'Referer': 'http://mseeowpm1.xyz',
      'Accept-Language': 'zh-TW,zh;q=0.9,en-US;q=0.8,en;q=0.7',
      'Content-Type': 'application/json; charset=utf-8',
    });

    super.onRequest(options, handler);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    if (response.data != null) {
      // API might return string or json containing string depending on dio's default json parsing
      String? rawPayload;
      if (response.data is String) {
        rawPayload = response.data as String;
      } else if (response.data is Map || response.data is List) {
        // Sometimes Dio tries to parse if it's partly json, but Manwa returns a Base64 string directly or wrapped
        // In python, they checked if it starts with '"'. Let's just stringify it back if dio parsed it by mistake
        // But usually it's just a raw string if it's base64 without quotes.
        // If the server returns a string with quotes, Dio parses it as String.
        // Wait, if it is a JSON string, Dio parses it. A JSON string like `"base64..."` becomes a Dart String.
        rawPayload = response.data.toString();
      }

      if (rawPayload != null) {
        final xToken = response.requestOptions.headers['x-token'] as String?;
        final devid = response.requestOptions.headers['devid'] as String?;

        if (xToken != null && devid != null) {
          final decryptedString = ManwaCrypto.decryptData(rawPayload, xToken, devid);
          if (decryptedString != null) {
            try {
              response.data = jsonDecode(decryptedString);
            } catch (e) {
              // If json parse fails, we leave response.data as is
            }
          }
        }
      }
    }
    
    super.onResponse(response, handler);
  }
}
