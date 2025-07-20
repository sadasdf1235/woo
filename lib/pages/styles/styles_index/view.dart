import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '/common/index.dart';
import 'index.dart';

class StylesIndexPage extends GetView<StylesIndexController> {
  const StylesIndexPage({super.key});

  // 主视图
  Widget _buildView() {
    return Column(children: [
      ListTile(
        onTap: controller.onLanguageSelected,
        title: Text(
          "语言 : ${ConfigService.to.locale.toLanguageTag()}",
        ),
      ),
      ListTile(
        onTap: controller.onThemeSelected,
        title: Text("主题 : ${ConfigService.to.isDarkModel ? "Dark" : "Light"}"),
      ),
      // 文本
      ListTile(
        onTap: () => Get.toNamed(RouteNames.stylesText),
        title: const Text("Text 文本"),
      ),
      // form 表单
      ListTile(
        onTap: () => Get.toNamed(RouteNames.stylesTextForm),
        title: const Text("form 表单"),
      ),
      // ListTile 列表项
      ListTile(
        onTap: () => Get.toNamed(RouteNames.stylesListTile),
        title: const Text("ListTile 列表项"),
      ),
      // Checkbox 复选框
      ListTile(
        onTap: () => Get.toNamed(RouteNames.stylesCheckbox),
        title: const Text("Checkbox 复选框"),
      ),
    ]);
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<StylesIndexController>(
      init: StylesIndexController(),
      id: "styles_index",
      builder: (_) {
        return Scaffold(
          appBar: AppBar(title: Text(LocaleKeys.stylesTitle.tr)),
          body: SafeArea(
            child: _buildView(),
          ),
        );
      },
    );
  }
}
