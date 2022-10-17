part of '../chat_view.dart';

extension _ChatHeaderCard on ChatView {
  Widget buldChatHeadePageCard(BuildContext context) {
    return Container(
      color: context.colors.surface,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 18.0, vertical: 8),
        child: Row(
          children: [
            Expanded(
              flex: 6,
              child: Padding(
                padding: const EdgeInsets.only(right: 8.0),
                child: Container(
                  alignment: Alignment.center,
                  height: 40,
                  decoration: BoxDecoration(
                    color: context.colors.primaryContainer,
                    borderRadius: const BorderRadius.all(Radius.circular(8)),
                  ),
                  child: const Text(
                    'Danışanlar',
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w700,
                      color: Colors.white,
                      letterSpacing: 0.1,
                      fontFamily: 'NunitoSans',
                    ),
                  ),
                ),
              ),
            ),
            Expanded(
              flex: 6,
              child: Padding(
                padding: const EdgeInsets.only(left: 8.0),
                child: Container(
                    alignment: Alignment.center,
                    height: 40,
                    decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.all(Radius.circular(8)),
                    ),
                    child: Text(
                      'Profesyoneller',
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w700,
                        color: context.colors.secondary,
                        letterSpacing: 0.1,
                        fontFamily: 'NunitoSans',
                      ),
                    )),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
