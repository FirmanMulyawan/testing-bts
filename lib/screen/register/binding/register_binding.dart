import 'package:get/get.dart';

import '../presentation/register_controller.dart';

class RegisterBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => RegisterController(Get.find()));
  }
}
