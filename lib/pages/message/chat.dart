import 'package:emoji_picker_flutter/emoji_picker_flutter.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:pseudo_we_chat/api/interface/message/model/message_info.dart';
import 'package:pseudo_we_chat/widget/we_chat_chat_box.dart';
import 'package:styled_widget/styled_widget.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:wechat_assets_picker/wechat_assets_picker.dart';
import 'package:wechat_camera_picker/wechat_camera_picker.dart';

class ChatInfo {
  ImageProvider? imageProvider;
  String? message;
  String avatar;
  bool isSelf;

  ChatInfo(
      {this.message,
      this.imageProvider,
      required this.avatar,
      required this.isSelf});
}

class MoreInfo {
  String title;
  IconData iconData;
  VoidCallback onTap;

  MoreInfo({required this.title, required this.iconData, required this.onTap});
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
  Map<String, RxList<ChatInfo>> chatMap = <String, RxList<ChatInfo>>{
    "12.30": [
      ChatInfo(message: "你好啊", avatar: otherAvatar, isSelf: false),
      ChatInfo(message: "干嘛", avatar: selfAvatar, isSelf: true),
      ChatInfo(message: "你在干什么", avatar: otherAvatar, isSelf: false),
      ChatInfo(message: "有事吗", avatar: selfAvatar, isSelf: true),
    ].obs
  }.obs;

  //滑动控制器
  final ScrollController _scrollController = ScrollController();

  //滑动到底部
  void scrollBottom() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _scrollController.animateTo(
        _scrollController.position.maxScrollExtent,
        duration: const Duration(milliseconds: 500),
        curve: Curves.easeOut,
      );
    });
  }

  //输入框控制器
  final TextEditingController _textEditingController = TextEditingController();
  final FocusNode _textFieldFocusNode = FocusNode();

  final textIsEmpty = true.obs;

  //发送消息
  void sendChatMessage() {
    var chatInfo = ChatInfo(
        message: _textEditingController.value.text,
        avatar: selfAvatar,
        isSelf: true);
    addChatInfo(chatInfo);
    _textEditingController.clear();
    scrollBottom();
    textChange();
  }

  void addChatInfo(ChatInfo chatInfo) {
    var now = DateTime.now();
    var time = "${now.hour}:${now.minute}";
    if (chatMap.containsKey(time)) {
      chatMap[time]!.add(chatInfo);
    } else {
      chatMap[time] = [chatInfo].obs;
    }
  }

  void textChange() {
    textIsEmpty.value = _textEditingController.value.text.trim().isEmpty;
  }

  //底部安全区域是否显示
  final isShowSafetyArea = false.obs;

  //底部安全区域显示的内容
  final bottomViewType = BottomViewType.none.obs;

  //底部安全高度
  double get bottomSafetyHeight => isShowSafetyArea.value ? 0 : 20;

  void showSafetyArea(BottomViewType viewType) {
    if (viewType == bottomViewType.value) {
      isShowSafetyArea(false);
      bottomViewType(BottomViewType.none);
    } else {
      bottomViewType(viewType);
      isShowSafetyArea(true);
      scrollBottom();
    }
  }

  void addPhotoChatInfo(List<AssetEntity>? assets) {
    assets?.forEach((element) {
      var chatInfo = ChatInfo(
        imageProvider: AssetEntityImageProvider(element, isOriginal: false),
        avatar: ChatController.selfAvatar,
        isSelf: true,
      );
      addChatInfo(chatInfo);
    });
    scrollBottom();
  }
}

class ChatPage extends GetView<ChatController> {
  const ChatPage({super.key});

  List<MoreInfo> getMoreList(BuildContext context) {
    return [
      MoreInfo(
        title: AppLocalizations.of(context)!.chat_album,
        iconData: Icons.photo_library,
        onTap: () async {
          List<AssetEntity>? assets = await AssetPicker.pickAssets(context);
          controller.addPhotoChatInfo(assets);
        },
      ),
      MoreInfo(
        title: AppLocalizations.of(context)!.chat_camera,
        iconData: Icons.photo_camera,
        onTap: () async {
          AssetEntity? entity = await CameraPicker.pickFromCamera(context);
          if (entity != null) {
            controller.addPhotoChatInfo([entity]);
          }
        },
      ),
      MoreInfo(
        title: AppLocalizations.of(context)!.chat_video_call,
        iconData: Icons.video_call,
        onTap: () {},
      ),
      MoreInfo(
        title: AppLocalizations.of(context)!.chat_location,
        iconData: Icons.location_on,
        onTap: () {},
      ),
      MoreInfo(
        title: AppLocalizations.of(context)!.chat_red_packet,
        iconData: Icons.email,
        onTap: () {},
      ),
      MoreInfo(
        title: AppLocalizations.of(context)!.chat_transfer,
        iconData: Icons.sync_alt,
        onTap: () {},
      ),
      MoreInfo(
        title: AppLocalizations.of(context)!.chat_voice_input,
        iconData: Icons.mic,
        onTap: () {},
      ),
      MoreInfo(
        title: AppLocalizations.of(context)!.chat_favorites,
        iconData: Icons.book,
        onTap: () {},
      ),
      MoreInfo(
        title: AppLocalizations.of(context)!.chat_contact_card,
        iconData: Icons.person,
        onTap: () {},
      ),
      MoreInfo(
        title: AppLocalizations.of(context)!.chat_file,
        iconData: Icons.folder_zip,
        onTap: () {},
      ),
      MoreInfo(
        title: AppLocalizations.of(context)!.chat_coupons,
        iconData: Icons.folder,
        onTap: () {},
      ),
      MoreInfo(
        title: AppLocalizations.of(context)!.chat_music,
        iconData: Icons.music_note,
        onTap: () {},
      ),
    ];
  }

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
              flex: 6,
              child: _buildContentView(context),
            ),
            Expanded(
              flex: 1,
              child: _buildBottomView(context),
            ),
            Visibility(
              visible: controller.isShowSafetyArea.isTrue,
              child: Expanded(
                flex: 4,
                child: _buildSafetyAreaView(context),
              ),
            ),
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
            maxLines: 2,
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
            onChanged: (value) {
              controller.textChange();
            },
          ).width(width),
        ),
      ],
    );
  }

  Widget _buildBottomView(BuildContext context) {
    return Flex(
      direction: Axis.horizontal,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        _buildBottomItem(context),
        Visibility(
          visible: controller.textIsEmpty.isFalse,
          child: Expanded(
            child: TextButton(
              style: OutlinedButton.styleFrom(backgroundColor: Colors.green),
              onPressed: () {
                controller.sendChatMessage();
              },
              child: Text("发送", style: context.textTheme.bodyLarge),
            ).paddingSymmetric(horizontal: 10),
          ),
        ),
        Visibility(
          visible: controller.textIsEmpty.isTrue,
          child: Expanded(
            child: IconButton(
              onPressed: () {
                controller.showSafetyArea(BottomViewType.emoji);
              },
              icon: const Icon(Icons.mood),
            ),
          ),
        ),
        Visibility(
          visible: controller.textIsEmpty.isTrue,
          child: Expanded(
            child: IconButton(
              onPressed: () {
                controller.showSafetyArea(BottomViewType.more);
              },
              icon: const Icon(Icons.add_circle_outline),
            ),
          ),
        ),
      ],
    )
        .paddingSymmetric(vertical: 10)
        .marginOnly(bottom: controller.bottomSafetyHeight);
  }

  Widget _buildContentView(BuildContext context) {
    List<Widget> list = [];
    controller.chatMap.forEach((key, value) {
      list.add(Center(
        child: Text(key),
      ));
      var messages = value
          .map(
            (e) => WeChatChatBox(
              text: e.message,
              image: e.imageProvider,
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
    return EmojiPicker(
      onEmojiSelected: (Category? category, Emoji emoji){
        controller.textChange();
      },
      textEditingController: controller._textEditingController,
      // pass here the same [TextEditingController] that is connected to your input field, usually a [TextFormField]
      config: Config(
        columns: 6,
        verticalSpacing: 0,
        horizontalSpacing: 0,
        gridPadding: EdgeInsets.zero,
        initCategory: Category.RECENT,
        bgColor: context.theme.primaryColor,
        enableSkinTones: true,
        showRecentsTab: true,
        recentsLimit: 28,
        noRecents: const Text(
          'No Resents',
          style: TextStyle(fontSize: 20, color: Colors.black26),
          textAlign: TextAlign.center,
        ),
        // Needs to be const Widget
        loadingIndicator: const SizedBox.shrink(),
        // Needs to be const Widget
        tabIndicatorAnimDuration: kTabScrollDuration,
        categoryIcons: const CategoryIcons(),
        buttonMode: ButtonMode.MATERIAL,

      ),
    );
  }

  Widget _buildMoreView(BuildContext context) {
    var mores = getMoreList(context);
    var length = mores.length;
    var count = 8;
    var page =
        (length % count == 0 ? length / count : length / count + 1).toInt();

    List<Widget> list = [];
    for (var i = 0; i < page; i++) {
      var endIndex = (i + 1) * count > length ? length : (i + 1) * count;
      var map = mores.sublist(i * count, endIndex);
      list.add(GridView.count(
        scrollDirection: Axis.vertical,
        crossAxisCount: 4,
        //设置主轴间距
        mainAxisSpacing: 10,
        children: map
            .map(
              (e) => _buildMoreItem(context, e),
            )
            .toList(),
      ));
    }

    return PageView(
      children: list,
    );
  }

  Widget _buildMoreItem(BuildContext context, MoreInfo moreInfo) {
    var padding = MediaQuery.of(context).size.width * 0.06;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: GestureDetector(
        onTap: moreInfo.onTap,
        child: Column(
          children: [
            Container(
              decoration: BoxDecoration(
                color: context.theme.primaryColor,
                borderRadius: const BorderRadius.all(Radius.circular(10)),
              ),
              child: Padding(
                padding: EdgeInsets.all(padding),
                child: Icon(
                  moreInfo.iconData,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 3),
              child: Text(moreInfo.title),
            )
          ],
        ),
      ),
    );
  }
}
