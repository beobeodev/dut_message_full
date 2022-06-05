import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mobile/core/constants/custom_enum.dart';
import 'package:mobile/domain/entities/drawer_menu_item.entity.dart';

class RootController extends GetxController {
  //Check whether drawer is open or not
  final RxBool _isDrawerOpen = false.obs;
  bool get isDrawerOpen => _isDrawerOpen.value;

  final RxDouble _xOffset = 0.0.obs;
  final RxDouble _yOffset = 0.0.obs;
  final RxDouble _scaleFactor = 1.0.obs;

  double get xOffset => _xOffset.value;
  double get yOffset => _yOffset.value;
  double get scaleFactor => _scaleFactor.value;

  // default screen is home screen
  final Rx<CurrentScreen> currentSreen = CurrentScreen.home.obs;

  //This list to store title and icon of menu item
  final List<DrawerMenuItemEntity> menuItems = [
    DrawerMenuItemEntity(
      title: 'Tin nhắn',
      icon: Icons.chat,
      screen: CurrentScreen.home,
    ),
    DrawerMenuItemEntity(
      title: 'Bạn bè',
      icon: Icons.people_alt,
      screen: CurrentScreen.friend,
    ),
    DrawerMenuItemEntity(
      title: 'Hồ sơ',
      icon: Icons.assignment_ind,
      screen: CurrentScreen.profile,
    )
  ];

  void closeDrawer() {
    _xOffset.value = 0.0;
    _yOffset.value = 0.0;
    _scaleFactor.value = 1;
    _isDrawerOpen.value = false;
  }

  void openDrawer() {
    _xOffset.value = Get.width / 2 + 30;
    _yOffset.value = 150;
    _scaleFactor.value = 0.6;
    _isDrawerOpen.value = true;
  }

  void onTapMenuItem(int menuItemIndex) {
    currentSreen.value = menuItems[menuItemIndex].screen;
    // closeDrawer();
  }
}
