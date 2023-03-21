import 'package:json_annotation/json_annotation.dart';

part 'discover_info.g.dart';

/// 默认分组对象
@JsonSerializable()
class DiscoverInfo {
  /// 头像url
  String avatar;

  /// 名称
  String nameChina;

  String nameEnglish;

  DiscoverInfo(this.avatar, this.nameChina, this.nameEnglish);

  factory DiscoverInfo.fromJson(Map<String, dynamic> json) =>
      _$DiscoverInfoFromJson(json);

  Map<String, dynamic> toJson() => _$DiscoverInfoToJson(this);
}
