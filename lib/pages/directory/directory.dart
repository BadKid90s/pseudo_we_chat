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

  final RxList<String> alphabetList = <String>[].obs;
  final selectIndex = 0.obs;

  void initDataList() async {
    var directories = await DirectoryApi.directoryList();
    directoryList(directories);
    var nameList = directories.map((element) => element.name).toList();
    initAlphabetList(nameList);

    var defaultGroupList = await DirectoryApi.defaultGroupList();
    defaultGroupInfoList(defaultGroupList);
  }

  void initAlphabetList(List<String> list) {
    alphabetList.add("🔍");
    alphabetList.addAll(list);
  }

  @override
  void onInit() {
    super.onInit();

    initDataList();
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
    Get.lazyPut(() => DirectoryController());

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
                    const Search(),
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
          style: const TextStyle(fontSize: 14, color: Colors.white70),
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
            color: Colors.white24,
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
