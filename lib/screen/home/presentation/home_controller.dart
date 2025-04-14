import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:logger/logger.dart';

import '../../../components/api/api_service.dart';
import '../../../components/base/base_controller.dart';
import '../../../components/config/app_route.dart';
import '../../../components/config/app_style.dart';
import '../../../components/util/storage_util.dart';

class HomeController extends BaseController {
  final _logger = Logger();
  final usernameController = TextEditingController();
  final passwordController = TextEditingController();
  bool isInvisibleVisiblePassword = true;
  final ApiService _apiService;
  final StorageUtil _storage;

  HomeController(this._apiService, this._storage);

  @override
  void dispose() {
    usernameController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  void updateUIPassword() {
    isInvisibleVisiblePassword = !isInvisibleVisiblePassword;
    update();
  }

  void navigateToForgotPassword() {
    _logger.i("Navigate to forgot password");
  }

  void navigateToRegister() {
    Get.toNamed(AppRoute.registerScreen);
  }

  Future<void> onLogin() async {
    if (usernameController.text.isNotEmpty &&
        passwordController.text.isNotEmpty) {
      final params = {
        "username": usernameController.text,
        "password": passwordController.text
      };
      try {
        // Get.offAllNamed(AppRoute.homeScreen);

        // final response = await _apiService
        //     .apiLogin(params)
        //     .then((value) => LoginModel.fromJson(value));
        // if (response.data != null) {
        //   final data = response.data;
        //   await _storage.setLogin(true.toString());
        //   await _storage.setToken(data.token!);
        //   Get.offAllNamed(AppRoute.homeScreen);
        // } else {
        //   showBaseDialog(
        //       title: "Login Gagal",
        //       message: response.message ?? "Pastikan Email dan Password Benar");
        // }
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
          title: "Login Gagal", message: "Pastikan Semua Data Terisi");
    }
  }
}
