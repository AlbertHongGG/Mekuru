import 'dart:convert';
import 'package:crypto/crypto.dart';
import 'package:dio/dio.dart';

import 'dart:io';

class CopyMGSigner {
  // Fixed key extracted from the App
  static const String _fixedTapString = '3af08590311032efe0660550a0563a53';
  
  int? _clockOffset;
  bool _isSyncing = false;

  /// Fetch the server's time and calculate the offset to our local clock.
  Future<void> syncClockOffset() async {
    if (_isSyncing || _clockOffset != null) return;
    _isSyncing = true;
    try {
      final dio = Dio(BaseOptions(
        connectTimeout: const Duration(seconds: 5),
        receiveTimeout: const Duration(seconds: 5),
      ));
      
      final response = await dio.head(
        'https://api.copy202601.com/api/v3/comics',
        options: Options(
          headers: {'user-agent': 'COPY/3.0.9'},
        ),
      );
      
      final dateHeader = response.headers.value('Date');
      if (dateHeader != null) {
        final serverDt = HttpDate.parse(dateHeader);
        final serverTs = (serverDt.millisecondsSinceEpoch / 1000).floor();
        final localTs = (DateTime.now().millisecondsSinceEpoch / 1000).floor();
        _clockOffset = serverTs - localTs;
      } else {
        _clockOffset = -3; // fallback
      }
    } catch (e) {
      _clockOffset = -3; // fallback safely
    } finally {
      _isSyncing = false;
    }
  }

  /// Generates dynamic authentication headers.
  Future<Map<String, String>> getAuthHeaders() async {
    if (_clockOffset == null) {
      await syncClockOffset();
    }
    
    final currentTimestampTs = (DateTime.now().millisecondsSinceEpoch / 1000).floor() + (_clockOffset ?? -3);
    final currentTimestampStr = currentTimestampTs.toString();
    
    final key = utf8.encode(_fixedTapString);
    final bytes = utf8.encode(currentTimestampStr);
    
    final hmacSha256 = Hmac(sha256, key);
    final digest = hmacSha256.convert(bytes);
    
    return {
      'x-auth-timestamp': currentTimestampStr,
      'x-auth-signature': digest.toString(),
    };
  }
}
