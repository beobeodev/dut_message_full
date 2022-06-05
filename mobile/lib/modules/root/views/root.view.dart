import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mobile/modules/root/controllers/root.controller.dart';
import 'package:mobile/modules/root/widgets/adaptive_page.widget.dart';
import 'package:mobile/modules/root/widgets/drawer_side.widget.dart';

class RootScreen extends GetView<RootController> {
  const RootScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: DecoratedBox(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Color.fromRGBO(143, 169, 236, 0.6),
              Color.fromRGBO(239, 65, 65, 0.15),
            ],
          ),
        ),
        child: Stack(
          children: const [
            DrawerSide(),
            AdaptivePage(),
          ],
        ),
      ),
    );
  }
}
