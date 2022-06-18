import 'package:mobile/data/repositories/auth.repository.dart';
import 'package:mobile/injector.dart';
import 'package:mobile/modules/sign_up/controllers/sign_up.controller.dart';
import 'package:get/get.dart';

class SignUpBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(
      () => SignUpController(authRepository: getIt.get<AuthRepository>()),
    );
  }
}
