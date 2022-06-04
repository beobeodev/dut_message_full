import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:mobile/core/constants/font_family.dart';
import 'package:mobile/core/theme/palette.dart';

class DynamicSnackBar extends StatelessWidget {
  final String message;

  const DynamicSnackBar({Key? key, required this.message}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetSnackBar(
      icon: const Icon(Icons.warning, color: Colors.yellow),
      borderColor: Palette.red200,
      backgroundColor: Colors.white,
      borderRadius: 10,
      margin: const EdgeInsets.all(15),
      padding: const EdgeInsets.symmetric(vertical: 10),
      duration: const Duration(seconds: 3),
      dismissDirection: DismissDirection.horizontal,
      forwardAnimationCurve: Curves.easeOutBack,
      messageText: Text(
        message,
        style: TextStyle(
          fontFamily: FontFamily.fontNunito,
          fontSize: 17.sp,
          color: Palette.red200,
        ),
      ),
    );
  }
}
