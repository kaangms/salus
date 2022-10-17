// ignore_for_file: file_names

import 'dart:typed_data';

import 'package:dio/dio.dart';

import '../../base/model/network_model/INetworkModel.dart';
import '../../base/model/network_model/IResponseModel.dart';
import '../../constants/enums/http_request_enum.dart';

abstract class INetworkManager {
  Future<IResponseModel<R?>> send<T extends INetworkModel, R>(
    String path, {
    required T parseModel,
    required RequestTypes method,
    String? urlSuffix,
    Map<String, dynamic>? queryParameters,
    Options? options,
    Duration? expiration,
    CancelToken? cancelToken,
    dynamic data,
    ProgressCallback? onReceiveProgress,
  });

  Interceptors get dioIntercaptors;
  Future<Response<Uint8List?>> downloadFileSimple(String path, ProgressCallback? callback);

  void addBaseHeader(MapEntry<String, String> key);
  void removeHeader(String key);
  void clearHeader();
}
