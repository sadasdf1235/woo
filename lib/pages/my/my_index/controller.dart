import 'package:get/get.dart';

import '/common/index.dart';
import '/pages/index.dart';

class MyIndexController extends GetxController {
  MyIndexController();

  _initData() {
    update(["my_index"]);
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
  }

  // 注销
  void onLogout() {
    UserService.to.logout();
    Get.find<MainController>().onJumpToPage(0);
  }

  // 地址编辑页 type 1 billing 2 shipping
  void onToAddress(String type) {
    Get.toNamed(RouteNames.myAddress, arguments: {"type": type});
  }

  // 主题
  onThemeSelected() async {
    await ConfigService.to.switchThemeModel();
    update(["my_index"]);
  }

  // 多语言切换
  onLanguageSelected() {
    // 获取当前语言
    var currentLocale = ConfigService.to.locale;
    var en = Translation.supportedLocales[0]; // 英语
    var zh = Translation.supportedLocales[1]; // 中文
    
    // 切换语言：如果当前是中文则切换到英语，否则切换到中文
    var newLocale = currentLocale.languageCode == 'zh' ? en : zh;
    
    // 使用ConfigService的setLanguage方法来切换语言
    ConfigService.to.setLanguage(newLocale);
    update(["my_index"]);
  }

  // @override
  // void onClose() {
  //   super.onClose();
  // }
}
