import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:get_storage/get_storage.dart';

class AppController extends GetxController {
  final success = false.obs;
  final message = "".obs;
  final language = "".obs;
  final fullname = "".obs;
  final username = "".obs;
  final token = "".obs;
  final userType = "".obs;
  final status = "".obs;
  final createdAt = "".obs;
  final firstAccess = false.obs;

  final _storage = GetStorage();

  setData(dynamic data) {
    success(data["success"]);
    message(data["message"]);
    language(data["language"]);
    fullname(data["fullname"]);
    username(data["username"]);
    token(data["token"]);
    userType(data["user_type"]);
    status(data["status"]);
    createdAt(data["created_at"]);
    firstAccess(data["first_access"]);

    _storage.write("success", data["success"]);
    _storage.write("token", data["token"]);
    _storage.write("language", data["language"]);
  }

  setLanguage(String _language) {
    language(_language);
    _storage.write("language", _language);
  }
}
