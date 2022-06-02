import 'package:get/get.dart';
import 'package:mobile/modules/splash/controllers/splash.controller.dart';

class SplashBinding implements Bindings {
  @override
  void dependencies() {
    Get.put(SplashController());
  }
}
