import 'package:json_annotation/json_annotation.dart';

import '../../../core/base/model/network_model/INetworkModel.dart';

part 'chat_detail_result.g.dart';

@JsonSerializable()
class ChatDetailResult extends INetworkModel<ChatDetailResult> {
  ChatDetailResult({
    this.createdAt,
    this.messageId,
    this.text,
    this.referanceId,
    this.isUserMessage,
    this.id,
  });

  DateTime? createdAt;
  String? messageId;
  String? text;
  int? referanceId;
  bool? isUserMessage;
  String? id;

  @override
  ChatDetailResult fromJson(Map<String, dynamic> json) {
    return _$ChatDetailResultFromJson(json);
  }

  @override
  Map<String, dynamic>? toJson() {
    return _$ChatDetailResultToJson(this);
  }
}
