class AddChecklistItemRequest {
  String? itemName;

  AddChecklistItemRequest({this.itemName});

  AddChecklistItemRequest.fromJson(Map<String, dynamic> json) {
    itemName = json['itemName'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['itemName'] = itemName;
    return data;
  }
}
