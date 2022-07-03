import '../../shared/services/net_service.dart';
import '../../constaints.dart';

class LoginService {
  login(String email, String password) {
    String url = DRS_AUTH_URL + "/api/v1/auth";
    Map<String, dynamic> data = {
      "username": email,
      "password": password,
    };

    return NetService.post(url, data);
  }
}
