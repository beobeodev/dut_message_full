import 'package:mobile/modules/base/controllers/auth.controller.dart';
import 'package:mobile/modules/root/controllers/root.controller.dart';
import 'package:get/get.dart';

class RootBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(
      () => RootController(authController: Get.find<AuthController>()),
    );
  }
}
