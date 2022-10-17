// ignore_for_file: file_names
import 'INetworkModel.dart';

abstract class INetworkErrorModel<T> {
  int? statusCode;
  String? description;
  INetworkModel? model;
}
