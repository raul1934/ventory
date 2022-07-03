class ArmazenamentoModel {
  int? id;
  int? companyId;
  String? companyDoc;
  String? label;
  String? description;
  String? temperature;
  String? sponsorCode;
  int? iLft;
  int? iRgt;
  int? parentId;
  String? createdAt;
  String? updatedAt;
  String? status;
  List<ArmazenamentoModel>? children;

  ArmazenamentoModel(
      {this.id,
      this.companyId,
      this.companyDoc,
      this.label,
      this.description,
      this.temperature,
      this.sponsorCode,
      this.iLft,
      this.iRgt,
      this.parentId,
      this.createdAt,
      this.updatedAt,
      this.status,
      this.children});

  ArmazenamentoModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    companyId = json['company_id'];
    companyDoc = json['company_doc'];
    label = json['label'];
    description = json['description'];
    temperature = json['temperature'];
    sponsorCode = json['sponsor_code'];
    iLft = json['_lft'];
    iRgt = json['_rgt'];
    parentId = json['parent_id'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    status = json['status'];
    if (json['children'] != null) {
      children = <ArmazenamentoModel>[];
      json['children'].forEach((v) {
        children!.add(ArmazenamentoModel.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['company_id'] = companyId;
    data['company_doc'] = companyDoc;
    data['label'] = label;
    data['description'] = description;
    data['temperature'] = temperature;
    data['sponsor_code'] = sponsorCode;
    data['_lft'] = iLft;
    data['_rgt'] = iRgt;
    data['parent_id'] = parentId;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    data['status'] = status;
    if (children != null) {
      data['children'] = children!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}
