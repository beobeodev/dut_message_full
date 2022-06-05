import 'package:get/get.dart';
import 'package:mobile/data/repositories/hive_local.repository.dart';
import 'package:mobile/injector.dart';
import 'package:mobile/modules/splash/controllers/splash.controller.dart';

class SplashBinding implements Bindings {
  @override
  void dependencies() {
    Get.put(
      SplashController(localRepository: getIt.get<HiveLocalRepository>()),
    );
  }
}
