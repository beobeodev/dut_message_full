import 'package:mobile/data/repositories/conversation.repository.dart';
import 'package:mobile/injector.dart';
import 'package:mobile/modules/base/controllers/auth.controller.dart';
import 'package:mobile/modules/home/controllers/home.controller.dart';
import 'package:mobile/modules/root/controllers/root.controller.dart';
import 'package:get/get.dart';

class HomeBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(
      () => HomeController(
        authController: Get.find<AuthController>(),
        conversationRepository: getIt.get<ConversationRepository>(),
        rootController: Get.find<RootController>(),
      ),
    );
  }
}
