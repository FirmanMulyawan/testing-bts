import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:logger/logger.dart';

import '../../../../components/api/api_service.dart';
import '../../../../components/api/models/request/add_checklist_item.request.dart';
import '../../../../components/base/base_controller.dart';
import '../../../../components/config/app_style.dart';
import '../detail_checklist_controller.dart';

class AddDetailChecklistController extends BaseController {
  final _logger = Logger();

  final nameController = TextEditingController();
  final DetailChecklistController detailChecklistController =
      Get.find<DetailChecklistController>();

  final ApiService _apiService;

  AddDetailChecklistController(
    this._apiService,
  );

  @override
  void dispose() {
    nameController.dispose();
    super.dispose();
  }

  Future<void> addTodo() async {
    if (nameController.text.isNotEmpty) {
      try {
        await _apiService
            .apiCreateChecklistItem(
                AddChecklistItemRequest(itemName: nameController.text),
                checklistId: detailChecklistController.checklistId ?? 0)
            .then((value) => {Get.back(result: true)});
      } on DioException catch (e) {
        _logger.e(e, stackTrace: e.stackTrace);
        _logger.i(e.response?.data);
        String? message;
        try {
          message = e.response?.data["message"];
        } catch (e) {
          _logger.e(e);
          message = null;
        }
        Get.snackbar("", "No",
            messageText: Text(
              message ?? "Unknown Error",
              style: AppStyle.styleRegular(size: 14, textColor: Colors.white),
            ),
            margin: EdgeInsets.zero,
            snackPosition: SnackPosition.TOP,
            snackStyle: SnackStyle.GROUNDED,
            backgroundColor: Colors.red);
      }
    } else {
      showBaseDialog(
          title: "Tambah Data Gagal", message: "Pastikan Semua Data Terisi");
    }
  }

  void closeTodo() {
    nameController.clear();
    Get.back();
  }
}
