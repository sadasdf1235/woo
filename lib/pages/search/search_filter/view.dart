import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:ducafe_ui_core/ducafe_ui_core.dart';

import 'index.dart';
import '/common/index.dart';

class SearchFilterPage extends GetView<SearchFilterController> {
  const SearchFilterPage({super.key});

  // 搜索过滤栏
  Widget _buildFilterBar() {
    return Text("搜索过滤栏");
  }

  // 数据列表
  Widget _buildListView() {
    return Text("数据列表");
  }

  // 主视图
  Widget _buildView() {
    return <Widget>[
      // 筛选栏
      _buildFilterBar(),
      // 数据列表
      _buildListView(),
    ].toColumn();
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<SearchFilterController>(
      init: SearchFilterController(),
      id: "search_filter",
      builder: (_) {
        return Scaffold(
          // 导航
          appBar: mainAppBarWidget(
            // 返回按钮
            leading: ButtonWidget.icon(
              IconWidget.icon(
                Icons.arrow_back,
                color: context.colors.scheme.primary,
              ),
              onTap: () => Get.back(),
            ),
            // 输入文字
            hintText: LocaleKeys.searchPlaceholder.tr,
            // 点击事件
            onTap: () => Get.back(),
          ),

          // 内容
          body: _buildView(),
        );
      },
    );
  }
}
