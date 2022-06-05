import 'package:hive_flutter/hive_flutter.dart';

abstract class IHiveLocalRepository {
  Future<Box> openAuthBox();
  Future<void> setAllDataToAuthBox(
    String accessToken,
    String refreshToken,
    Map<String, dynamic> userData,
  );
  // Token
  Future<void> setAllToken(String accessToken, String refreshToken);
  Future<void> deleteAllToken();
  Future<String?> getAccessToken();
  Future<String> getRefreshToken();
  // User data
  Future<void> setCurrentUserData(Map<String, dynamic> data);
  Future<Map<dynamic, dynamic>> getCurrentUserData();
  Future<void> deleteCurrentUserData();

  Future<void> removeAllData();
}
