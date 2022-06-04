import 'package:hive_flutter/hive_flutter.dart';

abstract class IHiveLocalRepository {
  Future<Box> openAuthBox();
  Future<void> setAllDataToAuthBox(
    String accessToken,
    String refreshToken,
    Map<String, dynamic> userData,
  );
}
