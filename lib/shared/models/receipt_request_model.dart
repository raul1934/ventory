class ReceiptRequestModel {
  String? invoice;
  int? storageId;
  String? package;
  String? comments;
  String? temperature;
  String? moreInfo;
  List<Items>? items;
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
      items = <Items>[];
      json['items'].forEach((v) {
        items!.add(new Items.fromJson(v));
      });
    }
    lang = json['lang'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['invoice'] = this.invoice;
    data['storage_id'] = this.storageId;
    data['package'] = this.package;
    data['comments'] = this.comments;
    data['temperature'] = this.temperature;
    data['more_info'] = this.moreInfo;
    if (this.items != null) {
      data['items'] = this.items!.map((v) => v.toJson()).toList();
    }
    data['lang'] = this.lang;
    return data;
  }
}

class Items {
  String? cProd;
  String? name;
  String? amount;

  Items({this.cProd, this.name, this.amount});

  Items.fromJson(Map<String, dynamic> json) {
    cProd = json['cProd'];
    name = json['name'];
    amount = json['amount'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['cProd'] = this.cProd;
    data['name'] = this.name;
    data['amount'] = this.amount;
    return data;
  }
}
