import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pseudo_we_chat/api/interface/message/message.dart';
import 'package:pseudo_we_chat/api/interface/message/model/message_info.dart';
import 'package:pseudo_we_chat/widget/search.dart';
import 'package:styled_widget/styled_widget.dart';
import 'package:badges/badges.dart' as badges;

class MessageController extends GetxController {
  final RxList<MessageInfo> messageList = <MessageInfo>[].obs;

  void initMessageList() {
    MessageApi.messageList().then((value) => messageList(value));
  }

  @override
  void onInit() {
    super.onInit();

    initMessageList();
  }
}

class MessagePage extends GetView<MessageController> {
  const MessagePage({Key? key}) : super(key: key);

  @override
  StatelessElement createElement() {
    Get.lazyPut(() => MessageController());
    return super.createElement();
  }

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Scaffold(
        appBar: AppBar(
          title: const Text("微信"),
        ),
        body: ListView.separated(
          itemCount: controller.messageList.length+1,
          //列表项构造器
          itemBuilder: (BuildContext context, int index) {
            if(index==0) {
              return const Search();
            }
            var item = controller.messageList[index-1];
            return _buildItem(context, item);
          },
          //分割器构造器
          separatorBuilder: (BuildContext context, int index) {
            if(index==0) {
              return const SizedBox.shrink();
            }
            return const Divider(
              color: Colors.grey,
            ).padding(left: 86);
          },
        ).paddingSymmetric(horizontal: 10),
      ),
    );
  }

  Widget _buildItem(BuildContext context, MessageInfo messageInfo) {
    return ListTile(
      leading: badges.Badge(
        position: badges.BadgePosition.topEnd(top: -8,end: -6),
        badgeContent: messageInfo.isMute
            ? null
            : Text(
                "${messageInfo.unReadNum}",
                style: const TextStyle(color: Colors.white),
              ),
        showBadge: true,
        child: Container(
          width: 64,
          height: 64,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5),
            image: DecorationImage(
              image: NetworkImage(messageInfo.avatar),
              fit: BoxFit.cover,
            ),
          ),
        ),
      ),
      // Badge(
      //   alignment: AlignmentDirectional.topEnd,
      //   label: SizedBox(width: 64,child: Text("${messageInfo.unReadNum}"),),
      //   child: Container(
      //     width: 64,
      //     height: 64,
      //     decoration: BoxDecoration(
      //       borderRadius: BorderRadius.circular(5),
      //       image: DecorationImage(
      //         image: NetworkImage(messageInfo.avatar),
      //         fit: BoxFit.cover,
      //       ),
      //     ),
      //   ),
      // ),
      contentPadding: EdgeInsets.zero,
      title: Row(
        children: [
          Expanded(
            flex: 18,
            child: Text(
              messageInfo.name,
              style: context.textTheme.titleLarge,
            ),
          ),
          Expanded(
            flex: 6,
            child: Align(
              alignment: Alignment.centerRight,
              child: Text(
                messageInfo.lastMessageTime.toString(),
                style: context.textTheme.bodySmall,
              ),
            ),
          ),
        ],
      ),
      subtitle: Row(
        children: [
          Expanded(
            flex: 22,
            child: Text(
              messageInfo.isMute
                  ? "[${messageInfo.unReadNum}条] ${messageInfo.lastMessage}"
                  : messageInfo.lastMessage,
              style: context.textTheme.bodySmall?.copyWith(fontSize: 16),
            ),
          ),
          if (messageInfo.isMute)
            const Expanded(
              flex: 2,
              child: Icon(
                Icons.volume_off,
              ),
            ),
        ],
      ),
    );
  }
}
