import 'package:mobile/data/repositories/hive_local.repository.dart';
import 'package:mobile/injector.dart';
import 'package:mobile/modules/onboard/controllers/onboard.controller.dart';
import 'package:get/get.dart';

class OnboardBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(
      () =>
          OnboardController(localRepository: getIt.get<HiveLocalRepository>()),
    );
  }
}
