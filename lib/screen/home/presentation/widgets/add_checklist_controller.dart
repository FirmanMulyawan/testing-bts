import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../components/base/base_controller.dart';

class AddChecklistController extends BaseController {
  final nameController = TextEditingController();

  AddChecklistController();

  @override
  void dispose() {
    nameController.dispose();
    super.dispose();
  }

  void addTodo() {
    Get.back(result: true);
  }

  void closeTodo() {
    nameController.clear();
    Get.back();
  }
}
