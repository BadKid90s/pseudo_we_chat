import 'package:emoji_picker_flutter/emoji_picker_flutter.dart';
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

enum BottomViewType { none, emoji, more }

class ChatController extends GetxController {
  //键盘语音切换
  final isKeyboardModel = false.obs;

  //头像
  static const String selfAvatar =
      "https://www.itying.com/images/flutter/3.png";
  static const String otherAvatar =
      "https://www.itying.com/images/flutter/1.png";

  //消息数据
  Map<Duration, RxList<ChatInfo>> chatMap = <Duration, RxList<ChatInfo>>{
    const Duration(hours: 12, minutes: 30): [
      ChatInfo("你好啊", otherAvatar, false),
      ChatInfo("干嘛", selfAvatar, true),
      ChatInfo("你在干什么", otherAvatar, false),
      ChatInfo("有事吗", selfAvatar, true),
    ].obs
  }.obs;

  //滑动控制器
  final ScrollController _scrollController = ScrollController();

  //滑动到底部
  void scrollBottom() {
    _scrollController.animateTo(
      _scrollController.position.maxScrollExtent,
      duration: const Duration(milliseconds: 500),
      curve: Curves.easeOut,
    );
  }

  //输入框控制器
  final TextEditingController _textEditingController = TextEditingController();
  final FocusNode _textFieldFocusNode = FocusNode();

  //发送消息
  void sendChatMessage() {
    var now = DateTime.now();
    var time = Duration(hours: now.hour, minutes: now.minute);
    var chatInfo =
        ChatInfo(_textEditingController.value.text, selfAvatar, true);
    if (chatMap.containsKey(time)) {
      chatMap[time]!.add(chatInfo);
    } else {
      chatMap[time] = [chatInfo].obs;
    }
    _textEditingController.clear();
    scrollBottom();
  }

  //底部安全区域是否显示
  final isShowSafetyArea = false.obs;

  //底部安全区域显示的内容
  final bottomViewType = BottomViewType.none.obs;

  //底部安全高度
  double get bottomSafetyHeight => isShowSafetyArea.value ? 0 : 20;

  void showSafetyArea(BottomViewType viewType) {
    isShowSafetyArea(true);
    bottomViewType(viewType);
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
            _buildSafetyAreaView(context)
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
              controller.sendChatMessage();
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
    return Container(
      // color: context.theme.primaryColor,
      // height: 100,
      child: Flex(
        direction: Axis.horizontal,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          _buildBottomItem(context),
          Expanded(
            child: IconButton(
              onPressed: () {
                controller.showSafetyArea(BottomViewType.emoji);
              },
              icon: const Icon(Icons.mood),
            ),
          ),
          Expanded(
            child: IconButton(
              onPressed: () {
                controller.showSafetyArea(BottomViewType.more);
              },
              icon: const Icon(Icons.add_circle_outline),
            ),
          ),
        ],
      ).paddingSymmetric(vertical: 10),
    ).marginOnly(bottom: controller.bottomSafetyHeight);
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

  Widget _buildSafetyAreaView(BuildContext context) {
    switch (controller.bottomViewType.value) {
      case BottomViewType.none:
        return const SizedBox();
      case BottomViewType.emoji:
        return _buildEmojiView(context);
      case BottomViewType.more:
        return _buildMoreView(context);
    }
  }

  Widget _buildEmojiView(BuildContext context) {
    return SizedBox(
      height: 250,
      child: EmojiPicker(
        textEditingController: controller._textEditingController,
        // pass here the same [TextEditingController] that is connected to your input field, usually a [TextFormField]
        config: const Config(
          columns: 6,
          verticalSpacing: 0,
          horizontalSpacing: 0,
          gridPadding: EdgeInsets.zero,
          initCategory: Category.RECENT,
          bgColor: Color(0xFFF2F2F2),
          indicatorColor: Colors.green,
          iconColor: Colors.grey,
          iconColorSelected: Colors.blue,
          backspaceColor: Colors.blue,
          skinToneDialogBgColor: Colors.white,
          skinToneIndicatorColor: Colors.grey,
          enableSkinTones: true,
          showRecentsTab: true,
          recentsLimit: 28,
          noRecents: Text(
            'No Resents',
            style: TextStyle(fontSize: 20, color: Colors.black26),
            textAlign: TextAlign.center,
          ),
          // Needs to be const Widget
          loadingIndicator: SizedBox.shrink(),
          // Needs to be const Widget
          tabIndicatorAnimDuration: kTabScrollDuration,
          categoryIcons: CategoryIcons(),
          buttonMode: ButtonMode.MATERIAL,
        ),
      ),
    );
  }

  Widget _buildMoreView(BuildContext context) {
    return const SizedBox(height: 250, child: Wrap());
  }
}
