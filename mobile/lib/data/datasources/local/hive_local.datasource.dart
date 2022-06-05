import 'package:hive_flutter/hive_flutter.dart';
import 'package:mobile/core/constants/key_box_local.dart';

abstract class IHiveLocalDatasource {
  Future<Box> openAuthBox();
  Future<void> setAllDataToAuthBox(
    String accessToken,
    String refreshToken,
    Map<String, dynamic> userData,
  );
}

class HiveLocalDatasource implements IHiveLocalDatasource {
  Box? _authBox;

  Future<Box> get authBox async {
    if (_authBox != null) {
      return _authBox!;
    }
    _authBox = await openAuthBox();
    return _authBox!;
  }

  @override
  Future<Box> openAuthBox() async {
    return await Hive.openBox(KeyHiveLocal.authBox);
  }

  @override
  Future<void> setAllDataToAuthBox(
    String accessToken,
    String refreshToken,
    Map<String, dynamic> userData,
  ) async {
    final Box atBox = await authBox;
    await atBox.put(KeyHiveLocal.accessToken, accessToken);
    await atBox.put(KeyHiveLocal.refreshToken, refreshToken);
    await atBox.put(KeyHiveLocal.currentUser, userData);
  }

  // Token
  Future<void> setAllToken(String accessToken, String refreshToken) async {
    final Box atBox = await authBox;

    await atBox.put(KeyHiveLocal.accessToken, accessToken);
    await atBox.put(KeyHiveLocal.refreshToken, refreshToken);
  }

  Future<void> deleteAllToken() async {
    final Box atBox = await authBox;

    await atBox.delete(KeyHiveLocal.accessToken);
    await atBox.delete(KeyHiveLocal.refreshToken);
  }

  Future<String?> getAccessToken() async {
    final Box atBox = await authBox;
    return atBox.get(KeyHiveLocal.accessToken);
  }

  Future<String> getRefreshToken() async {
    final Box atBox = await authBox;
    return atBox.get(KeyHiveLocal.refreshToken);
  }

  // User data
  Future<void> setCurrentUserData(Map<String, dynamic> data) async {
    final Box atBox = await authBox;
    await atBox.put(KeyHiveLocal.currentUser, data);
  }

  Future<Map<dynamic, dynamic>> getCurrentUserData() async {
    final Box atBox = await authBox;
    return atBox.get(KeyHiveLocal.currentUser);
  }

  Future<void> deleteCurrentUserData() async {
    final Box atBox = await authBox;
    await atBox.delete(KeyHiveLocal.currentUser);
  }

  Future<void> removeAllData() async {
    await deleteAllToken();
    await deleteCurrentUserData();
    // await authBox.clear();
    // await authBox.deleteFromDisk();
  }
}
