import 'package:mobile/core/utils/http/http_provider.dart';

abstract class IAuthenticationDatasource {
  Future<Map<String, dynamic>> login(Map<String, dynamic> formBody);
}

class AuthenticationDatasource implements IAuthenticationDatasource {
  @override
  Future<Map<String, dynamic>> login(Map<String, dynamic> formBody) async {
    final Map<String, dynamic> rawData =
        await HttpProvider.post(url: '/auth/login', formBody: formBody);
    return rawData;
  }
}
