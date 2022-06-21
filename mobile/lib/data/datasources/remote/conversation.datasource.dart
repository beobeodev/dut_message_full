import 'package:mobile/core/utils/dio/dio_provider.dart';
// import 'package:http/http.dart' as http;

class ConversationRemoteDataSource {
  Future<HttpRequestResponse> getFriendConversations() async {
    return await DioProvider.get(
      url: '/conversation',
    );
  }

  Future<HttpRequestResponse> getRoomConversations() async {
    return await DioProvider.get(
      url: '/room',
      // headers: AuthorizationUtil.header,
    );
  }
}
