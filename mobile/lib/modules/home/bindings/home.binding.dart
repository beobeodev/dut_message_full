import 'package:get/get.dart';
import 'package:mobile/modules/home/controllers/home.controller.dart';
import 'package:mobile/modules/root/controllers/root.controller.dart';

class HomeBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(
      () => HomeController(rootController: Get.find<RootController>()),
    );
  }
}
