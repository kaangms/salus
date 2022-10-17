import '../../../core/base/model/base_view_model.dart';
import '../../chat/view_model/chat_view_model.dart';

class RouteBackFunction {
  RouteBackFunction._init();
  static final RouteBackFunction _instance = RouteBackFunction._init();
  static RouteBackFunction get instance => _instance;

  void backAndRun(dynamic value, BaseViewModel? viewModel) {
    if (value is bool) {
      if (value) {
        if (viewModel is ChatViewModel) {
          viewModel.fetchChatList();
        }
      }
    }
  }
}
