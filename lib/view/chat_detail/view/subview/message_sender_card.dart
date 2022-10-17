part of '../chat_detail_view.dart';

extension _MessageSenderCard on ChatDetailView {
  Widget buildMessageSenderCard(BuildContext context, ChatDetailViewModel viewModel) {
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
}
