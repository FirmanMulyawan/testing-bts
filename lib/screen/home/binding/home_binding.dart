import 'package:get/get.dart';

import '../presentation/home_controller.dart';
import '../presentation/widgets/add_checklist_controller.dart';

class HomeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => HomeController(Get.find(), Get.find()));
    Get.lazyPut(() => AddChecklistController(
          Get.find(),
        ));
  }
}
