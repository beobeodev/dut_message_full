import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mobile/core/theme/palette.dart';
import 'package:mobile/modules/splash/widgets/logo_app.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [Palette.white200, Colors.white])),
        width: Get.width,
        height: Get.height,
        child: const Center(
          child: LogoApp(),
        ),
      ),
    );
  }
}
