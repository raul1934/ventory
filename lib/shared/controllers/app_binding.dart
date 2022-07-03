import '../../shared/controllers/app_controller.dart';
import 'package:get/get.dart';

class AppBinding implements Bindings {
// default dependency
  @override
  void dependencies() {
    Get.put<AppController>(AppController(), permanent: true);
  }
}
