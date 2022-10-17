// ignore_for_file: file_names

import '../../../core/init/network/INetworkService.dart';
import '../model/chat_detail_result.dart';
import '../model/chat_result.dart';

abstract class IChatService {
  IChatService(this.manager);

  final INetworkManager manager;

  Future<List<ChatResult>> fetchChatList();
  Future<List<ChatDetailResult>> fetchChatDetailList(String messageId);
  Future<ChatDetailResult?> postChatDetail(ChatDetailResult chatDetailResult);
  Future<ChatResult?> updateChat(ChatResult chatResult);
}
