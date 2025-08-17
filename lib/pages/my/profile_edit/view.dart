import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:ducafe_ui_core/ducafe_ui_core.dart';
import 'package:wechat_assets_picker/wechat_assets_picker.dart';

import 'index.dart';
import '/common/index.dart';

class ProfileEditPage extends GetView<ProfileEditController> {
  const ProfileEditPage({super.key});

  // 头像
  Widget _buildAvatar(BuildContext context) {
    return ListTileWidget(
      title: TextWidget.label(LocaleKeys.profileEditMyPhoto.tr),
      trailing: [
        controller.userPhoto != null
            ? AssetEntityImage(
                controller.userPhoto!,
                width: 50.w,
                height: 50.w,
                fit: BoxFit.cover,
              ).clipOval()
            : ImageWidget.img(
                // UserService.to.profile.avatarUrl,
                "https://ducafecat-pub.oss-cn-qingdao.aliyuncs.com/avatar/00258VC3ly1gty0r05zh2j60ut0u0tce02.jpg",
                width: 50.w,
                height: 50.w,
                fit: BoxFit.cover,
                radius: 25.w,
              ),
      ],
      padding: EdgeInsets.all(AppSpace.card),
      onTap: controller.onSelectPhoto,
    )
        .card(
          color: context.colors.scheme.surface,
          margin: EdgeInsets.zero,
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.zero,
          ),
        )
        .paddingBottom(AppSpace.card);
  }

  //  profile 表单
  Widget _buildProfileForm(BuildContext context) {
    return const Text("profile 表单");
  }

  //  password 表单
  Widget _buildPasswordForm(BuildContext context) {
    return const Text("password 表单");
  }

  // 主视图
  Widget _buildView(BuildContext context) {
    return SingleChildScrollView(
      child: <Widget>[
        // 头像
        _buildAvatar(context),

        // 表单
        Form(
          key: controller.formKey, //设置globalKey，用于后面获取FormState
          autovalidateMode: AutovalidateMode.onUserInteraction,
          child: <Widget>[
            // profile 表单
            _buildProfileForm(context),
            // password 表单
            _buildPasswordForm(context),
          ].toColumn(),
        ).paddingBottom(AppSpace.card),

        // 保存按钮
        ButtonWidget.primary(
          LocaleKeys.commonBottomSave.tr,
        ).width(double.infinity),
      ].toColumn().paddingAll(AppSpace.card),
    );
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ProfileEditController>(
      init: ProfileEditController(),
      id: "profile_edit",
      builder: (_) {
        return Scaffold(
          appBar: mainAppBarWidget(titleString: LocaleKeys.profileEditTitle.tr),
          body: SafeArea(
            child: _buildView(context),
          ),
        );
      },
    );
  }
}
