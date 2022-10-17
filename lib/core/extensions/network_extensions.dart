import '../constants/enums/http_request_enum.dart';

extension NetworkTypeExtension on RequestTypes {
  /// [RequestType] convert to string value.
  String get stringValue {
    switch (this) {
      case RequestTypes.GET:
        return 'GET';
      case RequestTypes.POST:
        return 'POST';
      case RequestTypes.DELETE:
        return 'DELETE';
      case RequestTypes.PUT:
        return 'PUT';
      default:
        throw 'Method Not Found';
    }
  }
}
