import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:mobile/core/constants/font_family.dart';
import 'package:mobile/core/theme/palette.dart';
import 'package:mobile/modules/home/controllers/home.controller.dart';
import 'package:mobile/widgets/rounded_text_form_field.widget.dart';

class HeaderHome extends GetView<HomeController> {
  const HeaderHome({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            IconButton(
              padding: EdgeInsets.zero,
              visualDensity: const VisualDensity(horizontal: -4, vertical: -4),
              onPressed: controller.rootController.openDrawer,
              icon: const Icon(
                Icons.menu,
                color: Palette.red100,
              ),
            ),
            Text(
              'DUT Message',
              style: TextStyle(
                color: Palette.red100,
                fontWeight: FontWeight.w700,
                fontFamily: FontFamily.fontNunito,
                fontSize: 21.sp,
              ),
            ),
            const CircleAvatar(
              radius: 25,
              backgroundColor: Colors.red,
            ),
          ],
        ),
        SizedBox(
          height: 15.h,
        ),
        RoundedTextFormField(
          textController: TextEditingController(),
          hintText: 'Nhập tin nhắn cần tìm',
          borderRadius: 50,
          borderColor: Colors.white,
          suffixIconWidget: const Icon(
            Icons.search,
            color: Palette.red100,
          ),
        ),
      ],
    );
  }
}
