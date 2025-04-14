import 'package:get/get.dart';

import '../presentation/login_controller.dart';

class LoginBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => LoginController(Get.find(), Get.find()));
  }
}
