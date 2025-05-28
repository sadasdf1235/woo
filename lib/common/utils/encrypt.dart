import 'package:encrypt/encrypt.dart';

import '../index.dart';

/// 加密类
class EncryptUtil {
  static final EncryptUtil _instance = EncryptUtil._internal();
  factory EncryptUtil() => _instance;
  EncryptUtil._internal() {
    // 加密器
    encrypter = Encrypter(AES(
      key, // 密钥
      mode: AESMode.cbc, // 模式
      padding: 'PKCS7', // 填充模式
    ));
  }

  /// 密钥
  final key = Key.fromUtf8(Constants.aesKey);

  /// 偏移量
  final iv = IV.fromUtf8(Constants.aesIV);

  late Encrypter encrypter;

  /// aes加密
  String aesEncode(String content) {
    // 加密
    final encrypted = encrypter.encrypt(content, iv: iv);
    // 返回 base64 编码
    return encrypted.base64;
  }
}
