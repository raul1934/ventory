class MovimentationFilterResult {
  bool success = false;
  String? message;
  String? language;
  List<Items>? items;

  MovimentationFilterResult(
      {required this.success, this.message, this.language, this.items});

  MovimentationFilterResult.fromJson(Map<String, dynamic> json) {
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
  String? patientCode;
  String? storage;
  int? previousBalance;
  String? type;
  int? currentBalance;
  int? amount;
  String? createdAt;
  bool? negative;

  Items(
      {this.id,
      this.code,
      this.name,
      this.patientCode,
      this.storage,
      this.previousBalance,
      this.type,
      this.currentBalance,
      this.amount,
      this.createdAt,
      this.negative});

  Items.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    code = json['code'];
    name = json['name'];
    patientCode = json['patient_code'];
    storage = json['storage'];
    previousBalance = json['previous_balance'];
    type = json['type'];
    currentBalance = json['current_balance'];
    amount = json['amount'];
    createdAt = json['created_at'];

    negative = (previousBalance! > currentBalance!);
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['code'] = code;
    data['name'] = name;
    data['patient_code'] = patientCode;
    data['storage'] = storage;
    data['previous_balance'] = previousBalance;
    data['type'] = type;
    data['current_balance'] = currentBalance;
    data['amount'] = amount;
    data['created_at'] = createdAt;
    return data;
  }
}
