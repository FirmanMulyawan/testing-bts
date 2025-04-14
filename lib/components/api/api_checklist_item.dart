import '../base/base_dio_datasource.dart';
import '../ext/dio_ext.dart';
import 'models/request/add_checklist_item.request.dart';

mixin ApiChecklistItem on BaseDioDataSource {
  Future apiGetAllChecklistItem({required int checklistId}) {
    String path = '/checklist/$checklistId/item';
    return get(path).load();
  }

  Future<String> apiCreateChecklistItem(AddChecklistItemRequest dataRequest,
      {required int checklistId}) async {
    String path = '/checklist/$checklistId/item';
    return post<String>(path, data: dataRequest.toJson()).load();
  }

  // ==== checklist item by id
  Future apiGetChecklistItemById(
      {required int checklistId, required int checklistItemId}) {
    String path = '/checklist/$checklistId/item/$checklistItemId';
    return get(path).load();
  }

  // Future apiEditChecklistItemById(
  //     {required int checklistId, required int checklistItemId}) {
  //   String path = '/checklist/$checklistId/item/$checklistItemId';
  //   return put(path).load();
  // }

  Future apiDeleteChecklistItemById(
      {required int checklistId, required int checklistItemId}) {
    String path = '/checklist/$checklistId/item/$checklistItemId';
    return delete<String>(path).load();
  }

  Future apiRenameChecklistItemById(AddChecklistItemRequest dataRequest,
      {required int checklistId, required int checklistItemId}) {
    String path = '/checklist/$checklistId/item/rename/$checklistItemId';
    return put<String>(path, data: dataRequest.toJson()).load();
  }
}
