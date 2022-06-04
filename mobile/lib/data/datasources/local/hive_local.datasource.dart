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
}
