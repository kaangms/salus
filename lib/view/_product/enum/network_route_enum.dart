// ignore_for_file: constant_identifier_names

enum NetworkRoutes { CHAT, CHAT_DETAIL }

extension NetworkRoutesString on NetworkRoutes {
  String get rawValue {
    switch (this) {
      case NetworkRoutes.CHAT:
        return 'message';
      case NetworkRoutes.CHAT_DETAIL:
        return 'messagedetail';
      default:
        throw Exception('Routes not found');
    }
  }
}
