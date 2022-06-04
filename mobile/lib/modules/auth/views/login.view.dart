import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:mobile/core/constants/asset_path.dart';
import 'package:mobile/core/constants/font_family.dart';
import 'package:mobile/core/theme/palette.dart';
import 'package:mobile/modules/auth/controllers/login.controller.dart';
import 'package:mobile/modules/auth/widgets/rounded_button.widget.dart';
import 'package:mobile/widgets/rounded_text_form_field.widget.dart';

class LoginScreen extends GetView<LoginController> {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: GestureDetector(
          onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
          child: Container(
            width: Get.width,
            height: Get.height,
            padding: EdgeInsets.only(
              left: 25,
              right: 25,
              top: MediaQuery.of(context).padding.top + 10,
              bottom: 20,
            ),
            decoration: const BoxDecoration(color: Palette.white100),
            child: Form(
              key: controller.loginFormKey,
              child: Column(
                children: [
                  Image.asset(AssetPath.imageGroupChat),
                  SizedBox(
                    height: 20.h,
                  ),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      'Đăng nhập',
                      style: TextStyle(
                        fontFamily: FontFamily.fontNunito,
                        color: Palette.zodiacBlue,
                        fontSize: 28.sp,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 60.h,
                  ),
                  RoundedTextFormField(
                    textController: controller.usernameController,
                    hintText: 'Tên đăng nhập',
                    suffixIconWidget: const Icon(
                      Icons.mail,
                      color: Palette.blue200,
                    ),
                    validator: controller.validateUsername,
                  ),
                  SizedBox(
                    height: 20.h,
                  ),
                  Obx(
                    () => RoundedTextFormField(
                      textController: controller.passwordController,
                      hintText: 'Mật khẩu',
                      suffixIconWidget: GestureDetector(
                        onTap: controller.onChangeShowPassword,
                        child: Icon(
                          controller.showPassword.value
                              ? Icons.visibility
                              : Icons.visibility_off,
                          color: controller.showPassword.value
                              ? Palette.blue200
                              : Colors.grey,
                        ),
                      ),
                      validator: controller.validatePassword,
                      obscureText: !controller.showPassword.value,
                      errorText: controller.errorText.value,
                    ),
                  ),
                  SizedBox(
                    height: 30.h,
                  ),
                  RoundedButton(
                    onPressed: controller.onTapButtonLogin,
                    content: 'Đăng nhập',
                  ),
                  const Spacer(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Chưa có tài khoản? ',
                        style: TextStyle(
                          color: Palette.zodiacBlue,
                          fontFamily: FontFamily.fontNunito,
                          fontWeight: FontWeight.w400,
                          fontSize: 16.sp,
                        ),
                      ),
                      GestureDetector(
                        onTap: () {},
                        child: Text(
                          'ĐĂNG KÝ',
                          style: TextStyle(
                            color: Palette.blue200,
                            fontFamily: FontFamily.fontNunito,
                            fontWeight: FontWeight.w700,
                            fontSize: 16.sp,
                          ),
                        ),
                      )
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
