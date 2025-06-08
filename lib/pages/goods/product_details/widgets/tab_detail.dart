import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../index.dart';

/// 商品详情
class TabDetailView extends GetView<ProductDetailsController> {
  final String uniqueTag;

  const TabDetailView({super.key, required this.uniqueTag});

  @override
  String? get tag => uniqueTag;

  @override
  Widget build(BuildContext context) {
    return const Text("商品详情");
  }
}
