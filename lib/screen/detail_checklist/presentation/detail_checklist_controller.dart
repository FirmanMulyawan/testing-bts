import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:logger/logger.dart';

import '../../../components/api/api_service.dart';
import '../../../components/api/models/request/add_checklist_item.request.dart';
import '../../../components/base/base_controller.dart';
import '../../../components/config/app_route.dart';
import '../../../components/config/app_style.dart';
import '../model/detail_checklist_model.dart';

class DetailChecklistController extends BaseController {
  final _logger = Logger();
  bool isInvisibleVisiblePassword = true;
  final ApiService _apiService;

  final itemNameController = TextEditingController();
  final argument = Get.arguments;
  int? checklistId;
  bool isLoadingData = false;
  final List<DataItem>? listChecklistItem = [];

  DetailChecklistController(this._apiService);

  @override
  void onInit() {
    if (argument != null) {
      checklistId = argument['checklistId'];
      apiGetAllChecklistItem(checklistId);
    }
    super.onInit();
  }

  Future<void> apiGetAllChecklistItem(int? checklistId) async {
    isLoadingData = true;
    update();
    try {
      final res = await _apiService
          .apiGetAllChecklistItem(checklistId: checklistId ?? 0)
          .then((value) {
        return GetChecklistItemResponse.fromJson(value);
      });
      listChecklistItem?.assignAll(res.data ?? []);
      update();
    } on DioException catch (e) {
      _logger.e(e, stackTrace: e.stackTrace);
      _logger.i(e.response?.data);
    }
    isLoadingData = false;
    update();
  }

  void toDetailItem() {
    Get.toNamed(AppRoute.detailItemScreen);
  }

  void toDeleteChecklist(int? id) {
    showBaseDialogDoubleButton(
        title: "Hapus Checklist",
        message: "Anda yakin ingin menghapus Checklist ini",
        titleLeftBtn: 'Cancel',
        titleRightBtn: 'Delete',
        onTapRightLoadingBtn: () async {
          await _apiService
              .apiDeleteChecklistItemById(
                  checklistId: checklistId ?? 0, checklistItemId: id ?? 0)
              .then((value) {
            Get.back();
            apiGetAllChecklistItem(checklistId);
          });
        });
  }

  void toEditChecklist(int? id) {
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
        onTapRightLoadingBtn: () async {
          if (itemNameController.text.isNotEmpty) {
            await _apiService
                .apiRenameChecklistItemById(
                    AddChecklistItemRequest(
                      itemName: itemNameController.text,
                    ),
                    checklistId: checklistId ?? 0,
                    checklistItemId: id ?? 0)
                .then((value) {
              Get.back();
              apiGetAllChecklistItem(checklistId);
            });
          } else {
            showBaseDialog(
                title: "Tambah Item", message: "Data tidak boleh kosong");
          }
        });
  }
}
