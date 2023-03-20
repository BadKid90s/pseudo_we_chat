import 'package:pseudo_we_chat/api/http.dart';
import 'package:pseudo_we_chat/api/interface/directory/model/default_group_info.dart';
import 'package:pseudo_we_chat/api/interface/directory/model/directory_group.dart';

class DirectoryApi {
  static const String directoryListPath = "/directory/list";
  static const String defaultGroupPath = "/directory/defaultGroup";

  /// 通讯录列表
  static Future<List<DirectoryGroup>> directoryList() async {
    var result = await Http.instance.dio.get(
      directoryListPath,
      queryParameters: {},
    );
    return (result.data as List<dynamic>)
        .map((e) => DirectoryGroup.fromJson(e as Map<String, dynamic>))
        .toList();
  }

  /// 默认分组
  static Future<List<DefaultGroupInfo>> defaultGroupList() async {
    var result = await Http.instance.dio.get(
      defaultGroupPath,
      queryParameters: {},
    );
    return (result.data as List<dynamic>)
        .map((e) => DefaultGroupInfo.fromJson(e as Map<String, dynamic>))
        .toList();
  }
}
