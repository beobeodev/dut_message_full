import 'package:get_it/get_it.dart';
import 'package:mobile/data/datasources/local/hive_local.datasource.dart';
import 'package:mobile/data/datasources/remote/authentication.datasource.dart';
import 'package:mobile/data/repositories/authentication.repository.dart';
import 'package:mobile/data/repositories/hive_local.repository.dart';
import 'package:mobile/domain/usecases/login.usecase.dart';

final GetIt getIt = GetIt.instance;

void initDependencies() {
  // authentication
  getIt.registerLazySingleton(() => AuthenticationDatasource());
  getIt.registerLazySingleton(
    () => AuthenticationRepository(
      datasource: getIt.get<AuthenticationDatasource>(),
    ),
  );

  // local
  getIt.registerLazySingleton(() => HiveLocalDatasource());
  getIt.registerLazySingleton(
    () => HiveLocalRepository(datasource: getIt.get<HiveLocalDatasource>()),
  );

  getIt.registerLazySingleton(
    () => LoginUseCase(
      authenticationRepository: getIt.get<AuthenticationRepository>(),
      hiveLocalRepository: getIt.get<HiveLocalRepository>(),
    ),
  );
}
