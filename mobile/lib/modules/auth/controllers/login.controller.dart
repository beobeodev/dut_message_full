import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mobile/core/router/route_manager.dart';
import 'package:mobile/core/utils/http/exceptions.dart';
import 'package:mobile/core/utils/http/request_state.dart';
import 'package:mobile/domain/entities/user.entity.dart';
import 'package:mobile/domain/usecases/login.usecase.dart';

class LoginController extends GetxController {
  final LoginUseCase loginUseCase;

  LoginController({required this.loginUseCase});

  final GlobalKey<FormState> loginFormKey = GlobalKey<FormState>();

  final TextEditingController usernameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  RxString errorText = ''.obs;
  RxBool showPassword = false.obs;

  String? validateUsername(String? value) {
    if (value == '') {
      return 'Vui lòng nhập tên đăng nhập';
    }
    return null;
  }

  String? validatePassword(String? value) {
    if (value == '') {
      return 'Vui lòng nhập mật khẩu';
    }
    return null;
  }

  void onChangeShowPassword() {
    showPassword.value = !showPassword.value;
  }

  Future<void> onTapButtonLogin() async {
    if (!loginFormKey.currentState!.validate()) {
      return;
    }

    final Map<String, dynamic> formData = {
      'username': usernameController.text,
      'password': passwordController.text,
    };

    final RequestState<UserEntity> loginState =
        await loginUseCase.execute(params: formData);
    if (loginState is RequestSuccess) {
      Get.offAndToNamed(RouteManager.root);
    } else if (loginState is RequestFailed<UserEntity>) {
      handleError(loginState);
    }
  }

  void handleError(RequestFailed<UserEntity> loginStateFailed) {
    if (loginStateFailed.error is UnauthorisedException) {
      errorText.value = 'Sai tài khoản hoặc mật khẩu';
    }
  }
}
