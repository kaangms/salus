import 'package:json_annotation/json_annotation.dart';

import '../../../core/base/model/network_model/INetworkModel.dart';

part 'chat_result.g.dart';

@JsonSerializable()
class ChatResult extends INetworkModel<ChatResult> {
  ChatResult({
    this.createdAt,
    this.name,
    this.surname,
    this.status,
    this.isOnline,
    this.unreadMessage,
    this.lastMessage,
    this.referanceId,
    this.id,
  });

  DateTime? createdAt;
  String? name;
  String? surname;
  int? status;
  bool? isOnline;
  int? unreadMessage;
  String? lastMessage;
  int? referanceId;
  String? id;

  @override
  ChatResult fromJson(Map<String, dynamic> json) {
    return _$ChatResultFromJson(json);
  }

  @override
  Map<String, dynamic>? toJson() {
    return _$ChatResultToJson(this);
  }
}
