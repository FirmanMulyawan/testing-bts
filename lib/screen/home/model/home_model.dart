class GetAllChecklistResponseModel {
  int? statusCode;
  String? message;
  String? errorMessage;
  List<DataChecklist>? data;

  GetAllChecklistResponseModel(
      {this.statusCode, this.message, this.errorMessage, this.data});

  GetAllChecklistResponseModel.fromJson(Map<String, dynamic> json) {
    statusCode = json['statusCode'];
    message = json['message'];
    errorMessage = json['errorMessage'];
    if (json['data'] != null) {
      data = <DataChecklist>[];
      json['data'].forEach((v) {
        data!.add(DataChecklist.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['statusCode'] = statusCode;
    data['message'] = message;
    data['errorMessage'] = errorMessage;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class DataChecklist {
  int? id;
  String? name;
  List<Items>? items;
  bool? checklistCompletionStatus;

  DataChecklist(
      {this.id, this.name, this.items, this.checklistCompletionStatus});

  DataChecklist.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    if (json['items'] != null) {
      items = <Items>[];
      json['items'].forEach((v) {
        items!.add(Items.fromJson(v));
      });
    }
    checklistCompletionStatus = json['checklistCompletionStatus'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    if (items != null) {
      data['items'] = items!.map((v) => v.toJson()).toList();
    }
    data['checklistCompletionStatus'] = checklistCompletionStatus;
    return data;
  }
}

class Items {
  int? id;
  String? name;
  bool? itemCompletionStatus;

  Items({this.id, this.name, this.itemCompletionStatus});

  Items.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    itemCompletionStatus = json['itemCompletionStatus'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['itemCompletionStatus'] = itemCompletionStatus;
    return data;
  }
}
