import 'package:dio/dio.dart';
import 'package:intl/intl.dart';
import 'copymg_signer.dart';

class CopyMGAuthInterceptor extends Interceptor {
  final CopyMGSigner _signer;

  CopyMGAuthInterceptor(this._signer);

  @override
  Future<void> onRequest(
      RequestOptions options, RequestInterceptorHandler handler) async {
    
    // Inject required platform and other config.py headers
    options.queryParameters['platform'] = 3;
    
    options.headers.addAll({
      "user-agent": "COPY/3.0.9",
      "source": "copyApp",
      "deviceinfo": "SM-A315G-a31",
      "webp": "1",
      "authorization": "Token",
      "content-type": "application/x-www-form-urlencoded",
      "versioncode": "83",
      "platform": "3",
      "referer": "com.copymanga.app-3.0.9",
      "accept": "application/json",
      "version": "3.0.9",
      "region": "2",
      "device": "QP1A.190711.020",
      "pseudoid": "OlQmUqBrowrvbTdQ",
      "host": "api.copy202601.com",
      "umstring": "b4c89ca4104ea9a97750314d791520ac",
    });

    // Override dt with today's date in YYYY.MM.DD format
    options.headers["dt"] = DateFormat('yyyy.MM.dd').format(DateTime.now());

    try {
      final authHeaders = await _signer.getAuthHeaders();
      options.headers.addAll(authHeaders);
    } catch (e) {
      // Allow the request to proceed even if auth headers fail to generate
    }

    super.onRequest(options, handler);
  }
}
