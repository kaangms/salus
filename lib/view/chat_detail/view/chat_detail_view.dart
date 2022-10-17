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
        bottomSheet: messageTextFormField(context, viewModel),
        body: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            buildChatCard(context),
            buildLoadingPage(viewModel),
            Expanded(
              child: Observer(builder: (context) {
                return buildChatDetail(context, viewModel);
              }),
            ),
            Platform.isAndroid ? const SizedBox(height: 10) : const SizedBox.shrink(),
            messageTextFormField(context, viewModel)
          ],
        ),
      ),
    );
  }

  Observer buildLoadingPage(ChatDetailViewModel viewModel) {
    return Observer(
        builder: (_) => viewModel.initialLoading
            ? Column(
                children: const [
                  SizedBox(
                    height: 30,
                  ),
                  CircularProgressIndicator.adaptive(
                    strokeWidth: 2,
                  ),
                ],
              )
            : const SizedBox.shrink());
  }

  Widget messageTextFormField(BuildContext context, ChatDetailViewModel viewModel) {
    return Observer(builder: (_) {
      viewModel.hasFocus;
      return Padding(
        padding: EdgeInsets.only(top: 8.0, left: 16, bottom: viewModel.hasFocus ? 8 : 20),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Expanded(
              flex: 13,
              child: TextFormField(
                enableInteractiveSelection: true,
                keyboardType: TextInputType.text,
                maxLines: 5,
                minLines: 1,
                focusNode: viewModel.focusNode,
                controller: viewModel.messageTextController,
                decoration: InputDecoration(
                  filled: true,
                  contentPadding: const EdgeInsets.only(left: 20, top: 20, right: 20),
                  // fillColor: Colors.blue.shade100,//iç rengi
                  hoverColor: Colors.white,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(24),
                  ),
                  focusedBorder: const OutlineInputBorder(
                    borderSide: BorderSide(color: Color(0xfff1f1f1), width: 1.0),
                    borderRadius: BorderRadius.all(Radius.circular(24.0)),
                  ),
                  enabledBorder: const OutlineInputBorder(
                    borderSide: BorderSide(color: Color(0xfff1f1f1), width: 1.0),
                    borderRadius: BorderRadius.all(Radius.circular(24.0)),
                  ),
                  hintText: 'Mesajınız...',
                ),
              ),
            ),
            Expanded(
              flex: 2,
              child: GestureDetector(
                onTap: () => viewModel.postChatMessage(false),
                onDoubleTap: () => viewModel.postChatMessage(true),
                child: Padding(
                  padding: const EdgeInsets.only(left: 8.0, right: 8, bottom: 4),
                  child: Transform.rotate(
                    angle: -math.pi / 4,
                    child: const CircleAvatar(
                      radius: 20.0,
                      child: Icon(
                        Icons.send,
                        size: 20,
                      ),
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      );
    });
  }

  Widget buildChatDetail(BuildContext context, ChatDetailViewModel viewModel) {
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

  Widget buildChatCard(BuildContext context) {
    return Container(
      height: 80,
      decoration: BoxDecoration(
        color: context.colors.secondaryContainer,
      ),
      child: Padding(
        padding: const EdgeInsets.only(left: 18.0, right: 10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                SalusAvatar(name: chatResult.name, surname: chatResult.surname, isOnline: false),
                const SizedBox(width: 10),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(chatResult.referanceId.getRefIdText),
                    Row(
                      children: [
                        Container(
                          height: 10,
                          width: 10,
                          decoration: BoxDecoration(
                            color: chatResult.isOnline.getColorForOnlineStatus,
                            borderRadius: const BorderRadius.all(Radius.circular(25)),
                          ),
                        ),
                        const SizedBox(width: 5),
                        Text(chatResult.isOnline.getTextForOnlineStatus)
                      ],
                    ),
                  ],
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(top: 18.0),
              child: SalusBadge(status: chatResult.status),
            ),
          ],
        ),
      ),
    );
  }
}
