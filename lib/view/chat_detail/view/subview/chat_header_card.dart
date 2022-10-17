part of '../chat_detail_view.dart';

extension _ChatHeaderCard on ChatDetailView {
  Widget buildChatHeaderCard(BuildContext context) {
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
