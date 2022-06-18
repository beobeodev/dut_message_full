import 'package:mobile/data/repositories/firebase_repository.dart';
import 'package:mobile/data/repositories/user_repository.dart';
import 'package:mobile/injector.dart';
import 'package:mobile/modules/base/controllers/auth.controller.dart';
import 'package:mobile/modules/chat/controllers/chat.controller.dart';
import 'package:mobile/modules/chat/controllers/menu_chat.controller.dart';
import 'package:mobile/modules/friend/controllers/friend.controller.dart';
import 'package:mobile/modules/home/controllers/home.controller.dart';
import 'package:mobile/modules/root/controllers/root.controller.dart';
import 'package:get/get.dart';

class ChatBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(
      () => ChatController(
        authController: Get.find<AuthController>(),
        firebaseRepository: getIt.get<FirebaseRepository>(),
        homeController: Get.find<HomeController>(),
        rootController: Get.find<RootController>(),
      ),
    );

    Get.lazyPut(
      () => MenuChatController(
        userRepository: getIt.get<UserRepository>(),
        chatController: Get.find<ChatController>(),
        rootController: Get.find<RootController>(),
        authController: Get.find<AuthController>(),
        friendController: Get.find<FriendController>(),
      ),
    );
  }
}
