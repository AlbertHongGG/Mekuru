import 'dart:convert';
import 'package:crypto/crypto.dart';
import 'package:encrypt/encrypt.dart';
import 'package:intl/intl.dart';

class GuaziCrypto {
  static String _md5(String input) {
    return md5.convert(utf8.encode(input)).toString().toLowerCase();
  }

  static ({String key, String iv}) _getKeyAndIv([String? dateStr]) {
    final String date = dateStr ?? DateFormat('yyyyMMdd').format(DateTime.now());
    final String rawStr = 'guazi$date';
    final String fullMd5 = _md5(rawStr);

    final String key = fullMd5;
    final String iv = fullMd5.substring(8, 24);
    return (key: key, iv: iv);
  }

  static String decrypt(String ciphertextB64, [String? dateStr]) {
    if (ciphertextB64.isEmpty) return '';

    try {
      final keys = _getKeyAndIv(dateStr);
      final key = Key.fromUtf8(keys.key);
      final iv = IV.fromUtf8(keys.iv);

      final encrypter = Encrypter(AES(key, mode: AESMode.cbc, padding: 'PKCS7'));
      final encrypted = Encrypted.fromBase64(ciphertextB64);
      final decrypted = encrypter.decrypt(encrypted, iv: iv);
      return decrypted;
    } catch (e) {
      // Fallback for old cache or wrong date, though it's rare
      return '';
    }
  }

  static String encrypt(String plaintext, [String? dateStr]) {
    if (plaintext.isEmpty) return '';

    final keys = _getKeyAndIv(dateStr);
    final key = Key.fromUtf8(keys.key);
    final iv = IV.fromUtf8(keys.iv);

    final encrypter = Encrypter(AES(key, mode: AESMode.cbc, padding: 'PKCS7'));
    final encrypted = encrypter.encrypt(plaintext, iv: iv);
    return encrypted.base64;
  }
}
