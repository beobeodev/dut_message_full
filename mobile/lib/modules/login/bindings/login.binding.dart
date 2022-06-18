import 'package:mobile/data/repositories/auth.repository.dart';
import 'package:mobile/injector.dart';
import 'package:mobile/modules/base/controllers/auth.controller.dart';
import 'package:mobile/modules/login/controllers/login.controller.dart';
import 'package:get/get.dart';

class LoginBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(
      () => LoginController(
        authRepository: getIt.get<AuthRepository>(),
        authController: Get.find<AuthController>(),
      ),
    );
  }
}
