import 'package:json_annotation/json_annotation.dart';
import 'package:pseudo_we_chat/api/interface/directory/model/directory_info.dart';

part 'directory_group.g.dart';

/// 消息页对象
@JsonSerializable()
class DirectoryGroup {

  /// 名称
  String name;


  /// 通讯录数据
  List<DirectoryInfo> dataList;


  DirectoryGroup(this.name, this.dataList);

  factory DirectoryGroup.fromJson(Map<String, dynamic> json) =>
      _$DirectoryGroupFromJson(json);

  Map<String, dynamic> toJson() => _$DirectoryGroupToJson(this);
}
