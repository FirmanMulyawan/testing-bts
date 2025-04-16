import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:logger/logger.dart';

import '../../../components/api/api_service.dart';
import '../../../components/base/base_controller.dart';
import '../model/detail_item_model.dart';

class DetailItemController extends BaseController {
  final _logger = Logger();

  final ApiService _apiService;
  final argument = Get.arguments;

  int? checklistId;
  int? checklistItemId;
  bool isLoadingData = false;
  DataItemDetail? dataItemDetail;

  DetailItemController(this._apiService);

  @override
  void onInit() {
    if (argument != null) {
      checklistId = argument['checklistId'];
      checklistItemId = argument['checklistItemId'];

      apiGetChecklistItemById(checklistId, checklistItemId);
    }
    super.onInit();
  }

  Future<void> apiGetChecklistItemById(
      int? checklistId, int? checklistItemId) async {
    isLoadingData = true;
    update();
    try {
      final res = await _apiService
          .apiGetChecklistItemById(
              checklistId: checklistId ?? 0,
              checklistItemId: checklistItemId ?? 0)
          .then((value) {
        return GetChecklistItemByIdResponse.fromJson(value);
      });
      dataItemDetail = res.data;
      update();
    } on DioException catch (e) {
      _logger.e(e, stackTrace: e.stackTrace);
      _logger.i(e.response?.data);
    }
    isLoadingData = false;
    update();
  }
}
