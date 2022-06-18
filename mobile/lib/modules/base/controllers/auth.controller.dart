import 'package:mobile/core/utils/authorization.util.dart';
import 'package:mobile/data/models/user.model.dart';
import 'package:mobile/data/repositories/hive_local.repository.dart';
import 'package:get/get.dart';

class AuthController extends GetxController {
  final HiveLocalRepository localRepository;

  AuthController({required this.localRepository});

  String? accessToken;
  String? refreshToken;
  UserModel? currentUser;
  bool? isNewUser;

  @override
  Future<void> onInit() async {
    await _getAllUserData();
    super.onInit();
  }

  Future<void> _getAllUserData() async {
    accessToken = await localRepository.getAccessToken();
    refreshToken = await localRepository.getRefreshToken();
    currentUser = await localRepository.getCurrentUser();
    isNewUser = await localRepository.getNewUser();

    _setHeader();
  }

  void _setHeader() {
    AuthorizationUtil.header = {
      'accessToken': accessToken,
      'refreshToken': refreshToken,
      'id': currentUser?.id,
    };
  }

  Future<void> handleSuccessLogin(
    UserModel loggedUser,
    String newAccessToken,
    String newRefreshToken,
  ) async {
    await localRepository.setAllNewUserData(
      newAccessToken,
      newRefreshToken,
      loggedUser.toJson(),
    );

    accessToken = newAccessToken;
    refreshToken = newRefreshToken;
    currentUser = loggedUser;
    _setHeader();
  }

  Future<void> setCurrentUser(UserModel newUser) async {
    currentUser = newUser;
    await localRepository.setCurrentUser(newUser.toJson());
  }
}
