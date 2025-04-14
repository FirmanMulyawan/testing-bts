import 'package:get/get.dart';

import '../presentation/detail_checklist_controller.dart';
import '../presentation/widgets/add_detail_checklist_controller.dart';

class DetailChecklistBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => DetailChecklistController(Get.find(), Get.find()));
    Get.lazyPut(() => AddDetailChecklistController());
  }
}
