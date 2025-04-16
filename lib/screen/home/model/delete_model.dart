class DeleteResponseModel {
  int? statusCode;
  String? message;
  String? errorMessage;
  String? data;

  DeleteResponseModel(
      {this.statusCode, this.message, this.errorMessage, this.data});

  DeleteResponseModel.fromJson(Map<String, dynamic> json) {
    statusCode = json['statusCode'];
    message = json['message'];
    errorMessage = json['errorMessage'];
    data = json['data'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['statusCode'] = statusCode;
    data['message'] = message;
    data['errorMessage'] = errorMessage;
    data['data'] = this.data;
    return data;
  }
}
