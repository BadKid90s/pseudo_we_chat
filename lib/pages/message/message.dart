import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pseudo_we_chat/api/interface/message/message.dart';
import 'package:pseudo_we_chat/api/interface/message/model/message_info.dart';
import 'package:pseudo_we_chat/router.dart';
import 'package:pseudo_we_chat/widget/we_chat_list_tile.dart';
import 'package:pseudo_we_chat/widget/we_chat_search.dart';
import 'package:styled_widget/styled_widget.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../../events/navbar/navbar_change_listen.dart';

class MessageController extends GetxController {
  final RxList<MessageInfo> messageList = <MessageInfo>[].obs;

  late StreamSubscription navbarChangeSubscription;

  void initData() {
    messageList.clear();
    MessageApi.messageList().then((value) => messageList(value));
  }

  @override
  void onInit() {
    super.onInit();
    initData();
    navbarChangeSubscription = NavbarChangeListen.getMessageData(initData);
  }

  @override
  void onClose() {
    navbarChangeSubscription.cancel();
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
          appBar: _buildAppBar(context),
          // backgroundColor: context.theme.primaryColor,
          body: ListView.separated(
            itemCount: controller.messageList.length + 1,
            //列表项构造器
            itemBuilder: (BuildContext context, int index) {
              if (index == 0) {
                return const WeChatSearch();
              }
              var item = controller.messageList[index - 1];
              return _buildItem(context, item);
            },
            //分割器构造器
            separatorBuilder: (BuildContext context, int index) {
              if (index == 0) {
                return const SizedBox.shrink();
              }
              return Container(
                color: context.theme.primaryColor,
                child: const Divider(
                  height: 2,
                  thickness: 1,
                ).padding(left: 80),
              );
            },
          )),
    );
  }

  AppBar _buildAppBar(BuildContext context) {
    return AppBar(
      title: Text(AppLocalizations.of(context)!.message_title),
      // backgroundColor: Colors.grey,
      actions: [
        PopupMenuButton(
            offset: const Offset(-10, 56),
            itemBuilder: (BuildContext context) {
              return [
                PopupMenuItem(
                  child: Row(
                    children: [
                      const Icon(Icons.people).marginOnly(left: 10),
                      Text(AppLocalizations.of(context)!
                              .message_add_person_title)
                          .marginOnly(left: 20)
                    ],
                  ),
                  onTap: () {},
                ),
                PopupMenuItem(
                  child: Row(
                    children: [
                      const Icon(Icons.person).marginOnly(left: 10),
                      Text(AppLocalizations.of(context)!
                              .message_group_person_title)
                          .marginOnly(left: 20)
                    ],
                  ),
                  onTap: () {},
                ),
                PopupMenuItem(
                  child: Row(
                    children: [
                      const Icon(Icons.qr_code).marginOnly(left: 10),
                      Text(AppLocalizations.of(context)!.message_qr_title)
                          .marginOnly(left: 20)
                    ],
                  ),
                  onTap: () {},
                ),
                PopupMenuItem(
                  child: Row(
                    children: [
                      const Icon(Icons.local_atm).marginOnly(left: 10),
                      Text(AppLocalizations.of(context)!.message_payment_title)
                          .marginOnly(left: 20)
                    ],
                  ),
                  onTap: () {},
                ),
              ];
            })
      ],
    );
  }

  Widget _buildItem(BuildContext context, MessageInfo messageInfo) {
    return InkWell(
      child: WeChatListTile(
        showBadges: true,
        badgeText: messageInfo.isMute
            ? ""
            : messageInfo.unReadNum > 99
                ? "99"
                : messageInfo.unReadNum.toString(),
        avatar: messageInfo.avatar,
        title: Row(
          children: [
            Expanded(
              flex: 18,
              child: Text(
                messageInfo.name,
                style: context.textTheme.titleMedium?.copyWith(fontSize: 18),
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
            Text(
              messageInfo.isMute
                  ? "[${messageInfo.unReadNum}条] ${messageInfo.lastMessage}"
                  : messageInfo.lastMessage,
              style: context.textTheme.bodySmall?.copyWith(fontSize: 16),
            ),
          ],
        ),
        trailingIcon: messageInfo.isMute ? Icons.volume_off : null,
      ),
      onTap: () {
        Get.toNamed(AppRoutes.chat, arguments: messageInfo);
      },
    );
  }
}
