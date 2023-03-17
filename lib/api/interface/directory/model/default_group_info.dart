import 'package:json_annotation/json_annotation.dart';

part 'default_group_info.g.dart';

/// 默认分组对象
@JsonSerializable()
class DefaultGroupInfo {
  /// 头像url
  String avatar;

  /// 名称
  String nameChina;

  String nameEnglish;

  DefaultGroupInfo(this.avatar, this.nameChina, this.nameEnglish);

  factory DefaultGroupInfo.fromJson(Map<String, dynamic> json) =>
      _$DefaultGroupInfoFromJson(json);

  Map<String, dynamic> toJson() => _$DefaultGroupInfoToJson(this);
}
