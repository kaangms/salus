part of '../chat_view.dart';

extension _LoadingCard on ChatView {
  Observer buildLoadingPage(ChatViewModel viewModel) {
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
}
