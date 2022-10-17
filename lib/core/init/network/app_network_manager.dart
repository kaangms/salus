import 'package:dio/dio.dart';

import '../../init/network/INetworkService.dart';
import '../../init/network/network_manager.dart';

class AppNetworkManager {
  AppNetworkManager._init();
  static final AppNetworkManager _instance = AppNetworkManager._init();
  static AppNetworkManager get instance => _instance;

  static const String _baseUrl = 'https://633c9cf0f2b0e623dc6543a4.mockapi.io/api/v1/';

  INetworkManager networkManager = NetworkManager(
      isEnableLogger: true,
      options: BaseOptions(baseUrl: _baseUrl, headers: {
        'Content-Type': 'application/json; charset=UTF-8',
        'Accept': 'application/json',
      }));
}
