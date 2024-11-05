import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'common/index.dart';

class Global {
  static Future<void> init() async {
    /// 先就行原生端（ios android）插件注册，然后再处理后续操作，这样能保证代码运行正确。
    WidgetsFlutterBinding.ensureInitialized();

    await Future.wait([
      Get.putAsync<ConfigService>(() async => await ConfigService().init()),
    ]).whenComplete(() {});
  }
}
