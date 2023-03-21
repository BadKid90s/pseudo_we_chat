import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:get/get.dart';
import 'package:pseudo_we_chat/api/interface/discover/discover.dart';
import 'package:pseudo_we_chat/api/interface/discover/model/discover_info.dart';
import 'package:pseudo_we_chat/widget/we_chat_group_list_view.dart';
import 'package:pseudo_we_chat/widget/we_chat_list_tile.dart';

class DiscoverController extends GetxController {
  final discoverList = <List<DiscoverInfo>>[].obs;

  @override
  void onInit() {
    super.onInit();

    initDataList();
  }

  void initDataList() async {
    var discovers = await DiscoverApi.discoverList();
    discoverList(discovers);
  }
}

class DiscoverPage extends GetView<DiscoverController> {
  const DiscoverPage({Key? key}) : super(key: key);

  @override
  StatelessElement createElement() {
    Get.lazyPut(() => DiscoverController());

    return super.createElement();
  }

  @override
  Widget build(BuildContext context) {
    var localeName = AppLocalizations.of(context)!.localeName;
    return Scaffold(
      appBar: AppBar(
        title: Text(AppLocalizations.of(context)!.discover_title),
      ),
      backgroundColor: context.theme.appBarTheme.backgroundColor,
      body: SingleChildScrollView(
        child: WeChatGroupListView<DiscoverInfo>(
          data: controller.discoverList,
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
                    const Divider(
                      height: 2,
                    ).paddingOnly(left: 64)
                ],
              ).paddingSymmetric(horizontal: 10),
            );
          },
        ),
      ),
      // ),
    );
  }
}
