import 'package:mobile/data/repositories/auth.repository.dart';
import 'package:mobile/injector.dart';
import 'package:mobile/modules/login/controllers/forgot_password.controller.dart';
import 'package:get/get.dart';

class ForgotPasswordBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(
      () =>
          ForgotPasswordController(authRepository: getIt.get<AuthRepository>()),
    );
  }
}
