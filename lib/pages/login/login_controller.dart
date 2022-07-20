import 'package:shared_preferences/shared_preferences.dart';
import 'package:base_app/shared/components/dialogs.dart';
import '../../pages/dashboard/dashboard_page.dart';
import '../../shared/controllers/app_controller.dart';
import '../../shared/services/login_service.dart';
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
    loading(false);

    if (!result["error"]) {
      message(result['message']);
      success(result['success']);

      if (success.value) {
        Dialogs.showSuccessDialog("Sucesso!", message.value);
        AppController _controller = Get.find<AppController>();
        _controller.setData(result);
        final SharedPreferences _prefs = await SharedPreferences.getInstance();

        _prefs.setString("email", email.value);
        _prefs.setString("password", password.value);

        Get.off(() => const DashboardPage());
      } else {
        Dialogs.showErrorDialog("Houve um problema", message.value);
      }
    } else {
      Dialogs.showResponseDialog(result["exception"]);
    }
  }
}
