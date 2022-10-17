import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';

import '../../../../core/base/model/base_view_model.dart';
import '../../_product/utility/salus_extensions.dart';
import '../../_product/model/chat_detail_result.dart';
import '../../_product/model/chat_result.dart';
import '../../_product/services/IChatService.dart';
import '../../_product/widget/error_message_snack_bar.dart';

part 'chat_detail_view_model.g.dart';

class ChatDetailViewModel = _ChatDetailViewModelBase with _$ChatDetailViewModel;

abstract class _ChatDetailViewModelBase with Store, BaseViewModel {
  _ChatDetailViewModelBase(this._service, this._chatResult);
  @override
  void setContext(BuildContext context) => this.context = context;
  @override
  void init() {
    messageTextController = TextEditingController();
    focusNode = FocusNode();
    messageScrollController = ScrollController();
  }

  late TextEditingController messageTextController;
  late FocusNode focusNode;
  late ScrollController messageScrollController;
  void focusNodeAddListener() {
    focusNode.addListener(() {
      hasFocus = focusNode.hasFocus;
    });
  }

  final ChatResult _chatResult;
  @observable
  bool hasFocus = false;

  final IChatService _service;

  @observable
  List<ChatDetailResult> chatDetailList = <ChatDetailResult>[];

  @observable
  bool initialLoading = true;
  @action
  void _changeInitialLoading() => initialLoading ? initialLoading = false : null;

  Future<void> fetchChatDetailList() async {
    var messageId = _chatResult.id;
    if (messageId != null) {
      chatDetailList = await _service.fetchChatDetailList(messageId);
      if (chatDetailList.isNotEmpty) {
        chatDetailList.sort((a, b) => b.createdAt.dateParse.compareTo(a.createdAt.dateParse));
        _chatResult.unreadMessage = 0;
        _updateChatResultMessage(_chatResult);
      }
    }
    _changeInitialLoading();
  }

  Future<void> postChatMessage(bool isUserMessage) async {
    if (messageTextController.text != '') {
      var chatDetail = ChatDetailResult(
        createdAt: DateTime.now(),
        messageId: _chatResult.id,
        text: messageTextController.text,
        referanceId: _chatResult.referanceId,
        isUserMessage: isUserMessage,
      );
      var result = await _service.postChatDetail(chatDetail);
      if (result != null) {
        _chatResult.lastMessage = messageTextController.text;
        _chatResult.createdAt = DateTime.now();
        messageTextController.text = '';
        _updateChatResultMessage(_chatResult);
        fetchChatDetailList();
      } else {
        ErrorMessageSnackBar().message(context!);
      }
    }
  }

  Future<void> _updateChatResultMessage(ChatResult chatResult) async => _service.updateChat(chatResult);
}
