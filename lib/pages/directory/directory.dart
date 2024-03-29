import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:get/get.dart';
import 'package:pseudo_we_chat/api/interface/directory/directory.dart';
import 'package:pseudo_we_chat/api/interface/directory/model/default_group_info.dart';
import 'package:pseudo_we_chat/api/interface/directory/model/directory_group.dart';
import 'package:pseudo_we_chat/events/navbar/navbar_change_listen.dart';
import 'package:pseudo_we_chat/widget/we_chat_list_tile.dart';
import 'package:pseudo_we_chat/widget/we_chat_search.dart';
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';
import 'package:sticky_headers/sticky_headers.dart';
import 'package:styled_widget/styled_widget.dart';

//https://pub.dev/packages/scrollable_positioned_list

class DirectoryController extends GetxController {
  final RxList<DirectoryGroup> directoryList = <DirectoryGroup>[].obs;
  final RxList<DefaultGroupInfo> defaultGroupInfoList =
      <DefaultGroupInfo>[].obs;

  final RxList<String> alphabetList = <String>[].obs;
  final selectIndex = 0.obs;

  late StreamSubscription navbarChangeSubscription;

  void initData() async {
    var directories = await DirectoryApi.directoryList();
    directoryList.clear();
    directoryList(directories);
    var nameList = directories.map((element) => element.name).toList();
    initAlphabetList(nameList);

    var defaultGroupList = await DirectoryApi.defaultGroupList();
    defaultGroupInfoList(defaultGroupList);
  }

  void initAlphabetList(List<String> list) {
    alphabetList.clear();
    alphabetList.add("🔍");
    alphabetList.addAll(list);
  }


  @override
  void onInit() {
    super.onInit();
    navbarChangeSubscription = NavbarChangeListen.getDirectoryData(initData);
  }

  @override
  void onClose() {
    navbarChangeSubscription.cancel();
  }
}

class DirectoryPage extends GetView<DirectoryController> {
  const DirectoryPage({Key? key}) : super(key: key);
  static final ItemPositionsListener _itemPositionsListener =
      ItemPositionsListener.create();

  static final ItemScrollController _itemScrollController =
      ItemScrollController();

  @override
  StatelessElement createElement() {
    Get.put(DirectoryController());

    _itemPositionsListener.itemPositions.addListener(() {
      var position = _itemPositionsListener.itemPositions.value.first;
      controller.selectIndex(position.index);
    });

    return super.createElement();
  }

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Scaffold(
        appBar: AppBar(
          title: Text(AppLocalizations.of(context)!.directory_title),
        ),
        body: AlphabetWidget(
          alphabetList: controller.alphabetList,
          selectIndex: controller.selectIndex.value,
          callback: (index) {
            _itemScrollController.scrollTo(
                index: index,
                duration: const Duration(milliseconds: 10),
                curve: Curves.easeInOutCubic);
          },
          child: ScrollablePositionedList.builder(
            itemCount: 1 + controller.directoryList.length,
            itemBuilder: (BuildContext context, int index) {
              if (index == 0) {
                return Column(
                  children: [
                    const WeChatSearch(),
                    _buildDefaultGroupList(context),
                  ],
                );
              }
              var newIndex = index - 1;
              return _buildDirectory(context, newIndex);
            },
            itemScrollController: _itemScrollController,
            itemPositionsListener: _itemPositionsListener,
          ),
        ),
      ),
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
          style: context.textTheme.titleMedium,
        ),
      ),
      content: Column(
        children: e.dataList.asMap().entries.mapMany(
          (element) {
            var index = element.key;
            var item = element.value;
            var weChatListTile = WeChatListTile(
              avatar: item.avatar,
              title: Text(
                item.name,
                style: context.textTheme.titleMedium,
              ),
              subtitle: Text(
                item.remarks.toString(),
                style: context.textTheme.bodySmall,
              ),
            );
            if (index == e.dataList.length - 1) {
              return [weChatListTile];
            }
            var spec = Container(
              color: context.theme.primaryColor,
              child: const Divider(
                height: 2,
                thickness: 1,
              ).padding(left: 80),
            );
            return [weChatListTile, spec];
          },
        ).toList(),
      ),
    );
  }

  Widget _buildDefaultGroupList(BuildContext context) {
    var localeName = AppLocalizations.of(context)!.localeName;
    return Column(
      children: controller.defaultGroupInfoList
          .map(
            (e) => WeChatListTile(
              avatar: e.avatar,
              title: Text(
                localeName == "en" ? e.nameEnglish : e.nameChina,
                style: context.textTheme.titleMedium,
              ),
            ),
          )
          .toList(),
    );
  }
}

typedef IndexCallback = void Function(int index);

class AlphabetWidget extends StatefulWidget {
  const AlphabetWidget({
    Key? key,
    required this.alphabetList,
    required this.selectIndex,
    required this.callback,
    this.child,
  }) : super(key: key);
  final List<String> alphabetList;
  final IndexCallback callback;
  final Widget? child;
  final int selectIndex;

  @override
  State<AlphabetWidget> createState() => _AlphabetWidgetState();
}

class _AlphabetWidgetState extends State<AlphabetWidget> {
  double x = 0;
  double y = 0;
  int _selectedIndex = 0;
  List<OverlayEntry> list = [];

  @override
  void initState() {
    super.initState();
    _selectedIndex = widget.selectIndex;
  }

  @override
  Widget build(BuildContext context) {
    setState(() {
      _selectedIndex = widget.selectIndex;
    });
    return Stack(
      children: [
        if (widget.child != null) widget.child!,
        Align(
          alignment: Alignment.centerRight,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: _buildView(context),
          ),
        ),
      ],
    );
  }

  List<Widget> _buildView(BuildContext context) {
    return widget.alphabetList
        .asMap()
        .entries
        .map((entry) => _buildItem(context, entry.value, entry.key))
        .toList();
  }

  Widget _buildItem(BuildContext context, String name, int index) {
    return GestureDetector(
      onTap: () {
        closeOverlayEntry();
      },
      onLongPressDown: (detail) {
        setState(() {
          y = detail.globalPosition.dy;
          _selectedIndex = index;
        });
        widget.callback(index);
        showOverlayEntry(name);
      },
      onLongPressUp: () {
        closeOverlayEntry();
      },
      child: Container(
        alignment: Alignment.center,
        // color: Colors.red,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30),
          color: _selectedIndex == index ? Colors.lightGreen : null,
        ),
        width: 30,
        height: 30,
        child: Text(
          name,
          style: context.textTheme.bodyMedium,
        ),
      ),
    );
  }

  void showOverlayEntry(String name) {
    OverlayEntry entry = OverlayEntry(builder: (BuildContext context) {
      return Positioned(
        top: y - 30,
        right: 30,
        child: Container(
          height: 60,
          width: 60,
          decoration: BoxDecoration(
            color: Colors.grey.shade200,
            borderRadius: BorderRadius.circular(60),
          ),
          child: Center(
            child: Text(name, style: context.textTheme.headlineMedium),
          ),
        ),
      );
    });
    Overlay.of(context).insert(entry);
    list.add(entry);
  }

  void closeOverlayEntry() {
    for (var element in list) {
      element.remove();
    }
    list.clear();
  }
}
