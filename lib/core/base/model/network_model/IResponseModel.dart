// ignore_for_file: file_names

import 'INetworkErrorModel.dart';

abstract class IResponseModel<T> {
  IResponseModel(this.data, this.error);
  T data;
  INetworkErrorModel? error;
}
