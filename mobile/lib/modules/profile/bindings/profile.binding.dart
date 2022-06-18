import 'package:mobile/data/repositories/firebase_repository.dart';
import 'package:mobile/data/repositories/user_repository.dart';
import 'package:mobile/injector.dart';
import 'package:mobile/modules/base/controllers/auth.controller.dart';
import 'package:mobile/modules/profile/controllers/profile.controller.dart';
import 'package:mobile/modules/root/controllers/root.controller.dart';
import 'package:get/get.dart';

class ProfileBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(
      () => ProfileController(
        authController: Get.find<AuthController>(),
        rootController: Get.find<RootController>(),
        userRepository: getIt.get<UserRepository>(),
        firebaseRepository: getIt.get<FirebaseRepository>(),
      ),
    );
  }
}
