import 'package:get/get.dart';

class AddressEditController extends GetxController {
  AddressEditController();

  _initData() {
    update(["address_edit"]);
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

  // @override
  // void onClose() {
  //   super.onClose();
  // }
}
