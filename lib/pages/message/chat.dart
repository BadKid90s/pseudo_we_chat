import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pseudo_we_chat/api/interface/message/model/message_info.dart';
import 'package:pseudo_we_chat/widget/we_chat_chat_box.dart';
import 'package:styled_widget/styled_widget.dart';

class ChatController extends GetxController {
  final isKeyboardModel = false.obs;
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
        TextField(
          maxLines: 3, //最多多少行
          minLines: 1, //最少多少行
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
    return SingleChildScrollView(
      child: Flex(
        direction: Axis.vertical,
        children: const [
          WeChatChatBox(
            text: "你好啊",
            avatar: 'https://www.itying.com/images/flutter/3.png',
          ),
          Center(
            child: Text("12:30"),
          ),
          WeChatChatBox(
            text: "干嘛",
            avatar: 'https://www.itying.com/images/flutter/3.png',
          ),
          WeChatChatBox(
            text: "你干什嘛",
            avatar: 'https://www.itying.com/images/flutter/1.png',
            isLeft: false,
          ),
        ],
      ),
    ).paddingSymmetric(horizontal: 10);
  }
}
