import 'dart:developer';

import 'package:shared_preferences/shared_preferences.dart';
import 'package:base_app/shared/components/dialogs.dart';
import '../../pages/dashboard/dashboard_page.dart';
import '../../shared/controllers/app_controller.dart';
import '../../shared/services/login_service.dart';
import 'package:get/get.dart';

class SplashScreenController extends GetxController {
  final loading = true.obs;
  final email = "".obs;
  final password = "".obs;
  final message = "".obs;
  final success = false.obs;

  @override
  void onInit() {
    super.onInit();
    login();
  }

  setEmail(String _email) {
    email(_email);
  }

  setPassword(String _password) {
    password(_password);
  }

  login() async {
    loading(true);
    update(["SplashScreenBuilder"]);

    final SharedPreferences _prefs = await SharedPreferences.getInstance();

    setEmail(_prefs.getString("email") ?? "");
    setPassword(_prefs.getString("password") ?? "");

    if (email.value.isNotEmpty && password.value.isNotEmpty) {
      LoginService loginService = LoginService();
      var result = await loginService.login(email.value, password.value);

      loading(false);
      update(["SplashScreenBuilder"]);

      if (!result["error"]) {
        message(result['message']);
        success(result['success']);

        if (success.value) {
          Dialogs.showSuccessDialog("Sucesso!", message.value);
          AppController _controller = Get.find<AppController>();
          _controller.setData(result);
          Get.off(() => const DashboardPage());
        } else {
          Dialogs.showErrorDialog("Houve um problema", message.value);
        }
      } else {
        Dialogs.showResponseDialog(result["exception"]);
      }
    }

    loading(false);
    update(["SplashScreenBuilder"]);
  }
}
