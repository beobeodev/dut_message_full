import 'package:flutter/cupertino.dart';
import 'package:mobile/core/constants/custom_enum.dart';

class DrawerMenuItemEntity {
  final String title;
  final IconData icon;
  final CurrentScreen screen;

  DrawerMenuItemEntity({
    required this.title,
    required this.icon,
    required this.screen,
  });
}
