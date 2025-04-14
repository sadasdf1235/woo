import 'package:get/get.dart';

import '/common/index.dart';

class MainController extends GetxController {
  MainController();

  _initData() {
    update(["main"]);
  }

  void onTap() {}

  // @override
  // void onInit() {
  //   super.onInit();
  // }

  @override
  void onReady() {
    super.onReady();
    _initData();

    // 跳转注册页
    Get.toNamed(RouteNames.systemRegister);
  }


  // @override
  // void onClose() {
  //   super.onClose();
  // }
}
