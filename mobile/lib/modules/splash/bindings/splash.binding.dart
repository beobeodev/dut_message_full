import 'package:mobile/modules/base/controllers/auth.controller.dart';
import 'package:mobile/modules/splash/controllers/splash.controller.dart';
import 'package:get/get.dart';

class SplashBinding implements Bindings {
  @override
  void dependencies() {
    Get.put(
      SplashController(
        authController: Get.find<AuthController>(),
      ),
    );
  }
}
