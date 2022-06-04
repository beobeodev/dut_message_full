abstract class IAuthenticationRepository {
  Future<Map<String, dynamic>> login(
    Map<String, dynamic> formBody,
  );
}
