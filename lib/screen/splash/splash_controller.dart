import 'package:get/get.dart';
import 'package:logger/logger.dart';
import '../../../components/util/storage_util.dart';
import '../../components/config/app_route.dart';

class SplashController extends GetxController {
  final _logger = Logger();
  final StorageUtil _storage = Get.find();
  bool isLoading = true;

  @override
  void onInit() {
    _checkLogin();
    super.onInit();
  }

  void navigationToLogin() {
    Get.toNamed(AppRoute.loginScreen);
  }

  void navigationToRegister() {
    Get.toNamed(AppRoute.registerScreen);
  }

  Future<void> _checkLogin() async {
    try {
      if (await _storage.hasLogin() == true) {
        await Get.offAllNamed(AppRoute.homeScreen);
      }
    } catch (e, trace) {
      _logger.e(e, stackTrace: trace);
    }
    isLoading = false;
    update();
  }
}
