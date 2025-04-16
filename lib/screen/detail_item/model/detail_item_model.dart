class GetChecklistItemByIdResponse {
  int? statusCode;
  String? message;
  String? errorMessage;
  DataItemDetail? data;

  GetChecklistItemByIdResponse(
      {this.statusCode, this.message, this.errorMessage, this.data});

  GetChecklistItemByIdResponse.fromJson(Map<String, dynamic> json) {
    statusCode = json['statusCode'];
    message = json['message'];
    errorMessage = json['errorMessage'];
    data = json['data'] != null ? DataItemDetail.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['statusCode'] = statusCode;
    data['message'] = message;
    data['errorMessage'] = errorMessage;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

class DataItemDetail {
  int? id;
  String? name;
  bool? itemCompletionStatus;

  DataItemDetail({this.id, this.name, this.itemCompletionStatus});

  DataItemDetail.fromJson(Map<String, dynamic> json) {
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
