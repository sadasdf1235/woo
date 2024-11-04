import 'package:get/get.dart';

class AddressListController extends GetxController {
  AddressListController();

  _initData() {
    update(["address_list"]);
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
