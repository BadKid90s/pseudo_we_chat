import 'package:get/get.dart';
import 'package:pseudo_we_chat/api/interface/message/model/message_info.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ChatService extends GetxService {
  /// 单例
  static ChatService get instance => Get.find<ChatService>();

  MessageInfo? currentMessageInfo;

}
