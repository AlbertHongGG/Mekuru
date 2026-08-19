import 'dart:convert';
import 'package:crypto/crypto.dart';
import 'package:dio/dio.dart';

class WebtoonAuthInterceptor extends Interceptor {
  static const String _secretKeyString = "gUtPzJFZch4ZyAGviiyH94P99lQ3pFdRTwpJWDlSGFfwgpr6ses5ALOxWHOIT7R1";
  late final List<int> _secretKeyBytes;

  WebtoonAuthInterceptor() {
    _secretKeyBytes = utf8.encode(_secretKeyString);
  }

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    // Inject default Webtoon params
    options.queryParameters['serviceZone'] = 'GLOBAL';
    options.queryParameters['language'] = 'zh-hant';
    options.queryParameters['locale'] = 'zh-hant';
    options.queryParameters['platform'] = 'APP_ANDROID';

    // Sign the URL
    final url = options.uri.toString();
    final msgpad = DateTime.now().millisecondsSinceEpoch.toString();
    
    // 1. Truncate URL to 255 chars
    final truncatedUrl = url.length > 255 ? url.substring(0, 255) : url;
    
    // 2. Concat URL + msgpad
    final payload = truncatedUrl + msgpad;
    final payloadBytes = utf8.encode(payload);
    
    // 3. HMAC-SHA1
    final hmac = Hmac(sha1, _secretKeyBytes);
    final digest = hmac.convert(payloadBytes);
    
    // 4. Base64 Encode
    final b64Str = base64.encode(digest.bytes);
    
    // 5. URL Encode (handled safely by Dio queryParameters, or we append directly)
    // Actually, we can just add them to queryParameters and Dio handles the encoding
    options.queryParameters['msgpad'] = msgpad;
    options.queryParameters['md'] = b64Str;

    // Common Webtoon headers
    options.headers['User-Agent'] = 'nApps (Android 9; 22081212C; linewebtoon; 3.9.9)';
    
    super.onRequest(options, handler);
  }
}
