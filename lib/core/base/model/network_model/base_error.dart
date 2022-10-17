import 'INetworkErrorModel.dart';

class BaseError extends INetworkErrorModel {
  BaseError(this.message);
  final String message;
}
