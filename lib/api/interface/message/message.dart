import 'package:pseudo_we_chat/api/http.dart';
import 'package:pseudo_we_chat/api/interface/message/model/message_info.dart';

class MessageApi {
  static const String messageListPath = "/message/list";

  /// 消息列表
  static Future<List<MessageInfo>> messageList() async {
    var result = await Http.instance.dio.get(
      messageListPath,
      queryParameters: {},
    );
    return (result.data as List<dynamic>)
        .map((e) => MessageInfo.fromJson(e as Map<String, dynamic>))
        .toList();
  }
}
