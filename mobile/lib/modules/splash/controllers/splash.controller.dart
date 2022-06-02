import 'package:get/get.dart';
import 'package:mobile/core/router/route_manager.dart';

class SplashController extends GetxController {
  @override
  void onReady() async {
    super.onReady();
    await Future<void>.delayed(const Duration(milliseconds: 1600));
    Get.toNamed(RouteManager.login);
  }
}
