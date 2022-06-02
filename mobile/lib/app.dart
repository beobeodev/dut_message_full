import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import 'package:mobile/core/router/route_manager.dart';

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return GetMaterialApp(
          title: 'DUT Message',
          debugShowCheckedModeBanner: false,
          getPages: RouteManager.pages,
          initialRoute: RouteManager.splash,
          // translationsKeys: AppTranslation.translations,
          // fallbackLocale: const Locale('vi', 'VN'),
          // locale: Get.deviceLocale,
        );
      },
    );
  }
}
