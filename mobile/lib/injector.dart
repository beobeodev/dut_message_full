import 'package:mobile/data/datasources/remote/auth.datasource.dart';
import 'package:mobile/data/datasources/remote/conversation.datasource.dart';
import 'package:mobile/data/datasources/remote/file.datasource.dart';
import 'package:mobile/data/datasources/remote/user.datasource.dart';
import 'package:mobile/data/repositories/auth.repository.dart';
import 'package:mobile/data/repositories/conversation.repository.dart';
import 'package:mobile/data/repositories/file_repository.dart';
import 'package:mobile/data/repositories/hive_local.repository.dart';
import 'package:mobile/data/repositories/user.repository.dart';
import 'package:get_it/get_it.dart';

final GetIt getIt = GetIt.instance;

void initDependencies() {
  // Data sources
  getIt.registerLazySingleton(() => AuthRemoteDataSource());
  getIt.registerLazySingleton(() => UserRemoteDataSource());
  getIt.registerLazySingleton(() => ConversationRemoteDataSource());

  // Repository
  getIt.registerLazySingleton(() => HiveLocalRepository());
  getIt.registerLazySingleton(
    () => AuthRepository(remoteDataSource: getIt.get<AuthRemoteDataSource>()),
  );
  getIt.registerLazySingleton(
    () => ConversationRepository(
      remoteDataSource: getIt.get<ConversationRemoteDataSource>(),
    ),
  );
  getIt.registerLazySingleton(
    () => UserRepository(remoteDataSource: getIt.get<UserRemoteDataSource>()),
  );

  //* File
  getIt.registerLazySingleton(() => FileRemoteDataSource());
  getIt.registerLazySingleton(
    () =>
        FileRepository(fileRemoteDataSource: getIt.get<FileRemoteDataSource>()),
  );
}
