import 'package:flutter/cupertino.dart';

import '../../init/navigation/navigation_service.dart';
import '../../init/network/app_network_manager.dart';

abstract class BaseViewModel {
  BuildContext? context;
  AppNetworkManager appNetworkManager = AppNetworkManager.instance;
  NavigationService navigationService = NavigationService.instance;
  void setContext(BuildContext context);
  void init();
}
