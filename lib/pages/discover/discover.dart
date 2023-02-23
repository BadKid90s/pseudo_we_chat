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
      DiscoverData(
          name: "朋友圈", icon: "images/friend_circle.png", isNewMsg: false)
    ]),
    DiscoverGroupData(groupName: "b", list: [
      DiscoverData(name: "视频号", icon: "images/video.png", isNewMsg: true),
      DiscoverData(name: "直播", icon: "images/direct_seeding.png", isNewMsg: true),
    ]),
    DiscoverGroupData(groupName: "c", list: [
      DiscoverData(name: "扫一扫", icon: "images/sweep.png", isNewMsg: false),
    ]),
    DiscoverGroupData(groupName: "d", list: [
      DiscoverData(name: "搜一搜", icon: "images/search.png", isNewMsg: false),
    ]),
    DiscoverGroupData(groupName: "e", list: [
      DiscoverData(name: "附近", icon: "images/address.png", isNewMsg: false),
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
                    leading: Image.asset(item.value.icon,width: 54,height: 54,),
                    title: Text(item.value.name),
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

class DiscoverGroupData {
  const DiscoverGroupData({required this.groupName, required this.list});

  /// 名称
  final String groupName;

  /// 数据
  final List<DiscoverData> list;
}

class DiscoverData {
  const DiscoverData(
      {required this.name, required this.icon, required this.isNewMsg});

  /// 名称
  final String name;

  /// 图标
  final String icon;

  /// 是否有新消息
  final bool isNewMsg;
}
