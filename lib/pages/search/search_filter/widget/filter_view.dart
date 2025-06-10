import 'package:flutter/material.dart';

import 'package:ducafe_ui_core/ducafe_ui_core.dart';
import 'package:get/get.dart';

import '../index.dart';
import '/common/index.dart';

class FilterView extends GetView<SearchFilterController> {
  const FilterView({super.key});

  // 顶部 关闭
  Widget _buildTopBar(BuildContext context) {
    return <Widget>[
      // 文字
      TextWidget.h4(LocaleKeys.searchFilter.tr),

      // 关闭按钮
      ButtonWidget.icon(
        IconWidget.icon(
          Icons.close,
          size: 15,
          color: context.colors.scheme.secondary,
        ),
        onTap: controller.onFilterCloseTap,
      )
    ]
        .toRow(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
        )
        .paddingBottom(AppSpace.listRow);
  }

  // 标题栏
  Widget _buildTitle(String title) {
    return TextWidget.label(
      title,
      weight: FontWeight.w600,
    ).paddingBottom(AppSpace.listRow);
  }

  // 价格选择区间
  Widget _buildPriceRange() {
    return GetBuilder<SearchFilterController>(
      id: "filter_price_range",
      builder: (_) {
        return PriceRangeWidget(
          max: 5000,
          min: 0,
          values: controller.priceRange,
          onDragging: controller.onPriceRangeDragging,
        ).paddingBottom(AppSpace.listRow * 2);
      },
    );
  }

  // 尺寸选择
  Widget _buildSizes(BuildContext context) {
    return GetBuilder<SearchFilterController>(
      id: "filter_sizes",
      builder: (_) {
        return TagsListWidget(
          onTap: controller.onSizeTap,
          itemList: controller.sizes,
          keys: controller.sizeKeys,
          bgSelectedColor: context.colors.scheme.secondary,
          textSelectedColor: context.colors.scheme.onPrimary,
          isCircular: true,
          size: 24,
          textSize: 9,
          textWeight: FontWeight.w400,
        ).paddingBottom(AppSpace.listRow * 2);
      },
    );
  }

  Widget _buildView(BuildContext context) {
    return <Widget>[
      // 顶部
      _buildTopBar(context),

      // 价格
      _buildTitle(LocaleKeys.searchFilterPrice.tr),
      _buildPriceRange(),

      // 尺寸
      _buildTitle(LocaleKeys.searchFilterSize.tr),
      _buildSizes(context),
    ]
        .toColumn(
          crossAxisAlignment: CrossAxisAlignment.start,
        )
        .paddingHorizontal(AppSpace.page);
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<SearchFilterController>(
      id: "filter_view",
      builder: (_) {
        return _buildView(context);
      },
    );
  }
}
