import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:get/get.dart';
import 'package:pseudo_we_chat/api/interface/home/home.dart';
import 'package:pseudo_we_chat/api/interface/home/model/home_information.dart';
import 'package:pseudo_we_chat/api/interface/user/model/user_info.dart';
import 'package:pseudo_we_chat/api/interface/user/user.dart';
import 'package:pseudo_we_chat/events/navbar/navbar_change_listen.dart';
import 'package:pseudo_we_chat/widget/we_chat_group_list_view.dart';
import 'package:pseudo_we_chat/widget/we_chat_list_tile.dart';
import 'package:styled_widget/styled_widget.dart';

class HomeController extends GetxController {
  final userInfo = Rxn<UserInfo>(null);
  final homeInfoList = <List<HomeInformation>>[].obs;

  late StreamSubscription navbarChangeSubscription;

  void initData() async {
    var user = await UserApi.userInfo("111111");
    userInfo.value = user;
    update();

    var homeInfos = await HomeApi.homeList();
    homeInfoList.clear();
    homeInfoList(homeInfos);
  }

  @override
  void onInit() {
    super.onInit();
    navbarChangeSubscription = NavbarChangeListen.getHomeData(initData);
  }

  @override
  void onClose() {
    navbarChangeSubscription.cancel();
  }
}

class HomePage extends GetView<HomeController> {
  const HomePage({super.key});

  @override
  StatelessElement createElement() {
    Get.lazyPut(() => HomeController());
    return super.createElement();
  }

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Scaffold(
        body: CustomScrollView(
          slivers: [
            SliverList(
              delegate: _sliverChildBuilderDelegate(context),
            )
          ],
        ),
      ),
    );
  }

  _sliverChildBuilderDelegate(BuildContext context) {
    var localeName = AppLocalizations.of(context)!.localeName;

    return SliverChildListDelegate([
      Container(
        color: context.theme.primaryColor,
        child: Padding(
          padding: const EdgeInsets.only(top: 80),
          child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
            Expanded(
              flex: 3,
              child: Padding(
                padding: const EdgeInsets.only(
                    top: 20, bottom: 20, left: 10, right: 10),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child: Image.network(
                      controller.userInfo.value?.avatar ??
                          "https://pic2.zhimg.com/v2-639b49f2f6578eabddc458b84eb3c6a1.jpg",
                      width: 144,
                      height: 144),
                ),
              ),
            ),
            Expanded(
                flex: 7,
                child: Padding(
                  padding: const EdgeInsets.only(
                      top: 20, bottom: 20, left: 10, right: 10),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Row(
                        children: [
                          Text(
                            controller.userInfo.value?.name ?? "",
                            style: context.textTheme.titleLarge,
                          )
                        ],
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Row(
                        children: [
                          Expanded(
                              flex: 9,
                              child: Text(
                                "${AppLocalizations.of(context)!.home_wechat_num_title}：${controller.userInfo.value?.weChatNum}",
                                style: context.textTheme.bodySmall
                                    ?.copyWith(fontSize: 16),
                              )),
                          const Expanded(
                            flex: 1,
                            child: Icon(
                              Icons.chevron_right_outlined,
                              color: Colors.grey,
                            ),
                          )
                        ],
                      )
                    ],
                  ),
                )),
          ]),
        ),
      ),
      Container(
        height: 15,
      ),
      WeChatGroupListView(
        data: controller.homeInfoList.value,
        itemBuilder: (BuildContext context, dynamic item, bool isLast) {
          return Container(
            color: context.theme.scaffoldBackgroundColor,
            child: Column(
              children: [
                WeChatListTile(
                  avatar: item.avatar,
                  avatarSize: 46,
                  title: Text(
                      localeName == "en" ? item.nameEnglish : item.nameChina),
                  trailingIcon: Icons.chevron_right_outlined,
                ),
                if (!isLast)
                  Container(
                      color: context.theme.primaryColor,
                      child: const Divider(
                        height: 2,
                        thickness: 1,
                      ).padding(left: 80))
              ],
            ),
          );
        },
      )
    ]);
  }
}
