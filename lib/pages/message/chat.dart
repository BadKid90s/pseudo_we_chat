import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:pseudo_we_chat/api/interface/message/model/message_info.dart';
import 'package:pseudo_we_chat/widget/we_chat_chat_box.dart';
import 'package:styled_widget/styled_widget.dart';

class ChatInfo {
  String message;
  String avatar;
  bool isSelf;

  ChatInfo(this.message, this.avatar, this.isSelf);
}

class ChatController extends GetxController {
  final isKeyboardModel = false.obs;
  static const String selfAvatar =
      "https://www.itying.com/images/flutter/3.png";
  static const String otherAvatar =
      "https://www.itying.com/images/flutter/1.png";

  Map<Duration, RxList<ChatInfo>> chatMap = <Duration, RxList<ChatInfo>>{
    const Duration(hours: 12, minutes: 30): [
      ChatInfo("你好啊", otherAvatar, false),
      ChatInfo("干嘛", selfAvatar, true),
      ChatInfo("你在干什么", otherAvatar, false),
      ChatInfo("有事吗", selfAvatar, true),
    ].obs
  }.obs;

  final ScrollController _scrollController = ScrollController();

  void scrollBottom(){
    _scrollController.animateTo(
      _scrollController.position.maxScrollExtent,
      duration: const Duration(milliseconds: 500),
      curve: Curves.easeOut,
    );
  }

  final TextEditingController _textEditingController = TextEditingController();
  final FocusNode _textFieldFocusNode = FocusNode();

  void addChatMessage(String text) {
    var now = DateTime.now();
    var time = Duration(hours: now.hour, minutes: now.minute);
    var chatInfo = ChatInfo(text, selfAvatar, true);
    if (chatMap.containsKey(time)) {
      chatMap[time]!.add(chatInfo);
    } else {
      chatMap[time] = [chatInfo].obs;
    }
    _textEditingController.clear();
    scrollBottom();
  }
}

class ChatPage extends GetView<ChatController> {
  const ChatPage({super.key});

  @override
  Widget build(BuildContext context) {
    MessageInfo messageInfo = Get.arguments;
    return Obx(
      () => Scaffold(
        appBar: AppBar(
          title: Text(messageInfo.name),
        ),
        body: Column(
          children: [
            Expanded(
              child: _buildContentView(context),
            ),
            _buildBottomView(context),
          ],
        ),
      ),
    );
  }

  Widget _buildBottomItem(BuildContext context) {
    var width = MediaQuery.of(context).size.width * 0.65;
    if (controller.isKeyboardModel.value) {
      return Row(
        children: [
          IconButton(
            onPressed: () {
              controller.isKeyboardModel(false);
            },
            icon: const Icon(Icons.keyboard),
          ),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              elevation: 0,
              backgroundColor: context.theme.primaryColorLight,
              shadowColor: context.theme.primaryColorLight,
              foregroundColor: context.theme.primaryColorLight,
              disabledForegroundColor: Colors.transparent,
              disabledBackgroundColor: Colors.transparent,
            ),
            onPressed: () {},
            child: Text(
              "Hold to talk",
              style: context.textTheme.titleMedium,
            ),
          ).width(width),
        ],
      );
    }
    return Row(
      children: [
        IconButton(
          onPressed: () {
            controller.isKeyboardModel(true);
          },
          icon: const Icon(Icons.volume_up_rounded),
        ),
        RawKeyboardListener(
          focusNode: controller._textFieldFocusNode,
          onKey: (RawKeyEvent event) {
            if (event.isKeyPressed(LogicalKeyboardKey.enter) &&
                event.isControlPressed) {
              //执行操作，例如发送消息或提交表单
              String text = controller._textEditingController.text;
              controller.addChatMessage(text);

            }
          },
          child: TextField(
            maxLines: 3,
            //最多多少行
            minLines: 1,
            //最少多少行
            controller: controller._textEditingController,
            decoration: InputDecoration(
              fillColor: context.theme.primaryColorLight,
              filled: true,
              isCollapsed: true,
              contentPadding:
                  const EdgeInsets.symmetric(horizontal: 5, vertical: 8),
              border: const OutlineInputBorder(
                gapPadding: 2.0,
              ),
            ),
          ).width(width),
        ),
      ],
    );
  }

  Widget _buildBottomView(BuildContext context) {
    return SizedBox(
      // color: context.theme.primaryColor,
      height: 100,
      child: Flex(
        direction: Axis.horizontal,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          _buildBottomItem(context),
          Expanded(
            child: IconButton(
              onPressed: () {},
              icon: const Icon(Icons.mood),
            ),
          ),
          Expanded(
            child: IconButton(
              onPressed: () {},
              icon: const Icon(Icons.add_circle_outline),
            ),
          ),
        ],
      ).padding(bottom: 40),
    );
  }

  Widget _buildContentView(BuildContext context) {
    List<Widget> list = [];
    controller.chatMap.forEach((key, value) {
      list.add(Center(
        child: Text("${key.inHours}:${key.inMinutes}"),
      ));
      var messages = value
          .map(
            (e) => WeChatChatBox(
              text: e.message,
              avatar: e.avatar,
              isLeft: !e.isSelf,
            ),
          )
          .toList();

      list.addAll(messages);
    });
    return SingleChildScrollView(
      controller: controller._scrollController,
      child: Flex(
        direction: Axis.vertical,
        children: list,
      ),
    ).paddingSymmetric(horizontal: 10);
  }
}
