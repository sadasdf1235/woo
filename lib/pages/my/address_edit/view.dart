import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'index.dart';

class AddressEditPage extends GetView<AddressEditController> {
  const AddressEditPage({super.key});

  // 主视图
  Widget _buildView() {
    return const Center(
      child: Text("AddressEditPage"),
    );
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<AddressEditController>(
      init: AddressEditController(),
      id: "address_edit",
      builder: (_) {
        return Scaffold(
          appBar: AppBar(title: const Text("address_edit")),
          body: SafeArea(
            child: _buildView(),
          ),
        );
      },
    );
  }
}
