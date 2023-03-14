// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'message_info.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MessageInfo _$MessageInfoFromJson(Map<String, dynamic> json) => MessageInfo(
      json['id'] as int,
      json['avatar'] as String,
      json['name'] as String,
      json['lastMessage'] as String,
      json['lastMessageTime'] as String,
      json['unReadNum'] as int,
      json['isMute'] as bool,
    );

Map<String, dynamic> _$MessageInfoToJson(MessageInfo instance) =>
    <String, dynamic>{
      'id': instance.id,
      'avatar': instance.avatar,
      'name': instance.name,
      'lastMessage': instance.lastMessage,
      'lastMessageTime': instance.lastMessageTime,
      'unReadNum': instance.unReadNum,
      'isMute': instance.isMute,
    };
