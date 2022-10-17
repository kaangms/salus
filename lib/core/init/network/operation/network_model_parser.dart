part of '../network_manager.dart';

extension _CoreServiceExtension on NetworkManager {
  dynamic _getBodyModel(dynamic data) {
    if (data is INetworkModel) {
      return data.toJson();
    } else if (data != null) {
      return jsonEncode(data);
    } else {
      return data;
    }
  }

  R? _parseBody<R, T extends INetworkModel>(dynamic responseBody, T model, Options? options) {
    try {
      if (responseBody is List) {
        return responseBody.map((data) => model.fromJson(data)).cast<T>().toList() as R;
      } else if (responseBody is Map<String, dynamic>) {
        var newModel = model.fromJson(responseBody) as R;

        return newModel;
      } else {
        return EmptyModel(name: responseBody.toString()) as R;
      }
    } catch (e) {
      var errorMessage = 'Parse Error: $e - response body: $responseBody T model: $T , R model: $R ';
      Logger().e(errorMessage);
      return null;
    }
  }
}
