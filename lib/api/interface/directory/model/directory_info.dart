import 'package:json_annotation/json_annotation.dart';

part 'directory_info.g.dart';

/// 通讯录对象
@JsonSerializable()
class DirectoryInfo {
  /// id
  int id;

  /// 头像url
  String avatar;

  /// 名称
  String name;

  /// 备注
  String remarks;

  /// 首字母
  String initial;

  DirectoryInfo(this.id, this.avatar, this.name, this.remarks, this.initial);

  factory DirectoryInfo.fromJson(Map<String, dynamic> json) =>
      _$DirectoryInfoFromJson(json);

  Map<String, dynamic> toJson() => _$DirectoryInfoToJson(this);
}
