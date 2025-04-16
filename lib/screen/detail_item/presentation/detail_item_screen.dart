import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../components/base/base_view.dart';
import '../../../components/widgets/app_bar_widget.dart';
import 'detail_item_controller.dart';

class DetailItemScreen extends BaseView<DetailItemController> {
  const DetailItemScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: const BaseAppBar(
        title: 'Detail Item',
      ),
      body: SafeArea(
        child: GetBuilder<DetailItemController>(builder: (ctrl) {
          if (ctrl.isLoadingData == true) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }

          if (ctrl.dataItemDetail == null) {
            return const Text("data kosong");
          }

          final item = ctrl.dataItemDetail;

          return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 14),
              child: Card(
                color: item?.itemCompletionStatus == true
                    ? Colors.white
                    : Colors.amber,
                margin: const EdgeInsets.all(4),
                child: ListTile(
                  contentPadding: const EdgeInsets.symmetric(horizontal: 15),
                  title: Text(item?.name ?? ''),
                ),
              ));
        }),
      ),
    );
  }
}
