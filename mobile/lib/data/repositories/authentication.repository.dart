import 'package:mobile/data/datasources/remote/authentication.datasource.dart';
import 'package:mobile/domain/repositories/iauthentication.repository.dart';

class AuthenticationRepository implements IAuthenticationRepository {
  final AuthenticationDatasource datasource;

  AuthenticationRepository({required this.datasource});

  @override
  Future<Map<String, dynamic>> login(
    Map<String, dynamic> formBody,
  ) async {
    final Map<String, dynamic> rawData = await datasource.login(formBody);
    return rawData;
  }
}
