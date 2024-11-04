import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'index.dart';

class AddressListPage extends GetView<AddressListController> {
  const AddressListPage({super.key});

  // 主视图
  Widget _buildView() {
    return const Center(
      child: Text("AddressListPage"),
    );
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<AddressListController>(
      init: AddressListController(),
      id: "address_list",
      builder: (_) {
        return Scaffold(
          appBar: AppBar(title: const Text("address_list")),
          body: SafeArea(
            child: _buildView(),
          ),
        );
      },
    );
  }
}
