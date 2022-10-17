// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'chat_detail_result.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ChatDetailResult _$ChatDetailResultFromJson(Map<String, dynamic> json) =>
    ChatDetailResult(
      createdAt: json['createdAt'] == null
          ? null
          : DateTime.parse(json['createdAt'] as String),
      messageId: json['messageId'] as String?,
      text: json['text'] as String?,
      referanceId: json['referanceId'] as int?,
      isUserMessage: json['isUserMessage'] as bool?,
      id: json['id'] as String?,
    );

Map<String, dynamic> _$ChatDetailResultToJson(ChatDetailResult instance) =>
    <String, dynamic>{
      'createdAt': instance.createdAt?.toIso8601String(),
      'messageId': instance.messageId,
      'text': instance.text,
      'referanceId': instance.referanceId,
      'isUserMessage': instance.isUserMessage,
      'id': instance.id,
    };
