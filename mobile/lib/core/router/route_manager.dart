import 'package:get/get.dart';
import 'package:mobile/modules/auth/bindings/login.binding.dart';
import 'package:mobile/modules/auth/views/login.view.dart';
import 'package:mobile/modules/friend/views/friend.view.dart';
import 'package:mobile/modules/home/bindings/home.binding.dart';
import 'package:mobile/modules/home/views/home.view.dart';
import 'package:mobile/modules/profile/views/profile.view.dart';
import 'package:mobile/modules/root/bindings/root.binding.dart';
import 'package:mobile/modules/root/views/root.view.dart';
import 'package:mobile/modules/splash/bindings/splash.binding.dart';
import 'package:mobile/modules/splash/views/splash.view.dart';

abstract class RouteManager {
  static const String splash = '/splash';
  static const String login = '/login';
  static const String root = '/root';
  static const String home = '/home';
  static const String friend = '/friend';
  static const String profile = '/profile';

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
    ),
    GetPage(
      name: root,
      page: () => const RootScreen(),
      bindings: [RootBinding(), HomeBinding()],
    ),
    GetPage(
      name: home,
      page: () => const HomeScreen(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: friend,
      page: () => const FriendScreen(),
    ),
    GetPage(
      name: profile,
      page: () => const ProfileScreen(),
    )
  ];
}
