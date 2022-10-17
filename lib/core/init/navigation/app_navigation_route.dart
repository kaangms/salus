import 'package:flutter/material.dart';
import '../../../view/base_home/home_base_view.dart';

import '../../../view/_product/model/chat_result.dart';
import '../../../view/_product/widget/not_found_navigation.dart';
import '../../../view/chat/view/chat_view.dart';
import '../../../view/chat_detail/view/chat_detail_view.dart';

import '../../constants/navigation/navigation_constants.dart';

class AppNavigationRoute {
  AppNavigationRoute._init();
  static final AppNavigationRoute _instance = AppNavigationRoute._init();
  static AppNavigationRoute get instance => _instance;

  Route<dynamic> generateRoute(RouteSettings args) {
    switch (args.name) {
      case NavigationConstants.DEFAULT:
        return normalNavigate(HomeBaseView(pageIndex: args.arguments as int?));
      case NavigationConstants.CHAT:
        return normalNavigate(const ChatView());
      case NavigationConstants.CHAT_DETAIL:
        return normalNavigate(ChatDetailView(chatResult: args.arguments as ChatResult));

      default:
        return MaterialPageRoute(builder: (context) => const NotFoundNavigation());
    }
  }

  Route<dynamic> normalNavigate(Widget widget) {
    return MaterialPageRoute(builder: (context) => widget);
  }
}
