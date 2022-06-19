import 'package:mobile/data/datasources/remote/file.datasource.dart';
import 'package:mobile/data/repositories/auth.repository.dart';
import 'package:mobile/data/repositories/conversation.repository.dart';
import 'package:mobile/data/repositories/file_repository.dart';
import 'package:mobile/data/repositories/hive_local.repository.dart';
import 'package:mobile/data/repositories/user.repository.dart';
import 'package:get_it/get_it.dart';

final GetIt getIt = GetIt.instance;

void initDependencies() {
  getIt.registerLazySingleton(() => HiveLocalRepository());
  getIt.registerLazySingleton(() => AuthRepository());
  getIt.registerLazySingleton(() => ConversationRepository());
  getIt.registerLazySingleton(() => UserRepository());

  //* File
  getIt.registerLazySingleton(() => FileRemoteDataSource());
  getIt.registerLazySingleton(
    () =>
        FileRepository(fileRemoteDataSource: getIt.get<FileRemoteDataSource>()),
  );
}
