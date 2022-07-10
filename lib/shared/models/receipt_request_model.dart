class ReceiptRequestModel {
  String? invoice;
  int? storageId;
  String? package;
  String? comments;
  String? temperature;
  String? moreInfo;
  List<ReceiptRequestModelItem>? items;
  String? lang;

  ReceiptRequestModel(
      {this.invoice,
      this.storageId,
      this.package,
      this.comments,
      this.temperature,
      this.moreInfo,
      this.items,
      this.lang});

  ReceiptRequestModel.fromJson(Map<String, dynamic> json) {
    invoice = json['invoice'];
    storageId = json['storage_id'];
    package = json['package'];
    comments = json['comments'];
    temperature = json['temperature'];
    moreInfo = json['more_info'];
    if (json['items'] != null) {
      items = <ReceiptRequestModelItem>[];
      json['items'].forEach((v) {
        items!.add(ReceiptRequestModelItem.fromJson(v));
      });
    }
    lang = json['lang'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['invoice'] = invoice;
    data['storage_id'] = storageId;
    data['package'] = package;
    data['comments'] = comments;
    data['temperature'] = temperature;
    data['more_info'] = moreInfo;
    if (items != null) {
      data['items'] = items!.map((v) => v.toJson()).toList();
    }
    data['lang'] = lang;
    return data;
  }
}

class ReceiptRequestModelItem {
  String? cProd;
  String? name;
  String? amount;

  ReceiptRequestModelItem({this.cProd, this.name, this.amount});

  ReceiptRequestModelItem.fromJson(Map<String, dynamic> json) {
    cProd = json['cProd'];
    name = json['xProd'];
    amount = json['qCom'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['cProd'] = cProd;
    data['name'] = name;
    data['amount'] = amount;
    return data;
  }
}
