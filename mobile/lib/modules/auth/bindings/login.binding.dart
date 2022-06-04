import 'package:get/get.dart';
import 'package:mobile/domain/usecases/login.usecase.dart';
import 'package:mobile/injector.dart';
import 'package:mobile/modules/auth/controllers/login.controller.dart';

class LoginBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => LoginController(loginUseCase: getIt.get<LoginUseCase>()));
  }
}
