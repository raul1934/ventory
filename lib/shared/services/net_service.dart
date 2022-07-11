import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart' as http;
import 'package:ventory/constaints.dart';
import 'package:ventory/pages/login/login_page.dart';
import 'package:ventory/shared/components/dialogs.dart';

class NetService {
  static Future get(String url) async {
    var ret = await _verify();

    if (ret != null) {
      return ret;
    }

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

    try {
      http.Response response = await http
          .get(uri, headers: headers)
          .timeout(const Duration(seconds: 30));
      if (response.statusCode >= 200 && response.statusCode <= 299) {
        var ret = jsonDecode(response.body);
        ret["error"] = false;
        ret["exception"] = null;
        return ret;
      }
    } on TimeoutException catch (e) {
      return {"error": true, "exception": e};
    } on SocketException catch (e) {
      return {"error": true, "exception": e};
    } on Error catch (e) {
      return {"error": true, "exception": e};
    }
  }

  static Future post(String url, dynamic data) async {
    var ret = await _verify();

    if (ret != null) {
      return ret;
    }

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

    try {
      http.Response response = await http
          .post(uri, body: jsonEncode(data), headers: headers)
          .timeout(const Duration(seconds: 30));
      if (response.statusCode >= 200 && response.statusCode <= 299) {
        var ret = jsonDecode(response.body);
        ret["error"] = false;
        ret["exception"] = null;
        return ret;
      }
    } on TimeoutException catch (e) {
      return {"error": true, "exception": e};
    } on SocketException catch (e) {
      return {"error": true, "exception": e};
    } on Error catch (e) {
      return {"error": true, "exception": e};
    }
  }

  static Future put(String url, dynamic data) async {
    var ret = await _verify();

    if (ret != null) {
      return ret;
    }

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

    try {
      http.Response response = await http
          .put(uri, body: jsonEncode(data), headers: headers)
          .timeout(const Duration(seconds: 30));
      if (response.statusCode >= 200 && response.statusCode <= 299) {
        var ret = jsonDecode(response.body);
        ret["error"] = false;
        ret["exception"] = null;
        return ret;
      }
    } on TimeoutException catch (e) {
      return {"error": true, "exception": e};
    } on SocketException catch (e) {
      return {"error": true, "exception": e};
    } on Error catch (e) {
      return {"error": true, "exception": e};
    }
  }

  static Future delete(String url) async {
    var ret = await _verify();

    if (ret != null) {
      return ret;
    }

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

    try {
      http.Response response = await http
          .delete(uri, headers: headers)
          .timeout(const Duration(seconds: 30));
      if (response.statusCode >= 200 && response.statusCode <= 299) {
        var ret = jsonDecode(response.body);
        ret["error"] = false;
        ret["exception"] = null;
        return ret;
      }
    } on TimeoutException catch (e) {
      return {"error": true, "exception": e};
    } on SocketException catch (e) {
      return {"error": true, "exception": e};
    } on Error catch (e) {
      return {"error": true, "exception": e};
    }
  }

  static _verify() async {
    var storage = GetStorage();
    var token = storage.read("token");
    var headers = <String, String>{};

    if (token != null) {
      headers.addAll({
        "Authorization": "Bearer $token",
        "content-type": "application/json"
      });

      Uri uri = Uri.parse(DRS_AUTH_URL + "/api/v1/verify");

      try {
        http.Response response = await http
            .get(uri, headers: headers)
            .timeout(const Duration(seconds: 30));
        if (response.statusCode >= 200 && response.statusCode <= 299) {
          var ret = jsonDecode(response.body);
          if (ret["message"] != null) {
            Get.off(() => LoginPage());
            Dialogs.showErrorDialog("Houve um problema", ret["message"]);
          }
        }
      } on TimeoutException catch (e) {
        return {"error": true, "exception": e};
      } on SocketException catch (e) {
        return {"error": true, "exception": e};
      } on Error catch (e) {
        return {"error": true, "exception": e};
      }
    }
  }
}
