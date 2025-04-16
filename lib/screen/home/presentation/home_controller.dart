import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:logger/logger.dart';

import '../../../components/api/api_service.dart';
import '../../../components/base/base_controller.dart';
import '../../../components/config/app_route.dart';
import '../../../components/util/storage_util.dart';
import '../model/home_model.dart';

class HomeController extends BaseController {
  final _logger = Logger();
  final ApiService _apiService;
  final StorageUtil _storage;

  final List<DataChecklist>? listChecklist = [];
  bool isLoadingData = false;

  HomeController(this._apiService, this._storage);

  // @override
  // void dispose() {
  //   super.dispose();
  // }

  @override
  void onInit() {
    getAllChecklist();
    super.onInit();
  }

  Future<void> getAllChecklist() async {
    isLoadingData = true;
    update();
    try {
      final res = await _apiService.apiGetAllChecklist().then((value) {
        return GetAllChecklistResponseModel.fromJson(value);
      });
      listChecklist?.assignAll(res.data ?? []);
      update();
    } on DioException catch (e) {
      _logger.e(e, stackTrace: e.stackTrace);
      _logger.i(e.response?.data);
    }
    isLoadingData = false;
    update();
  }

  void toDetailChecklist(int? checklistId) {
    var dataArg = {
      "checklistId": checklistId,
    };

    Get.toNamed(AppRoute.detailChecklistScreen, arguments: dataArg);
  }

  void onLogoutClick() {
    _storage.logout();
    Get.offNamedUntil(AppRoute.defaultRoute, (route) => false);
  }

  Future<void> toDeleteChecklist(int? id) async {
    showBaseDialogDoubleButton(
        title: "Hapus Todo",
        message: "Anda yakin ingin menghapus todo ini",
        titleLeftBtn: 'Cancel',
        titleRightBtn: 'Delete',
        onTapRightLoadingBtn: () async {
          await _apiService
              .apiDeleteChecklistId(checklistId: id ?? 0)
              .then((value) {
            Get.back();
            getAllChecklist();
          });
        });
  }
}
