import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

import '../../../core/base/view/base_widget.dart';
import '../../../core/extensions/context_extensions.dart';
import '../../../core/init/network/app_network_manager.dart';
import '../../_product/model/chat_result.dart';
import '../../_product/services/chat_service.dart';
import '../../_product/utility/salus_extensions.dart';
import '../../_product/widget/salus_appbar.dart';
import '../../_product/widget/salus_avatar.dart';
import '../../_product/widget/salus_badge.dart';
import '../view_model/chat_view_model.dart';
part './subview/loading_card.dart';
part './subview/chat_header_page_card.dart';

class ChatView extends StatelessWidget {
  const ChatView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BaseView<ChatViewModel>(
        viewModel: ChatViewModel(ChatService(AppNetworkManager.instance.networkManager)),
        onModelReady: (model) {
          model.setContext(context);
          model.init();
          model.fetchChatList();
        },
        onPageBuilder: (context, viewModel) => Scaffold(
              appBar: SalusAppBar(
                context: context,
                text: 'Mesajlarım',
              ),
              // bottomNavigationBar: const SalusAppBottomNavigationBar(),
              body: ListView(
                clipBehavior: Clip.none,
                // physics: const ClampingScrollPhysics(),
                shrinkWrap: true,
                children: [
                  buldChatHeadePageCard(context),
                  buildLoadingPage(viewModel),
                  Observer(builder: (_) {
                    return ListView.builder(
                      physics: const NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      itemCount: viewModel.chatList.length,
                      itemBuilder: (context, index) => buildChatCard(
                        context,
                        viewModel,
                        viewModel.chatList[index],
                      ),
                    );
                  }),
                ],
              ),
            ));
  }

  Widget buildChatCard(BuildContext context, ChatViewModel viewModel, ChatResult chatResult) {
    return GestureDetector(
      onTap: () => viewModel.goToChatDetail(chatResult),
      child: Padding(
        padding: const EdgeInsets.only(left: 18.0, right: 10),
        child: Container(
          color: context.colors.primary,
          height: 80,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                flex: 10,
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Expanded(
                      flex: 2,
                      child: SalusAvatar(name: chatResult.name, surname: chatResult.surname, isOnline: chatResult.isOnline),
                    ),
                    Expanded(
                      flex: 10,
                      child: Padding(
                        padding: const EdgeInsets.only(left: 10),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Text(chatResult.referanceId.getRefIdText),
                                const SizedBox(width: 5),
                                SalusBadge(status: chatResult.status),
                              ],
                            ),
                            Text(
                              chatResult.lastMessage.rawMessageValue,
                              maxLines: 1,
                              overflow: TextOverflow.clip,
                              style: TextStyle(color: chatResult.unreadMessage.rawMessageTextColor),
                            )
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                flex: 2,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    if (chatResult.createdAt != null && chatResult.unreadMessage.isHasMessageHour)
                      Text(
                        chatResult.createdAt!.getTime,
                        style: TextStyle(
                          fontSize: 16,
                          color: context.colors.onSurface,
                        ),
                      ),
                    if (chatResult.unreadMessage != 0)
                      Container(
                        decoration: BoxDecoration(
                          color: context.colors.onBackground,
                          borderRadius: const BorderRadius.all(Radius.circular(45)),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(vertical: 4.0, horizontal: 12),
                          child: Text(
                            '${chatResult.unreadMessage}',
                            style: TextStyle(color: context.colors.primary),
                          ),
                        ),
                      ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
