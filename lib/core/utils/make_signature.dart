import 'package:web_reserve_ac_mobileapp/core/constants/setting.dart';
import 'package:crypto/crypto.dart';
import 'dart:convert';

class MakeSignature {
  static String generate(Map<String, dynamic> params) {
    final sortedKeys = params.keys.toList()..sort();
    final buffer = StringBuffer();
    // keyとvalueを連結
    for (final key in sortedKeys) {
      buffer.write(key);
      buffer.write(params[key]);
    }
    // 秘密鍵を連結
    buffer.write(AppSetting.secretKey);
    // MD5でハッシュ化
    return md5.convert(utf8.encode(buffer.toString())).toString();
  }
}
