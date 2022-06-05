import 'package:get/get.dart';
import 'package:mobile/core/router/route_manager.dart';
import 'package:mobile/domain/repositories/ihive_local.repository.dart';

class SplashController extends GetxController {
  final IHiveLocalRepository localRepository;

  SplashController({required this.localRepository});

  @override
  void onReady() async {
    super.onReady();
    await Future<void>.delayed(const Duration(milliseconds: 1500));

    final String? accessToken = await localRepository.getAccessToken();
    if (accessToken != null) {
      Get.offAndToNamed(RouteManager.root);
    } else {
      Get.offAndToNamed(RouteManager.login);
    }
  }
}
