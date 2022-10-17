// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'chat_result.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ChatResult _$ChatResultFromJson(Map<String, dynamic> json) => ChatResult(
      createdAt: json['createdAt'] == null
          ? null
          : DateTime.parse(json['createdAt'] as String),
      name: json['name'] as String?,
      surname: json['surname'] as String?,
      status: json['status'] as int?,
      isOnline: json['isOnline'] as bool?,
      unreadMessage: json['unreadMessage'] as int?,
      lastMessage: json['lastMessage'] as String?,
      referanceId: json['referanceId'] as int?,
      id: json['id'] as String?,
    );

Map<String, dynamic> _$ChatResultToJson(ChatResult instance) =>
    <String, dynamic>{
      'createdAt': instance.createdAt?.toIso8601String(),
      'name': instance.name,
      'surname': instance.surname,
      'status': instance.status,
      'isOnline': instance.isOnline,
      'unreadMessage': instance.unreadMessage,
      'lastMessage': instance.lastMessage,
      'referanceId': instance.referanceId,
      'id': instance.id,
    };
