import 'package:get/get.dart';

import '/common/index.dart';

class SplashController extends GetxController {
  SplashController();

  /// 跳转页面
  _jumpToPage() {
    // 延迟1秒
    Future.delayed(const Duration(seconds: 1)).then((_) {
      // 是否已打开
      if (ConfigService.to.isAlreadyOpen) {
        // 跳转首页
        Get.offAllNamed(RouteNames.systemMain);
      } else {
        // 跳转欢迎页
        Get.offAllNamed(RouteNames.systemWelcome);
      }
    });
  }



  _initData() {
    update(["splash"]);
  }

  void onTap() {}

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
    _initData(); // 初始数据
    _jumpToPage(); // 跳转界面
  }


  @override
  void onClose() {
    super.onClose();
  }
}
