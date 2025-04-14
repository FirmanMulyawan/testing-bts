import 'package:get/get.dart';

import '../widgets/dialog_custom_widget.dart';

abstract class BaseController extends GetxController {
  showBaseDialog(
      {String title = "", dynamic message = "", void Function()? onTap}) {
    return Get.dialog(
      DialogCustomWidget(
        title: title,
        decs: message,
        titleLeftBtn: "",
        titleRightBtn: "Ok",
        onTapLeftBtn: () => Get.back(),
        onTapRightBtn: onTap ?? () => Get.back(),
      ),
    );
  }

  showBaseDialogDoubleButton(
      {String title = "",
      dynamic message = "",
      void Function()? onTapRightLoadingBtn,
      titleLeftBtn = "",
      titleRightBtn = "",
      childWidget}) {
    return Get.dialog(
      DialogCustomWidget(
        title: title,
        decs: message,
        titleLeftBtn: titleLeftBtn ?? "Cancel",
        titleRightBtn: titleRightBtn ?? "Ok",
        onTapLeftBtn: () => Get.back(),
        onTapRightLoadingBtn: onTapRightLoadingBtn ?? () => Get.back(),
        childWidget: childWidget,
      ),
    );
  }
}
