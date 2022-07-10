class ReceiptResponseModel {
  bool success = false;
  String? message;
  String? language;
  Receipt? receipt;

  ReceiptResponseModel(
      {this.success = false, this.message, this.language, this.receipt});

  ReceiptResponseModel.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    message = json['message'];
    language = json['language'];
    receipt =
        json['receipt'] != null ? Receipt.fromJson(json['receipt']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['success'] = success;
    data['message'] = message;
    data['language'] = language;
    if (receipt != null) {
      data['receipt'] = receipt!.toJson();
    }
    return data;
  }
}

class Receipt {
  String? comments;
  String? moreInfo;
  String? latitude;
  String? longitude;
  String? status;
  int? storageId;
  String? invoice;
  String? temperature;
  String? package;
  String? updatedAt;
  String? createdAt;
  int? id;

  Receipt(
      {this.comments,
      this.moreInfo,
      this.latitude,
      this.longitude,
      this.status,
      this.storageId,
      this.invoice,
      this.temperature,
      this.package,
      this.updatedAt,
      this.createdAt,
      this.id});

  Receipt.fromJson(Map<String, dynamic> json) {
    comments = json['comments'];
    moreInfo = json['more_info'];
    latitude = json['latitude'];
    longitude = json['longitude'];
    status = json['status'];
    storageId = json['storage_id'];
    invoice = json['invoice'];
    temperature = json['temperature'];
    package = json['package'];
    updatedAt = json['updated_at'];
    createdAt = json['created_at'];
    id = json['id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['comments'] = comments;
    data['more_info'] = moreInfo;
    data['latitude'] = latitude;
    data['longitude'] = longitude;
    data['status'] = status;
    data['storage_id'] = storageId;
    data['invoice'] = invoice;
    data['temperature'] = temperature;
    data['package'] = package;
    data['updated_at'] = updatedAt;
    data['created_at'] = createdAt;
    data['id'] = id;
    return data;
  }
}
