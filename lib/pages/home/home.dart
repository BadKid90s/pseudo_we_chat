import 'package:flutter/material.dart';
import 'package:pseudo_we_chat/constant/style.dart';
import 'package:pseudo_we_chat/ui/font/WeChatFont.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final List<HomeGroupData> _list = const [
    HomeGroupData(groupName: "a", list: [
          HomeData(name: "服务", icon: WeChatFont.server)
    ]),
    HomeGroupData(groupName: "b", list: [
      HomeData(name: "收藏", icon: WeChatFont.collection),
      HomeData(name: "朋友圈", icon: WeChatFont.person_outlined),
      HomeData(name: "卡包", icon: WeChatFont.file),
      HomeData(name: "表情", icon: WeChatFont.expression),
    ]),
    HomeGroupData(groupName: "c", list: [
      HomeData(name: "设置", icon: WeChatFont.setting),
    ]),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Style.scaffoldBackgroundColor,
        child: CustomScrollView(
          slivers: [
            SliverList(
              delegate: _mySliverChildBuilderDelegate(),
            )
          ],
        ),
      ),
    );
  }

  _mySliverChildBuilderDelegate() {
    return SliverChildListDelegate([
      Container(
          color: Style.contentBackgroundColor,
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
                              'https://pic2.zhimg.com/v2-639b49f2f6578eabddc458b84eb3c6a1.jpg',
                              width: 120,
                              height: 120)))),
              Expanded(
                  flex: 7,
                  child: Padding(
                    padding: const EdgeInsets.only(
                        top: 20, bottom: 20, left: 10, right: 10),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Row(
                          children: const [
                            Text(
                              "年少轻浮",
                              style: TextStyle(fontSize: 24),
                            )
                          ],
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Row(
                          children: const [
                            Expanded(
                                flex: 7,
                                child: Text("微信号：xxxxxxxx",
                                    style: TextStyle(
                                        fontSize: 18, color: Colors.grey))),
                            Expanded(
                                flex: 3,
                                child: Icon(
                                  Icons.chevron_right_outlined,
                                  color: Colors.grey,
                                ))
                          ],
                        )
                      ],
                    ),
                  )),
            ]),
          )),
      Container(
        height: 15,
        color: Style.scaffoldBackgroundColor,
      ),
      ..._buildList()
    ]);
  }

  List<Widget> _buildList() {
    List<Widget> list = [];
    String groupName = '';
    for (var i = 0; i < _list.length; i++) {
      var item = _list[i];

      if (groupName != "" && groupName != item.groupName) {
        list.add(const SizedBox(
          height: 15,
        ));
        list.addAll(_buildItem(item.list));
      }
      if (groupName == "" || groupName == item.groupName) {
        list.addAll(_buildItem(item.list));
      }
      groupName = item.groupName;
    }
    return list;
  }

  List<Widget> _buildItem(List<HomeData> list) {
    return list
        .map((e) => Container(
              color: Style.contentBackgroundColor,
              height: 70,
              alignment: Alignment.center,
              child: ListTile(
                leading: Icon(e.icon),
                title: Text(e.name),
                  trailing: const Icon(Icons.chevron_right_outlined)
              ),
            ))
        .toList();
  }
}

class HomeGroupData {
  const HomeGroupData({required this.groupName, required this.list});

  /// 名称
  final String groupName;

  /// 数据
  final List<HomeData> list;
}

class HomeData {
  const HomeData({required this.name, required this.icon});

  /// 名称
  final String name;

  /// 图标
  final IconData icon;
}
