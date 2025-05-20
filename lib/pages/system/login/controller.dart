import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '/common/index.dart';


class LoginController extends GetxController {
  LoginController();

  /// 用户名
  TextEditingController userNameController =
      TextEditingController(text: "ducafecat5");

  /// 密码
  TextEditingController passwordController =
      TextEditingController(text: "123456");

        /// 表单 key
  GlobalKey formKey = GlobalKey<FormState>();


  _initData() {
    update(["login"]);
  }

    /// Sign In 登入
  Future<void> onSignIn() async {
    if ((formKey.currentState as FormState).validate()) {
      try {
        Loading.show();

        Get.back(result: true);
      } finally {
        Loading.dismiss();
      }
    }
  }

  /// Sign Up 注册
  void onSignUp() {
    Get.offNamed(RouteNames.systemRegister);
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

    /// 释放
  @override
  void onClose() {
    super.onClose();
    userNameController.dispose();
    passwordController.dispose();
  }

}
