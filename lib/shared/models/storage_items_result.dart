class StorageItemsResult {
  bool success = false;
  String? message;
  String? language;
  List<Items>? items;

  StorageItemsResult(
      {required this.success, this.message, this.language, this.items});

  StorageItemsResult.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    message = json['message'];
    language = json['language'];
    if (json['data'] != null) {
      items = <Items>[];
      json['data'].forEach((v) {
        items!.add(Items.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['success'] = success;
    data['message'] = message;
    data['language'] = language;
    if (items != null) {
      data['data'] = items!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Items {
  int? id;
  String? code;
  String? name;
  int? storageId;
  int? currentBalance;
  String? status;
  String? createdAt;

  Items({id, code, name, storageId, currentBalance, status, createdAt});

  Items.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    code = json['code'];
    name = json['name'];
    storageId = json['storage_id'];
    currentBalance = json['current_balance'];
    status = json['status'];
    createdAt = json['created_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = id;
    data['code'] = code;
    data['name'] = name;
    data['storage_id'] = storageId;
    data['current_balance'] = currentBalance;
    data['status'] = status;
    data['created_at'] = createdAt;
    return data;
  }
}
