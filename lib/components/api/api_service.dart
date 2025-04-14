import '../base/base_dio_datasource.dart';
import 'api_auth.dart';
import 'api_checklist.dart';

class ApiService extends BaseDioDataSource with ApiLogin, ApiChecklist {
  ApiService(super.client);
}
