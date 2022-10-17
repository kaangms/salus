import 'dart:io';
import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

import '../../../core/base/view/base_widget.dart';
import '../../../core/extensions/context_extensions.dart';
import '../../../core/init/network/app_network_manager.dart';
import '../../_product/utility/salus_extensions.dart';
import '../../_product/model/chat_result.dart';
import '../../_product/services/chat_service.dart';
import '../../_product/widget/salus_appbar.dart';
import '../../_product/widget/salus_avatar.dart';
import '../../_product/widget/salus_badge.dart';
import '../view_mdeol/chat_detail_view_model.dart';
part './subview/loading_card.dart';
part './subview/message_sender_card.dart';
part './subview/chat_header_card.dart';

class ChatDetailView extends StatelessWidget {
  const ChatDetailView({
    Key? key,
    required this.chatResult,
  }) : super(key: key);
  final ChatResult chatResult;
  @override
  Widget build(BuildContext context) {
    return BaseView<ChatDetailViewModel>(
      viewModel: ChatDetailViewModel(ChatService(AppNetworkManager.instance.networkManager), chatResult),
      onModelReady: (model) {
        model.setContext(context);
        model.init();
        model.fetchChatDetailList();
        model.focusNodeAddListener();
      },
      onDispose: (model) {
        model.focusNodeAddListener();
      },
      onPageBuilder: (context, viewModel) => Scaffold(
        appBar: SalusAppBar(
          context: context,
          hasBackButton: true,
          text: 'Mesajlarım',
        ),
        bottomSheet: buildMessageSenderCard(context, viewModel),
        body: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            buildChatHeaderCard(context),
            buildLoadingCard(viewModel),
            Expanded(
              child: Observer(builder: (context) {
                return buildChatDetailList(context, viewModel);
              }),
            ),
            Platform.isAndroid ? const SizedBox(height: 10) : const SizedBox.shrink(),
            buildMessageSenderCard(context, viewModel)
          ],
        ),
      ),
    );
  }

  Widget buildChatDetailList(BuildContext context, ChatDetailViewModel viewModel) {
    return ListView.builder(
        itemCount: viewModel.chatDetailList.length,
        shrinkWrap: true,
        reverse: true,
        controller: viewModel.messageScrollController,
        itemBuilder: (context, index) {
          return Padding(
            padding: EdgeInsets.only(top: (index == viewModel.chatDetailList.length - 1) ? 10 : 0, bottom: index == 0 ? 0 : 10),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  index == viewModel.chatDetailList.length - 1
                      ? viewModel.chatDetailList[index].createdAt.getDate
                      : viewModel.chatDetailList[index].createdAt.getDate == viewModel.chatDetailList[index + 1].createdAt.getDate
                          ? ''
                          : viewModel.chatDetailList[index].createdAt.getDate,
                  style: TextStyle(
                    color: Colors.black.withOpacity(0.6),
                    fontWeight: FontWeight.w400,
                    fontSize: 10,
                  ),
                ),
                Container(
                  width: context.width,
                  alignment: (viewModel.chatDetailList[index].isUserMessage ?? false) ? Alignment.centerLeft : Alignment.centerRight,
                  child: Padding(
                    padding: EdgeInsets.only(
                      right: (viewModel.chatDetailList[index].isUserMessage ?? false) ? 0 : 18,
                      left: (viewModel.chatDetailList[index].isUserMessage ?? false) ? 18 : 0,
                      top: 8,
                      bottom: 8,
                    ),
                    child: Container(
                      width: context.width - 100,
                      decoration: BoxDecoration(
                        color: (viewModel.chatDetailList[index].isUserMessage ?? false) ? Colors.green[50] : Colors.blue[50],
                        borderRadius: const BorderRadius.all(Radius.circular(8)),
                      ),
                      child: Stack(
                        clipBehavior: Clip.none,
                        children: [
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 15.0, horizontal: 20),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  viewModel.chatDetailList[index].text ?? '',
                                  // maxLines: 3,
                                  // overflow: TextOverflow.ellipsis,
                                  softWrap: true,
                                ),
                              ],
                            ),
                          ),
                          Positioned(
                            right: 3,
                            bottom: -15,
                            child: Text(
                              viewModel.chatDetailList[index].createdAt.getTime,
                              style: TextStyle(
                                color: Colors.black.withOpacity(0.6),
                                fontWeight: FontWeight.w400,
                                fontSize: 10,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          );
        });
  }
}
