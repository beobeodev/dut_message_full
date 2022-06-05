import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mobile/core/theme/palette.dart';
import 'package:mobile/core/constants/font_family.dart';

class DrawerMenuItem extends StatelessWidget {
  final String title;
  final IconData icon;

  const DrawerMenuItem({Key? key, required this.title, required this.icon})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50.h,
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topRight: Radius.circular(12),
          bottomRight: Radius.circular(12),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Text(
            title,
            style: TextStyle(
              fontFamily: FontFamily.fontNunito,
              color: Palette.red100,
              fontSize: 17.sp,
              fontWeight: FontWeight.w700,
            ),
          ),
          Icon(
            icon,
            size: 26.sp,
            color: Palette.red100,
          ),
        ],
      ),
    );
  }
}
