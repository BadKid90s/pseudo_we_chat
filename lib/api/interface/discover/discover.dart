import 'package:pseudo_we_chat/api/http.dart';
import 'package:pseudo_we_chat/api/interface/discover/model/discover_info.dart';

class DiscoverApi {
  static const String discoverListPath = "/discover/list";

  /// 发现页列表
  static Future<List<List<DiscoverInfo>>> discoverList() async {
    var result = await Http.instance.dio.get(
      discoverListPath,
      queryParameters: {},
    );
    return (result.data as List<dynamic>)
        .map((element) => (element as List<dynamic>)
            .map((e) => DiscoverInfo.fromJson(e as Map<String, dynamic>))
            .toList())
        .toList();
  }
}
