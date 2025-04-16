import 'package:get/get.dart';

import '../../../components/api/api_service.dart';
import '../../../components/base/base_controller.dart';
import '../../../components/config/app_route.dart';
import '../../../components/util/storage_util.dart';

class HomeController extends BaseController {
  final ApiService _apiService;
  final StorageUtil _storage;

  HomeController(this._apiService, this._storage);

  // @override
  // void dispose() {
  //   super.dispose();
  // }

  // @override
  // void onInit() {
  //   super.onInit();
  // }

  void toDetailChecklist() {
    Get.toNamed(AppRoute.detailChecklistScreen);
  }

  void onLogoutClick() {
    _storage.logout();
    Get.offNamedUntil(AppRoute.defaultRoute, (route) => false);
  }

  void toDeleteChecklist() {
    showBaseDialogDoubleButton(
        title: "Hapus Todo",
        message: "Anda yakin ingin menghapus todo ini",
        titleLeftBtn: 'Cancel',
        titleRightBtn: 'Delete',
        onTapRightLoadingBtn: () async {});
  }
}
