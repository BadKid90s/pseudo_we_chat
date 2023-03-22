import 'package:json_annotation/json_annotation.dart';

part 'home_information.g.dart';

/// 默认分组对象
@JsonSerializable()
class HomeInformation {
  /// 头像url
  String avatar;

  /// 名称
  String nameChina;

  String nameEnglish;

  String router;

  HomeInformation(this.avatar, this.nameChina, this.nameEnglish, this.router);

  factory HomeInformation.fromJson(Map<String, dynamic> json) =>
      _$HomeInformationFromJson(json);

  Map<String, dynamic> toJson() => _$HomeInformationToJson(this);
}
