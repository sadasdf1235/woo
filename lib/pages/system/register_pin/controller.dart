import 'package:get/get.dart';
import 'package:flutter/material.dart';

import '/common/index.dart';

class RegisterPinController extends GetxController {
  RegisterPinController();

    // ping 文字输入控制器
  TextEditingController pinController = TextEditingController();

    // 表单 key
  GlobalKey formKey = GlobalKey<FormState>();

    // 这里默认一个 pin 值，生产环境在服务端验证
  String pinCheckValue = '111111';

    // 注册界面传值
    UserRegisterReq? req = Get.arguments;



  // pin 触发提交
  void onPinSubmit(String val) {
    debugPrint("onPinSubmit: $val");
    _register();
  }

  // 按钮提交
  void onBtnSubmit() {
    _register();
  }


  // 按钮返回
  void onBtnBackup() {
    Get.back();
  }

    // 验证 pin
  String? pinValidator(val) {
    return val == pinCheckValue
        ? null
        : LocaleKeys.commonMessageIncorrect.trParams({"method": "Pin"});
  }

    // 注册
  Future<void> _register() async {
    try {
      Loading.show();

      // 检查 Pin
      if (pinController.text.isEmpty || pinController.text != pinCheckValue) {
        return Loading.error(
            LocaleKeys.commonMessageIncorrect.trParams({"method": "Pin"}));
      }

      // // 注册提交
      // bool isOk = await UserApi.register(req);
      // if (isOk) {
      //   Loading.success(
      //       LocaleKeys.commonMessageSuccess.trParams({"method": "Register"}));
      //   Get.back(result: true);
      // }

      // 提示成功
      Loading.success(
          LocaleKeys.commonMessageSuccess.trParams({"method": "Register"}));

      Get.back(result: true);
    } finally {
      Loading.dismiss();
    }
  }


  _initData() {
    update(["register_pin"]);
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

  @override
  void onClose() {
    super.onClose();
    pinController.dispose();
  }

}
