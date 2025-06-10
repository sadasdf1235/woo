import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:ducafe_ui_core/ducafe_ui_core.dart';

import 'index.dart';
import '/common/index.dart';

class SearchIndexPage extends GetView<SearchIndexController> {
  const SearchIndexPage({super.key});

  // 导航栏
  AppBar _buildAppBar() {
    return AppBar(
      titleSpacing: AppSpace.listItem,
      // 搜索栏
      title: InputWidget(
        controller: controller.searchEditController,
        placeholder: "You can try T-Shirt", //LocaleKeys.commonSearchInput.tr,
        prefix: const IconWidget.icon(Icons.search),
        onChanged: (val) {
          controller.searchDebounce();
        },
      ).paddingRight(AppSpace.page),
    );
  }

  // 主视图
  Widget _buildView() {
    return const Center(
      child: Text("SearchIndexPage"),
    );
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<SearchIndexController>(
      init: SearchIndexController(),
      id: "search_index",
      builder: (_) {
        return Scaffold(
          // 搜索栏
          appBar: _buildAppBar(),

          // 内容
          body: SafeArea(
            child: _buildView(),
          ),
        );
      },
    );
  }
}
