import 'dart:developer';

import 'package:mobile/core/utils/http/exceptions.dart';
import 'package:mobile/core/utils/http/request_state.dart';
import 'package:mobile/domain/entities/user.entity.dart';
import 'package:mobile/domain/repositories/iauthentication.repository.dart';
import 'package:mobile/domain/repositories/ihive_local.repository.dart';
import 'package:mobile/domain/usecases/use_case.dart';

class LoginUseCase
    implements UseCase<RequestState<UserEntity>, Map<String, dynamic>> {
  final IAuthenticationRepository authenticationRepository;
  final IHiveLocalRepository hiveLocalRepository;

  LoginUseCase({
    required this.authenticationRepository,
    required this.hiveLocalRepository,
  });

  @override
  Future<RequestState<UserEntity>> execute({
    Map<String, dynamic> params = const {},
  }) async {
    try {
      final Map<String, dynamic> userLoginData =
          await authenticationRepository.login(params);
      final UserEntity currentUser = UserEntity.fromJson(userLoginData['user']);
      // save user data to local
      await hiveLocalRepository.setAllDataToAuthBox(
        userLoginData['accessToken'],
        userLoginData['refreshToken'],
        currentUser.toJson(),
      );

      return RequestSuccess(currentUser);
    } on AppException catch (appException) {
      return RequestFailed(appException);
    } catch (e) {
      log(e.toString());
      return RequestFailed(
        AppException(status: 'Undefined', message: e.toString()),
      );
    }
  }
}
