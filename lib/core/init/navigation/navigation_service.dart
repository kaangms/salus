import 'package:flutter/material.dart';

import '../../../view/_product/function/route_back_function.dart';
import '../../base/model/base_view_model.dart';
import 'INavigationService.dart';

class NavigationService implements INavigationService {
  NavigationService._init();
  static final NavigationService _instance = NavigationService._init();
  static NavigationService get instance => _instance;

  GlobalKey<NavigatorState> navigatorKey = GlobalKey();

  // ignore: prefer_function_declarations_over_variables
  final removeAllOldRoutes = (Route<dynamic> route) => false;

  @override
  Future<void> navigateToPage({String? path, Object? data, BaseViewModel? viewModel}) async {
    if (navigatorKey.currentState != null) {
      await navigatorKey.currentState!.pushNamed(path!, arguments: data).then((value) async {
        RouteBackFunction.instance.backAndRun(value, viewModel);
      });
    }
  }

  @override
  Future<void> navigateToPageClear({String? path, Object? data}) async {
    if (navigatorKey.currentState != null) {
      await navigatorKey.currentState!.pushNamedAndRemoveUntil(path!, removeAllOldRoutes, arguments: data);
    }
  }

  @override
  void navigateToPop({bool? status}) {
    bool naviStatus = navigatorKey.currentState?.canPop() ?? false;
    if (naviStatus) {
      navigatorKey.currentState!.pop(status);
    }
  }
}
