import 'package:pseudo_we_chat/api/http.dart';
import 'package:pseudo_we_chat/api/interface/home/model/home_information.dart';

class HomeApi {
  static const String homeListPath = "/home/list";

  /// 我的列表
  static Future<List<List<HomeInformation>>> homeList() async {
    var result = await Http.instance.dio.get(
      homeListPath,
      queryParameters: {},
    );
    return (result.data as List<dynamic>)
        .map((element) => (element as List<dynamic>)
            .map((e) => HomeInformation.fromJson(e as Map<String, dynamic>))
            .toList())
        .toList();
  }
}
