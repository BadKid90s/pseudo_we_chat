import 'package:flutter/material.dart';
import 'package:pseudo_we_chat/constant/style.dart';
import 'package:pseudo_we_chat/ui/font/WeChatFont.dart';

class DiscoverPage extends StatefulWidget {
  const DiscoverPage({Key? key}) : super(key: key);

  @override
  State<DiscoverPage> createState() => _DiscoverPageState();
}

class _DiscoverPageState extends State<DiscoverPage> {
  final List<DiscoverGroupData> _list = const [
    DiscoverGroupData(groupName: "a", list: [
      DiscoverData(name: "朋友圈", icon: "images/friend_circle.png", msgNum: 12)
    ]),
    DiscoverGroupData(groupName: "b", list: [
      DiscoverData(name: "视频号", icon: "images/video.png"),
      DiscoverData(name: "直播", icon: "images/direct_seeding.png"),
    ]),
    DiscoverGroupData(groupName: "c", list: [
      DiscoverData(name: "扫一扫", icon: "images/sweep.png"),
    ]),
    DiscoverGroupData(groupName: "d", list: [
      DiscoverData(name: "搜一搜", icon: "images/search.png"),
    ]),
    DiscoverGroupData(groupName: "e", list: [
      DiscoverData(name: "附近", icon: "images/address.png"),
    ]),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            elevation: 0,
            title: const Text(
              "发现",
              style: TextStyle(color: Style.appBarTextColor),
            ),
            backgroundColor: Style.appBarBackgroundColor),
        body: Container(
          color: Style.scaffoldBackgroundColor,
          child: ListView.builder(
              itemCount: _list.length,
              itemBuilder: (context, index) {
                return GroupView(
                  child: GroupItemView(_list[index].list),
                );
              }),
        ));
  }
}

class GroupView extends StatelessWidget {
  const GroupView({Key? key, this.child}) : super(key: key);
  final Widget? child;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          color: Style.contentBackgroundColor,
          child: child,
        ),
        const SizedBox(height: 20),
      ],
    );
  }
}

class GroupItemView extends StatelessWidget {
  const GroupItemView(
    this.list, {
    Key? key,
    this.child,
  }) : super(key: key);

  final List<DiscoverData> list;
  final Widget? child;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: list
          .asMap()
          .entries
          .map((item) => Column(
                children: [
                  ListTile(
                    leading: Image.asset(
                      item.value.icon,
                      width: 54,
                      height: 54,
                    ),
                    title: GroupItemContentView(item.value),
                    trailing: const Icon(Icons.chevron_right),
                  ),
                  if (item.key != list.length - 1)
                    const Padding(
                      padding: EdgeInsets.only(left: 70),
                      child: Divider(height: 2),
                    )
                ],
              ))
          .toList(),
    );
  }
}

class GroupItemContentView extends StatelessWidget {
  const GroupItemContentView(this.data, {Key? key}) : super(key: key);

  final DiscoverData data;

  @override
  Widget build(BuildContext context) {
    return Row(
      // direction: null,
      children: [
        Expanded(
          flex: 1,
          child: Text(data.name),
        ),
        if (data.msgNum != null)
          Expanded(
            flex: 1,
            child: Align(
              alignment: Alignment.topRight,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [Badge.count(count: data.msgNum!)],
              ),
            ),
          )
      ],
    );
  }
}

class DiscoverGroupData {
  const DiscoverGroupData({required this.groupName, required this.list});

  /// 名称
  final String groupName;

  /// 数据
  final List<DiscoverData> list;
}

class DiscoverData {
  const DiscoverData({required this.name, required this.icon, this.msgNum});

  /// 名称
  final String name;

  /// 图标
  final String icon;

  /// 新消息数量
  final int? msgNum;
}
