import 'package:get/get.dart';

import '/pages/index.dart';

/// 主界面依赖
class MainBinding implements Bindings {
  void dependencies() {
    Get.lazyPut<HomeController>(() => HomeController());
    Get.lazyPut<CartIndexController>(() => CartIndexController());
    Get.lazyPut<MsgIndexController>(() => MsgIndexController());
    Get.lazyPut<MyIndexController>(() => MyIndexController());
    Get.lazyPut<MainController>(() => MainController());
  }
}
