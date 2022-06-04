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
}
