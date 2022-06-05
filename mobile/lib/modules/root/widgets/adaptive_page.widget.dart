import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mobile/core/constants/custom_enum.dart';
import 'package:mobile/modules/friend/views/friend.view.dart';
import 'package:mobile/modules/home/views/home.view.dart';
import 'package:mobile/modules/profile/views/profile.view.dart';
import 'package:mobile/modules/root/controllers/root.controller.dart';

class AdaptivePage extends GetView<RootController> {
  const AdaptivePage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        return false;
      },
      child: GestureDetector(
        onTap: controller.closeDrawer,
        child: Obx(
          () => AnimatedContainer(
            duration: const Duration(milliseconds: 250),
            curve: Curves.easeInOutCirc,
            transform: Matrix4.translationValues(
              controller.xOffset,
              controller.yOffset,
              0,
            )..scale(controller.scaleFactor),
            child: AbsorbPointer(
              absorbing: controller.isDrawerOpen,
              child: ClipRRect(
                borderRadius:
                    BorderRadius.circular(controller.isDrawerOpen ? 40 : 0),
                child: buildPage(),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget buildPage() {
    switch (controller.currentSreen.value) {
      case CurrentScreen.home:
        return const HomeScreen();
      case CurrentScreen.friend:
        return const FriendScreen();
      case CurrentScreen.profile:
        return const ProfileScreen();
    }
  }
}
