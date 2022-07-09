class SaidaResult {
  bool success = false;
  String? message;
  String? language;

  SaidaResult({this.success = false, this.message, this.language});

  SaidaResult.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    message = json['message'];
    language = json['language'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['success'] = success;
    data['message'] = message;
    data['language'] = language;
    return data;
  }
}
