import 'package:get/get.dart';

import '/common/index.dart';

class HomeController extends GetxController {
  HomeController();

    // Banner 当前位置
  int bannerCurrentIndex = 0;

    // Banner 数据
  List<KeyValueModel> bannerItems = [];

    // 分类导航数据
  List<CategoryModel> categoryItems = [];
  // 推荐商品列表数据
  List<ProductModel> flashShellProductList = [];
  // 最新商品列表数据
  List<ProductModel> newProductProductList = [];


   _initData() async {
    // 首页
    // banner
    bannerItems = await SystemApi.banners();

    // 分类
    categoryItems = await ProductApi.categories();
    // 推荐商品
    flashShellProductList =
        await ProductApi.products(ProductsReq(featured: true));
    // 新商品
    newProductProductList = await ProductApi.products(ProductsReq());

    update(["home"]);
  }

  void onTap() {}

    // Banner 切换事件
  void onChangeBanner(int index, /*CarouselPageChangedReason*/ reason) {
    bannerCurrentIndex = index;
    update(["home_banner"]);
  }


    // 导航点击事件
  void onAppBarTap() {}


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
