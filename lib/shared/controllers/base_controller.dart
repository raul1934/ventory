import 'package:get/get.dart';

class BaseController extends GetxController {
  final loading = false.obs;

  toggleLoading(bool value) {
    loading(value);
  }
}
