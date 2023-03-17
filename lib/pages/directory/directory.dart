import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:get/get.dart';
import 'package:pseudo_we_chat/api/interface/directory/directory.dart';
import 'package:pseudo_we_chat/api/interface/directory/model/default_group_info.dart';
import 'package:pseudo_we_chat/api/interface/directory/model/directory_group.dart';
import 'package:pseudo_we_chat/widget/search.dart';
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';
import 'package:sticky_headers/sticky_headers.dart';

//https://pub.dev/packages/scrollable_positioned_list


class DirectoryController extends GetxController {
  final RxList<DirectoryGroup> directoryList = <DirectoryGroup>[].obs;
  final RxList<DefaultGroupInfo> defaultGroupInfoList =
      <DefaultGroupInfo>[].obs;

  void initDataList() {
    DirectoryApi.directoryList().then((value) => directoryList(value));
    DirectoryApi.defaultGroupList()
        .then((value) => defaultGroupInfoList(value));
  }

  @override
  void onInit() {
    super.onInit();

    initDataList();
  }
}

class DirectoryPage extends GetView<DirectoryController> {
  const DirectoryPage({Key? key}) : super(key: key);

  @override
  StatelessElement createElement() {
    Get.lazyPut(() => DirectoryController());
    return super.createElement();
  }

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Scaffold(
          appBar: AppBar(
            title: Text(AppLocalizations.of(context)!.directory_title),
          ),
          body: ScrollablePositionedList.builder(
              itemCount: 2 + controller.directoryList.length,
              itemBuilder: (BuildContext context, int index) {
                if (index == 0) {
                  return const Search();
                }
                if (index == 1) {
                  return _buildDefaultGroupList(context);
                }
                var newIndex = index - 2;
                return _buildDirectory(context, newIndex);
              })),
    );
  }

  Widget _buildDirectory(BuildContext context, int index) {
    var e = controller.directoryList[index];
    return StickyHeader(
      header: Container(
        height: 20.0,
        color: context.theme.appBarTheme.backgroundColor,
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        alignment: Alignment.centerLeft,
        child: Text(
          e.name,
          style: const TextStyle(color: Colors.white),
        ),
      ),
      content: Column(
        children: e.dataList
            .map(
              (item) => ListTile(
                leading: Container(
                  width: 64,
                  height: 64,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    image: DecorationImage(
                      image: NetworkImage(item.avatar),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                title: Text(
                  item.name,
                  style: context.textTheme.titleMedium,
                ),
                subtitle: Text(
                  item.remarks.toString(),
                  style: context.textTheme.bodySmall,
                ),
              ),
            )
            .toList(),
      ),
    );
  }

  Widget _buildDefaultGroupList(BuildContext context) {
    var localeName = AppLocalizations.of(context)!.localeName;
    debugPrint(localeName);
    return Column(
      children: controller.defaultGroupInfoList
          .map(
            (e) => ListTile(
              leading: Container(
                width: 64,
                height: 64,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  image: DecorationImage(
                    image: NetworkImage(e.avatar),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              title: Text(
                localeName == "en" ? e.nameEnglish : e.nameChina,
                style: context.textTheme.titleMedium,
              ),
            ).marginSymmetric(vertical: 5),
          )
          .toList(),
    );
  }
}
