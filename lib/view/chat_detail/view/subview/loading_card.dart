part of '../chat_detail_view.dart';

extension _LoadingCard on ChatDetailView {
  Widget buildLoadingCard(ChatDetailViewModel viewModel) {
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
