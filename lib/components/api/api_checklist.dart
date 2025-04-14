import '../base/base_dio_datasource.dart';
import '../ext/dio_ext.dart';

mixin ApiChecklist on BaseDioDataSource {
  Future apiGetAllChecklist() {
    String path = '/checklist';
    return get(path).load();
  }

  Future apiCreatNewChecklist(data) {
    String path = '/checklist';
    return post(path, data: data).load();
  }

  Future<String> apiDeleteChecklistId({required int checklistId}) async {
    String path = '/checklist/$checklistId';
    return delete<String>(path).load();
  }
}
