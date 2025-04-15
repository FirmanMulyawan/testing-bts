import 'package:get/get.dart';

import '../presentation/detail_item_controller.dart';

class DetailItemBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => DetailItemController(Get.find(), Get.find()));
  }
}
