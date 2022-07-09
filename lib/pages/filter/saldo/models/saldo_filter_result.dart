class SaldoFilterResult {
  bool success = false;
  String? message;
  String? language;
  List<Items>? items;

  SaldoFilterResult(
      {required this.success, this.message, this.language, this.items});

  SaldoFilterResult.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    message = json['message'];
    language = json['language'];
    items = <Items>[];
    if (json['data'] != null) {
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
  String? storage;
  int? balance;

  Items({this.id, this.code, this.name, this.storage, this.balance});

  Items.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    code = json['code'];
    name = json['name'];
    storage = json['storage'];
    balance = json['balance'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['code'] = code;
    data['name'] = name;
    data['storage'] = storage;
    data['balance'] = balance;
    return data;
  }
}
