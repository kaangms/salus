import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';

import '../../../../core/base/model/base_view_model.dart';
import '../../../core/constants/navigation/navigation_constants.dart';
import '../../_product/model/chat_result.dart';
import '../../_product/services/IChatService.dart';
import '../../_product/utility/salus_extensions.dart';

part 'chat_view_model.g.dart';

class ChatViewModel = _ChatViewModelBase with _$ChatViewModel;

abstract class _ChatViewModelBase with Store, BaseViewModel {
  _ChatViewModelBase(this.service);

  @override
  void setContext(BuildContext context) => this.context = context;
  @override
  void init() {}
  final IChatService service;
  @observable
  List<ChatResult> chatList = <ChatResult>[];
  @observable
  bool initialLoading = true;

  @action
  void _changeInitialLoading() => initialLoading ? initialLoading = false : null;

  Future<void> fetchChatList() async {
    chatList = await service.fetchChatList();
    chatList.sort((a, b) => b.createdAt.dateParse.compareTo(a.createdAt.dateParse));
    if (initialLoading) {
      _changeInitialLoading();
    }
  }

  Future<void> goToChatDetail(ChatResult chatResult) async {
    await navigationService.navigateToPage(
      path: NavigationConstants.CHAT_DETAIL,
      data: chatResult,
      viewModel: this,
    );
  }
}
