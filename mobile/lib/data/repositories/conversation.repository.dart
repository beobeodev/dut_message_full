import 'package:mobile/core/utils/dio/dio_provider.dart';
import 'package:mobile/data/models/conversation.model.dart';
import 'package:mobile/data/models/message.model.dart';
// import 'package:http/http.dart' as http;

class ConversationRepository {
  // late List<ConversationModel> listConversation;
  // late List<ConversationModel> listRoom;
  // late List<ConversationModel> listConversationAndRoom;

  ConversationRepository();

  Future<List<ConversationModel>> getFriendConversations() async {
    final List<dynamic> rawData = await DioProvider.get(
      url: '/conversation',
      // headers: AuthorizationUtil.header,
    );

    final List<ConversationModel> result =
        rawData.map((e) => ConversationModel.fromJson(e)).toList();
    return result;
  }

  Future<List<ConversationModel>> getRoomConversations() async {
    final List<dynamic> rawData = await DioProvider.get(
      url: '/room',
      // headers: AuthorizationUtil.header,
    );

    final List<ConversationModel> result =
        rawData.map((e) => ConversationModel.fromJsonRoom(e)).toList();
    return result;
  }

  Future<List<ConversationModel>> getAllConversations() async {
    final List<ConversationModel> friendConversations =
        await getFriendConversations();
    final List<ConversationModel> roomConversations =
        await getRoomConversations();

    final List<ConversationModel> friendConversationsWithEmptyMessage =
        List.from(
      friendConversations.where((element) => element.messages.isEmpty),
    );

    List<ConversationModel> allConversationTemps = <ConversationModel>[
      ...friendConversations.where((element) => element.messages.isNotEmpty),
      ...roomConversations
    ];

    allConversationTemps.sort((b, a) {
      final MessageModel messagePrevious = a.messages.last;
      final MessageModel messageAfter = b.messages.last;
      return messagePrevious.timeSend.compareTo(messageAfter.timeSend);
    });

    allConversationTemps = [
      ...friendConversationsWithEmptyMessage,
      ...allConversationTemps
    ];

    return allConversationTemps;
  }
}