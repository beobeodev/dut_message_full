import 'package:hive_flutter/hive_flutter.dart';
import 'package:mobile/data/datasources/local/hive_local.datasource.dart';
import 'package:mobile/domain/repositories/ihive_local.repository.dart';

class HiveLocalRepository implements IHiveLocalRepository {
  final HiveLocalDatasource datasource;

  HiveLocalRepository({required this.datasource});

  @override
  Future<Box> openAuthBox() async {
    return await datasource.openAuthBox();
  }

  @override
  Future<void> setAllDataToAuthBox(
    String accessToken,
    String refreshToken,
    Map<String, dynamic> userData,
  ) async {
    return await datasource.setAllDataToAuthBox(
      accessToken,
      refreshToken,
      userData,
    );
  }

  @override
  Future<void> setAllToken(String accessToken, String refreshToken) async {
    return await datasource.setAllToken(accessToken, refreshToken);
  }

  @override
  Future<void> deleteAllToken() async {
    return await datasource.deleteAllToken();
  }

  @override
  Future<String?> getAccessToken() async {
    return await datasource.getAccessToken();
  }

  @override
  Future<String> getRefreshToken() async {
    return await datasource.getRefreshToken();
  }

  // User data
  @override
  Future<void> setCurrentUserData(Map<String, dynamic> data) async {
    return await datasource.setCurrentUserData(data);
  }

  @override
  Future<Map> getCurrentUserData() async {
    return await datasource.getCurrentUserData();
  }

  @override
  Future<void> deleteCurrentUserData() async {
    return await datasource.deleteCurrentUserData();
  }

  @override
  Future<void> removeAllData() async {
    return await datasource.removeAllData();
  }
}
