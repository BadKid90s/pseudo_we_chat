

import 'package:json_annotation/json_annotation.dart';

part 'message_info.g.dart';

@JsonSerializable()
///消息页对象
class MessageInfo {
  /// id
  int id;

  /// 头像url
  String avatar;

  /// 名称
  String name;

  /// 最后一条消息
  String lastMessage;

  /// 最后一条消息时间
  String lastMessageTime;

  /// 未读消息数量
  int unReadNum;

  /// 是否静音
  bool isMute;


  MessageInfo(this.id, this.avatar, this.name, this.lastMessage,
      this.lastMessageTime, this.unReadNum, this.isMute);

  factory MessageInfo.fromJson(Map<String, dynamic> json) => _$MessageInfoFromJson(json);

  Map<String, dynamic> toJson() => _$MessageInfoToJson(this);
}
