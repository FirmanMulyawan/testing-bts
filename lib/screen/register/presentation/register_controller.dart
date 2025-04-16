import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:logger/logger.dart';

import '../../../components/api/api_service.dart';
import '../../../components/base/base_controller.dart';
import '../../../components/config/app_route.dart';
import '../../../components/config/app_style.dart';
import '../model/register_model.dart';

class RegisterController extends BaseController {
  final _logger = Logger();
  final ApiService _apiService;

  final userNameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final rePasswordController = TextEditingController();

  bool isHidePassword = true;
  bool isHideRePassword = true;

  RegisterController(this._apiService);

  @override
  void dispose() {
    userNameController.dispose();
    passwordController.dispose();
    emailController.dispose();
    rePasswordController.dispose();
    super.dispose();
  }

  void onRegister() async {
    if (userNameController.text.isEmpty) {
      showBaseDialog(title: "Register", message: "Nama tidak boleh kosong");
      return;
    }

    if (emailController.text.isEmpty) {
      showBaseDialog(title: "Register", message: "Email tidak boleh kosong");
      return;
    }

    if (passwordController.text.isEmpty && passwordController.text.isEmpty) {
      showBaseDialog(title: "Register", message: "Password tidak boleh kosong");
      return;
    }

    if (passwordController.text != rePasswordController.text) {
      showBaseDialog(title: "Register", message: "Password tidak sesuai");
      return;
    }

    if (passwordController.text.length < 6) {
      showBaseDialog(
          title: "Register", message: "Password tidak kurang dari 6");
      return;
    }

    final params = {
      "username": userNameController.text,
      "email": emailController.text,
      "password": passwordController.text
    };

    try {
      final response = await _apiService
          .apiRegister(params)
          .then((value) => RegisterResponseModel.fromJson(value));
      if (response.statusCode == 2000) {
        await showBaseDialog(
            title: "Registrasi", message: "${response.message}");
        Get.offAllNamed(AppRoute.loginScreen);
      } else {
        showBaseDialog(title: "Registrasi", message: "${response.message}");
      }
    } on DioException catch (e) {
      _logger.e(e, stackTrace: e.stackTrace);
      _logger.i(e.response?.data);
      String? message;
      try {
        message = e.response?.data["message"];
      } catch (e) {
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
  }

  void navigateToLogin() {
    Get.toNamed(AppRoute.defaultRoute);
  }

  void updateUIPassword() {
    isHidePassword = !isHidePassword;
    update();
  }

  void updateUIRePassword() {
    isHideRePassword = !isHideRePassword;
    update();
  }
}
