import 'dart:convert';
import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart' as http;

class NetService {
  static Future get(String url) {
    var storage = GetStorage();
    var token = storage.read("token");
    var headers = <String, String>{};
    if (token != null) {
      headers.addAll({"Authorization": "Bearer $token"});
    }

    Uri uri = Uri.parse(url);
    return http
        .get(uri, headers: headers)
        .then((response) => jsonDecode(response.body))
        .catchError((err) => jsonDecode(err));
  }

  static Future post(String url, dynamic data) {
    var storage = GetStorage();
    var token = storage.read("token");
    var headers = <String, String>{};
    if (token != null) {
      headers.addAll({"Authorization": "Bearer $token"});
    }

    Uri uri = Uri.parse(url);
    return http
        .post(uri, body: data, headers: headers)
        .then((response) => jsonDecode(response.body))
        .catchError((err) => jsonDecode(err));
  }

  static Future put(String url, dynamic data) {
    var storage = GetStorage();
    var token = storage.read("token");
    var headers = <String, String>{};
    if (token != null) {
      headers.addAll({"Authorization": "Bearer $token"});
    }

    Uri uri = Uri.parse(url);
    return http
        .put(uri, body: data, headers: headers)
        .then((response) => jsonDecode(response.body))
        .catchError((err) => jsonDecode(err));
  }

  static Future delete(String url) {
    var storage = GetStorage();
    var token = storage.read("token");
    var headers = <String, String>{};
    if (token != null) {
      headers.addAll({"Authorization": "Bearer $token"});
    }

    Uri uri = Uri.parse(url);
    return http
        .delete(uri, headers: headers)
        .then((response) => jsonDecode(response.body))
        .catchError((err) => jsonDecode(err));
  }
}
