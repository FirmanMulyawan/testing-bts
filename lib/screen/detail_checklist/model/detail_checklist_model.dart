class GetChecklistItemResponse {
  int? statusCode;
  String? message;
  String? errorMessage;
  List<DataItem>? data;

  GetChecklistItemResponse(
      {this.statusCode, this.message, this.errorMessage, this.data});

  GetChecklistItemResponse.fromJson(Map<String, dynamic> json) {
    statusCode = json['statusCode'];
    message = json['message'];
    errorMessage = json['errorMessage'];
    if (json['data'] != null) {
      data = <DataItem>[];
      json['data'].forEach((v) {
        data!.add(DataItem.fromJson(v));
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

class DataItem {
  int? id;
  String? name;
  bool? itemCompletionStatus;

  DataItem({this.id, this.name, this.itemCompletionStatus});

  DataItem.fromJson(Map<String, dynamic> json) {
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
