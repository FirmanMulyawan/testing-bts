import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../components/api/api_service.dart';
import '../../../components/base/base_controller.dart';
import '../../../components/config/app_route.dart';
import '../../../components/config/app_style.dart';
import '../../../components/util/storage_util.dart';

class DetailChecklistController extends BaseController {
  bool isInvisibleVisiblePassword = true;
  final ApiService _apiService;
  final StorageUtil _storage;

  final itemNameController = TextEditingController();

  DetailChecklistController(this._apiService, this._storage);

  // @override
  // void dispose() {
  //   super.dispose();
  // }

  void toDetailItem() {
    Get.toNamed(AppRoute.detailItemScreen);
  }

  void toDeleteChecklist() {
    showBaseDialogDoubleButton(
        title: "Hapus Checklist",
        message: "Anda yakin ingin menghapus Checklist ini",
        titleLeftBtn: 'Cancel',
        titleRightBtn: 'Delete',
        onTapRightLoadingBtn: () {});
  }

  void toEditChecklist() {
    showBaseDialogDoubleButton(
        title: "Edit Checklist",
        titleLeftBtn: 'Cancel',
        titleRightBtn: 'Ok',
        childWidget: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Item Name',
              style:
                  AppStyle.styleBold(size: 14, textColor: AppStyle.blackPure),
            ),
            const SizedBox(height: 4),
            TextField(
              controller: itemNameController,
              style: AppStyle.styleRegular(),
              decoration: AppStyle.textInputDecorator(
                hint: "Item Name",
              ),
            )
          ],
        ),
        onTapRightLoadingBtn: () {});
  }
}
