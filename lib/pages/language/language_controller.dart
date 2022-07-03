import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:get_storage/get_storage.dart';

class LanguageController extends GetxController {
  final language = "".obs;

  loadlanguage() {
    final _storage = GetStorage();
    language(_storage.read("language"));
  }

  setLanguage(String _language) {
    language(_language);
  }
}
