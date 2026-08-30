import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_open_chinese_convert/flutter_open_chinese_convert.dart';

abstract class IChineseConversionService {
  /// 檢查字串是否包含中文字符 (包含繁體與簡體)
  bool containsChinese(String text);

  /// 轉換為繁體中文
  Future<String> toTraditional(String text);

  /// 轉換為簡體中文
  Future<String> toSimplified(String text);
}

class ChineseConversionService implements IChineseConversionService {
  @override
  bool containsChinese(String text) {
    // 匹配基本漢字範圍
    return RegExp(r'[\u4e00-\u9fa5]').hasMatch(text);
  }

  @override
  Future<String> toTraditional(String text) async {
    if (!containsChinese(text)) return text;
    // s2t: 簡體到繁體
    return await ChineseConverter.convert(text, S2T());
  }

  @override
  Future<String> toSimplified(String text) async {
    if (!containsChinese(text)) return text;
    // t2s: 繁體到簡體
    return await ChineseConverter.convert(text, T2S());
  }
}

final chineseConversionServiceProvider = Provider<IChineseConversionService>((ref) {
  return ChineseConversionService();
});
