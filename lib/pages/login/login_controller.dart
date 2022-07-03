import '../../pages/dashboard/dashboard_page.dart';
import '../../shared/controllers/app_controller.dart';
import '../../shared/services/login_service.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginController extends GetxController {
  final loading = false.obs;
  final email = "".obs;
  final password = "".obs;
  final message = "".obs;
  final success = false.obs;

  setEmail(String _email) {
    email(_email);
  }

  setPassword(String _password) {
    password(_password);
  }

  login() async {
    loading(true);

    LoginService loginService = LoginService();
    var result = await loginService.login(email.value, password.value);

    message(result['message']);
    success(result['success']);

    Get.snackbar(
        success.value ? "Sucesso!" : "Houve um problema", message.value,
        icon: success.value
            ? const Icon(Icons.check, color: Colors.green)
            : const Icon(Icons.align_vertical_bottom, color: Colors.red),
        snackPosition: SnackPosition.BOTTOM);

    loading(false);

    if (success.value == true) {
      AppController _controller = Get.find<AppController>();
      _controller.setData(result);
      Get.off(() => const DashboardPage());
    }
  }
}
