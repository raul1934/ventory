import 'dart:convert';
import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart' as http;

class NetService {
  static Future get(String url) {
    var storage = GetStorage();
    var token = storage.read("token");
    var headers = <String, String>{};
    if (token != null) {
      headers.addAll({
        "Authorization": "Bearer $token",
        "content-type": "application/json"
      });
    }

    Uri uri = Uri.parse(url);
    return http
        .get(uri, headers: headers)
        .then((response) => jsonDecode(response.body))
        .catchError((err) => {
              "success": false,
              "message":
                  "Houve um problema ao processar a requisição, provavelmente você está sem internet. Caso o problema continue entre em contato com o suporte."
            });
  }

  static Future post(String url, dynamic data) {
    var storage = GetStorage();
    var token = storage.read("token");
    var headers = <String, String>{};
    if (token != null) {
      headers.addAll({
        "Authorization": "Bearer $token",
        "content-type": "application/json"
      });
    }

    Uri uri = Uri.parse(url);
    return http
        .post(uri, body: jsonEncode(data), headers: headers)
        .then((response) => jsonDecode(response.body))
        .catchError((err) => {
              "success": false,
              "message":
                  "Houve um problema ao processar a requisição, provavelmente você está sem internet. Caso o problema continue entre em contato com o suporte."
            });
  }

  static Future put(String url, dynamic data) {
    var storage = GetStorage();
    var token = storage.read("token");
    var headers = <String, String>{};
    if (token != null) {
      headers.addAll({
        "Authorization": "Bearer $token",
        "content-type": "application/json"
      });
    }

    Uri uri = Uri.parse(url);
    return http
        .put(uri, body: jsonEncode(data), headers: headers)
        .then((response) => jsonDecode(response.body))
        .catchError((err) => {
              "success": false,
              "message":
                  "Houve um problema ao processar a requisição, provavelmente você está sem internet. Caso o problema continue entre em contato com o suporte."
            });
  }

  static Future delete(String url) {
    var storage = GetStorage();
    var token = storage.read("token");
    var headers = <String, String>{};
    if (token != null) {
      headers.addAll({
        "Authorization": "Bearer $token",
        "content-type": "application/json"
      });
    }

    Uri uri = Uri.parse(url);
    return http
        .delete(uri, headers: headers)
        .then((response) => jsonDecode(response.body))
        .catchError((err) => {
              "success": false,
              "message":
                  "Houve um problema ao processar a requisição, provavelmente você está sem internet. Caso o problema continue entre em contato com o suporte."
            });
  }
}
