import 'INetworkErrorModel.dart';
import 'INetworkModel.dart';

class ErrorModel<T> implements INetworkErrorModel {
  ErrorModel({this.statusCode, this.description});
  @override
  int? statusCode;

  @override
  String? description;

  @override
  INetworkModel? model;
}
