import 'package:flutter/material.dart';
import 'dart:convert';

import 'package:get/get.dart';

import '/common/index.dart';

class SearchFilterController extends GetxController {
  SearchFilterController();

  // 排序列表
  List<KeyValueModel> orderList = [
    KeyValueModel(key: "rating", value: "Best Match"),
    KeyValueModel(key: "price_low", value: "Price (low to high)"),
    KeyValueModel(key: "price_high", value: "Price (high to low)"),
    KeyValueModel(key: "popularity", value: "Popularity"),
    KeyValueModel(key: "date", value: "New publish"),
    KeyValueModel(key: "title", value: "Product name"),
    KeyValueModel(key: "slug", value: "Slug name"),
  ];

  // 排序选中
  KeyValueModel orderSelected =
      KeyValueModel(key: "rating", value: "Best Match");

  // 全局 key
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

  // 价格范围 0~1000
  final List<double> priceRange = [100, 1000];

  // 尺寸列表
  List<KeyValueModel<AttributeModel>> sizes = [];

  // 选中尺寸列表
  List<String> sizeKeys = [];

  // 颜色列表
  List<KeyValueModel<AttributeModel>> colors = [];

  // 选中颜色列表
  List<String> colorKeys = [];

  _initData() {
    update(["search_filter"]);
  }

  void onTap() {}

  // 排序选中
  void onOrderTap(KeyValueModel? val) {
    orderSelected = val!;
    update(["search_filter"]);
  }

  // 筛选 打开
  void onFilterOpenTap() {
    scaffoldKey.currentState?.openEndDrawer();
  }

  // 筛选 关闭
  void onFilterCloseTap() {
    Get.back();
  }

  // 价格区间拖动
  onPriceRangeDragging(
    int handlerIndex,
    dynamic lowerValue,
    dynamic upperValue,
  ) {
    priceRange[0] = lowerValue as double;
    priceRange[1] = upperValue as double;
    update(["filter_price_range"]);
  }

  // 读取缓存
  void _loadCache() async {
    // 尺寸列表
    {
      String result =
          Storage().getString(Constants.storageProductsAttributesSizes);
      sizes = jsonDecode(result).map<KeyValueModel<AttributeModel>>((item) {
        var arrt = AttributeModel.fromJson(item);
        return KeyValueModel(key: "${arrt.name}", value: arrt);
      }).toList();
    }

    // 颜色列表
    {
      String result =
          Storage().getString(Constants.storageProductsAttributesColors);
      colors = jsonDecode(result).map<KeyValueModel<AttributeModel>>((item) {
        var arrt = AttributeModel.fromJson(item);
        return KeyValueModel(key: "${arrt.name}", value: arrt);
      }).toList();
    }
  }

  // 尺寸选中
  void onSizeTap(List<String> keys) {
    sizeKeys = keys;
    update(["filter_sizes"]);
  }

  // 颜色选中
  void onColorTap(List<String> keys) {
    colorKeys = keys;
    update(["filter_colors"]);
  }

  @override
  void onInit() {
    super.onInit();
    _loadCache();
  }

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
