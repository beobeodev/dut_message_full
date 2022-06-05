import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:mobile/core/constants/font_family.dart';
import 'package:mobile/core/theme/palette.dart';
import 'package:mobile/modules/root/controllers/root.controller.dart';
import 'package:mobile/modules/root/widgets/drawer_menu_item.widget.dart';

class DrawerSide extends GetView<RootController> {
  const DrawerSide({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        top: MediaQuery.of(context).padding.top + 10,
        bottom: 40,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const CircleAvatar(
                radius: 30,
                backgroundColor: Colors.red,
              ),
              const SizedBox(
                width: 15,
              ),
              Text(
                'Minh Đức',
                style: TextStyle(
                  fontFamily: FontFamily.fontNunito,
                  color: Palette.zodiacBlue,
                  fontSize: 20.sp,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ],
          ),
          SizedBox(
            width: ScreenUtil().setWidth(150),
            child: ListView.separated(
              shrinkWrap: true,
              itemCount: 3,
              separatorBuilder: (context, index) {
                return SizedBox(
                  height: 20.h,
                );
              },
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () {
                    controller.onTapMenuItem(index);
                  },
                  child: DrawerMenuItem(
                    title: controller.menuItems[index].title,
                    icon: controller.menuItems[index].icon,
                  ),
                );
              },
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              height: 50,
              width: (Get.width - 120).w,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Icon(
                          Icons.settings,
                          color: Palette.zodiacBlue,
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        Text(
                          'Cài đặt',
                          style: TextStyle(
                            fontFamily: FontFamily.fontNunito,
                            color: Palette.zodiacBlue,
                            fontSize: ScreenUtil().setSp(18),
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    child: GestureDetector(
                      onTap: () {},
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'Đăng xuất',
                            style: TextStyle(
                              fontFamily: FontFamily.fontNunito,
                              color: Palette.zodiacBlue,
                              fontSize: ScreenUtil().setSp(18),
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          const Icon(
                            Icons.logout_outlined,
                            color: Palette.zodiacBlue,
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
