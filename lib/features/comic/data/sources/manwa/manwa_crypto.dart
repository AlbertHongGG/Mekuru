import 'dart:convert';
import 'dart:typed_data';
import 'package:crypto/crypto.dart';
import 'package:encrypt/encrypt.dart';

class ManwaCrypto {
  static const String _tokenSalt = 'jsdaghuiaonfyudsfnkgjdfkdd';
  static const String _keySalt = ',noiusdfy73osadjap012njdsfn';

  /// Generates the necessary tokens for headers.
  /// Returns a Map with 'devid' and 'x-token'.
  static Map<String, String> generateTokens() {
    final devid = DateTime.now().millisecondsSinceEpoch.toString();
    final tokenRaw = '$devid,$_tokenSalt';
    final xToken = md5.convert(utf8.encode(tokenRaw)).toString();

    return {
      'devid': devid,
      'x-token': xToken,
    };
  }

  /// Decrypts the raw response string from Manwa API.
  /// Returns the decrypted JSON string, or null if decryption fails.
  static String? decryptData(
      String rawResponse, String xToken, String devid) {
    String cleanedStr = rawResponse.trim();
    if (cleanedStr.startsWith('"') && cleanedStr.endsWith('"')) {
      cleanedStr = cleanedStr.substring(1, cleanedStr.length - 1);
    }
    cleanedStr = cleanedStr.replaceAll(r'\/', '/').replaceAll(r'\', '');

    final encrypted = Encrypted.fromBase64(cleanedStr);

    // Try both seeds to decrypt
    for (final seed in [xToken, devid]) {
      try {
        final keyStr = md5.convert(utf8.encode('$seed$_keySalt')).toString();
        final key = Key.fromUtf8(keyStr);
        final encrypter =
            Encrypter(AES(key, mode: AESMode.ecb, padding: 'PKCS7'));

        // IV is ignored in ECB mode, but the library requires a non-null IV, so we pass an empty one.
        final plainText = encrypter.decrypt(encrypted, iv: IV.fromLength(16));
        return plainText;
      } catch (e) {
        // If decryption fails, try the next seed
        continue;
      }
    }
    
    // Both failed
    return null;
  }

  /// Decrypts the encrypted image bytes using AES-128-CBC.
  static Uint8List? decryptImageBytes(Uint8List encryptedBytes) {
    try {
      final key = Key.fromUtf8('my2ecret782ecret');
      final iv = IV.fromUtf8('my2ecret782ecret');
      final encrypter =
          Encrypter(AES(key, mode: AESMode.cbc, padding: 'PKCS7'));

      final encrypted = Encrypted(encryptedBytes);
      final decrypted = encrypter.decryptBytes(encrypted, iv: iv);
      return Uint8List.fromList(decrypted);
    } catch (e) {
      return null;
    }
  }
}
