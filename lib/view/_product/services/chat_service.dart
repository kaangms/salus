import '../../../../core/constants/enums/http_request_enum.dart';
import '../../../../core/init/network/INetworkService.dart';
import '../../_product/enum/network_route_enum.dart';
import '../model/chat_detail_result.dart';
import '../model/chat_result.dart';
import 'IChatService.dart';

class ChatService extends IChatService {
  ChatService(INetworkManager manager) : super(manager);

  @override
  Future<List<ChatResult>> fetchChatList() async {
    final response = await manager.send<ChatResult, List<ChatResult>>(
      NetworkRoutes.CHAT.rawValue,
      parseModel: ChatResult(),
      method: RequestTypes.GET,
    );
    return response.data ?? <ChatResult>[];
  }

  @override
  Future<ChatResult?> updateChat(ChatResult chatResult) async {
    final response = await manager.send<ChatResult, ChatResult>(
      NetworkRoutes.CHAT.rawValue + '/${chatResult.id}',
      parseModel: ChatResult(),
      method: RequestTypes.PUT,
      data: chatResult,
    );

    return response.data;
  }

  @override
  Future<List<ChatDetailResult>> fetchChatDetailList(String messageId) async {
    final response = await manager.send<ChatDetailResult, List<ChatDetailResult>>(
      NetworkRoutes.CHAT_DETAIL.rawValue,
      parseModel: ChatDetailResult(),
      method: RequestTypes.GET,
      queryParameters: {'messageId': messageId},
    );
    return response.data ?? <ChatDetailResult>[];
  }

  @override
  Future<ChatDetailResult?> postChatDetail(ChatDetailResult chatDetailResult) async {
    final response = await manager.send<ChatDetailResult, ChatDetailResult>(
      NetworkRoutes.CHAT_DETAIL.rawValue,
      parseModel: ChatDetailResult(),
      method: RequestTypes.POST,
      data: chatDetailResult,
    );
    return response.data;
  }
}
