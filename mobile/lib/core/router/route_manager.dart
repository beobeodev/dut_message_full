import 'package:get/get.dart';
import 'package:mobile/modules/auth/bindings/login.binding.dart';
import 'package:mobile/modules/auth/views/login.view.dart';
import 'package:mobile/modules/splash/bindings/splash.binding.dart';
import 'package:mobile/modules/splash/views/splash.view.dart';

abstract class RouteManager {
  static const String splash = '/splash';
  static const String login = '/login';

  static List<GetPage> pages = [
    GetPage(
      name: splash,
      page: () => const SplashScreen(),
      binding: SplashBinding(),
    ),
    GetPage(
      name: login,
      page: () => const LoginScreen(),
      binding: LoginBinding(),
    )
  ];
}
