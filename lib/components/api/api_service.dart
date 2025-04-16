import '../base/base_dio_datasource.dart';
import 'api_auth.dart';
import 'api_checklist.dart';
import 'api_checklist_item.dart';

class ApiService extends BaseDioDataSource
    with ApiLogin, ApiChecklist, ApiChecklistItem {
  ApiService(super.client);
}
