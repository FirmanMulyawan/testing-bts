import '../../../components/api/api_service.dart';
import '../../../components/base/base_controller.dart';
import '../../../components/util/storage_util.dart';

class DetailItemController extends BaseController {
  bool isInvisibleVisiblePassword = true;
  final ApiService _apiService;
  final StorageUtil _storage;

  DetailItemController(this._apiService, this._storage);

  // @override
  // void dispose() {
  //   super.dispose();
  // }
}
