import 'package:mobile/data/repositories/user_repository.dart';
import 'package:mobile/injector.dart';
import 'package:mobile/modules/base/controllers/auth.controller.dart';
import 'package:mobile/modules/friend/controllers/friend.controller.dart';
import 'package:mobile/modules/home/controllers/home.controller.dart';
import 'package:mobile/modules/root/controllers/root.controller.dart';
import 'package:get/get.dart';

class FriendBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(
      () => FriendController(
        userRepository: getIt.get<UserRepository>(),
        // socketController: Get.find<SocketController>(),
        homeController: Get.find<HomeController>(),
        authController: Get.find<AuthController>(),
        rootController: Get.find<RootController>(),
      ),
    );
  }
}
