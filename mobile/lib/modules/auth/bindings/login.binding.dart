import 'package:get/get.dart';
import 'package:mobile/modules/auth/controllers/login.controller.dart';

class LoginBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => LoginController());
  }
}
