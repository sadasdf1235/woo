import 'package:get/get.dart';

import '/common/index.dart';

class BuyNowController extends GetxController {
  BuyNowController({required this.product});

  // 商品详情
  final ProductModel product;

  // 送货地址
  String shippingAddress = "";

  // 支付方式图标
  List<String> paymentList = [
    AssetsImages.pVisaPng,
    AssetsImages.pCashPng,
    AssetsImages.pMastercardPng,
    AssetsImages.pPaypalPng,
  ];

  // 数量
  int quantity = 1;
  // 运费
  double get shipping => 0;
  // 折扣
  double get discount => 0;
  // 商品合计价格
  double get totalPrice => double.parse(product.price!) * quantity;

  // 初始
  _initData() {
    shippingAddress = UserService.to.shipping;

    update(["buy_now"]);
  }

  void onTap() {}

  // 修改数量
  void onQuantityChange(int value) {
    if (value <= 0) {
      value = 1;
    }
    quantity = value;
    update(["buy_now"]);
  }

  // 下单 checkout
  void onCheckout() async {}

  // @override
  // void onInit() {
  //   super.onInit();
  // }

  @override
  void onReady() {
    super.onReady();
    _initData();
  }

  // goto 送货地址修改
  Future<void> onShippingTap() async {
    var result = await Get.toNamed(RouteNames.myAddress,
        arguments: {"type": "Shipping"});
    if (result != null && result == true) {
      shippingAddress = UserService.to.shipping;
      update(["buy_now"]);
    }
  }

  // @override
  // void onClose() {
  //   super.onClose();
  // }
}
