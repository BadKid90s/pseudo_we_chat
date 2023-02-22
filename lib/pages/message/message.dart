import 'package:date_format/date_format.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:pseudo_we_chat/ui/badge_avatar.dart';
import 'package:pseudo_we_chat/ui/font/WeChatFont.dart';
import 'package:pseudo_we_chat/ui/search.dart';
import 'package:pseudo_we_chat/ui/tooltip_shape.dart';

import '../../constant/style.dart';

class MessagePage extends StatefulWidget {
  const MessagePage({Key? key}) : super(key: key);

  @override
  State<MessagePage> createState() => _MessagePageState();
}

class _MessagePageState extends State<MessagePage> {
  //定义列表数据
  final List<MessageData> _messageList = [
    MessageData(
        id: BigInt.from(1),
        avatar:
            "https://d36tnp772eyphs.cloudfront.net/blogs/1/2018/02/Taj-Mahal.jpg",
        name: "张三123",
        message:
            "ZFLEX对UIKit的一层封装，主要包含一个数据驱动的列表框架、和UIKit中常用控件的链式拓展，ZZFLEX相关资料正在整理中，目前已经开源，ZFLEX对UIKit的一层封装，主要包含一个数据驱动的列表框架、和UIKit中常用控件的链式拓展，ZZFLEX相关资料正在整理中，目前已经开源",
        lastTime: DateTime.now(),
        unReadNum: 13),
    MessageData(
        id: BigInt.from(2),
        avatar: "https://www.itying.com/images/flutter/3.png",
        name: "云淡风轻",
        message: "[图片]",
        lastTime: DateTime.now().subtract(const Duration(minutes: 30)),
        unReadNum: 0),
    MessageData(
        id: BigInt.from(1),
        avatar: "https://www.itying.com/images/flutter/2.png",
        name: "魅力人生",
        message: "今天是个好日子。",
        lastTime: DateTime.now().subtract(const Duration(hours: 1)),
        unReadNum: 9),
    MessageData(
        id: BigInt.from(1),
        avatar: "https://www.itying.com/images/flutter/1.png",
        name: "随访飘逸",
        message: "你好啊",
        lastTime: DateTime.now().subtract(const Duration(hours: 2)),
        unReadNum: 66),
    MessageData(
        id: BigInt.from(1),
        avatar:
            "https://d36tnp772eyphs.cloudfront.net/blogs/1/2018/02/Taj-Mahal.jpg",
        name: "张三",
        message: "Hello word!",
        lastTime: DateTime.now(),
        unReadNum: 120),
    MessageData(
        id: BigInt.from(1),
        avatar: "https://www.itying.com/images/flutter/3.png",
        name: "云淡风轻",
        message: "[图片]",
        lastTime: DateTime.now().subtract(const Duration(minutes: 30)),
        unReadNum: 1),
    MessageData(
        id: BigInt.from(1),
        avatar: "https://www.itying.com/images/flutter/2.png",
        name: "魅力人生",
        message: "今天是个好日子。",
        lastTime: DateTime.now().subtract(const Duration(hours: 1)),
        unReadNum: 1),
    MessageData(
        id: BigInt.from(1),
        avatar: "https://www.itying.com/images/flutter/1.png",
        name: "随访飘逸",
        message: "你好啊",
        lastTime: DateTime.now().subtract(const Duration(hours: 2)),
        unReadNum: 1),
    MessageData(
        id: BigInt.from(1),
        avatar:
            "https://d36tnp772eyphs.cloudfront.net/blogs/1/2018/02/Taj-Mahal.jpg",
        name: "张三",
        message: "Hello word!",
        lastTime: DateTime.now(),
        unReadNum: 1),
    MessageData(
        id: BigInt.from(1),
        avatar: "https://www.itying.com/images/flutter/3.png",
        name: "云淡风轻",
        message: "[图片]",
        lastTime: DateTime.now().subtract(const Duration(minutes: 30)),
        unReadNum: 1),
    MessageData(
        id: BigInt.from(1),
        avatar: "https://www.itying.com/images/flutter/2.png",
        name: "魅力人生",
        message: "今天是个好日子。",
        lastTime: DateTime.now().subtract(const Duration(hours: 1)),
        unReadNum: 10),
    MessageData(
        id: BigInt.from(1),
        avatar: "https://www.itying.com/images/flutter/1.png",
        name: "随访飘逸",
        message: "你好啊",
        lastTime: DateTime.now().subtract(const Duration(hours: 2)),
        unReadNum: 1),
    MessageData(
        id: BigInt.from(1),
        avatar:
            "https://d36tnp772eyphs.cloudfront.net/blogs/1/2018/02/Taj-Mahal.jpg",
        name: "张三",
        message: "Hello word!",
        lastTime: DateTime.now(),
        unReadNum: 1),
    MessageData(
        id: BigInt.from(1),
        avatar: "https://www.itying.com/images/flutter/3.png",
        name: "云淡风轻",
        message: "[图片]",
        lastTime: DateTime.now().subtract(const Duration(minutes: 30)),
        unReadNum: 1),
    MessageData(
        id: BigInt.from(1),
        avatar: "https://www.itying.com/images/flutter/2.png",
        name: "魅力人生",
        message: "今天是个好日子。",
        lastTime: DateTime.now().subtract(const Duration(hours: 1)),
        unReadNum: 1),
    MessageData(
        id: BigInt.from(1),
        avatar: "https://www.itying.com/images/flutter/1.png",
        name: "随访飘逸",
        message: "你好啊",
        lastTime: DateTime.now().subtract(const Duration(hours: 2)),
        unReadNum: 1)
  ];

  List<PopupMenuData> popList = const [
    PopupMenuData(name: "发起群聊", icon: WeChatFont.group_chat),
    PopupMenuData(name: "添加朋友", icon: WeChatFont.person_outlined),
    PopupMenuData(name: "扫一扫", icon: WeChatFont.sweep),
    PopupMenuData(name: "收付款", icon: WeChatFont.payment_received),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          elevation: 0,
          title: const Text(
            "微信",
            style: TextStyle(color: Style.appBarTextColor),
          ),
          backgroundColor: Style.appBarBackgroundColor,
          //导航右侧按钮组
          actions: [
            //外部container可以用来调整间距，不放到里面的Container
            //是因为这个margin会增加点击区域，毕竟外面包了一层TextButton一样的东西
            Container(
              margin: const EdgeInsets.only(right: 10),
              //使用 PopupMenuButton 来定义右侧点击弹层功能
              child: PopupMenuButton(
                color: Colors.black87,
                //弹层实物位置，相对于当前组件的偏移
                offset: const Offset(0, 56),
                //我们看到的按钮的信息，组件给其默认添加点击事件
                shape: const TooltipShape(),
                child: Container(
                  width: 40,
                  height: 40,
                  alignment: Alignment.center,
                  child: const Icon(
                    Icons.add,
                    color: Colors.black,
                  ),
                ),
                //返回内部组件信息列表，单行 item 使用 PopupMenuItem
                //使用 .map<PopupMenuItem> 的原因可以动态生成多个 item
                itemBuilder: (BuildContext context) {
                  return popList.map<PopupMenuItem>((item) {
                    return PopupMenuItem(
                      //水平布局，左侧图片，右侧问题，中间间隔使用 Sizebox即可
                      child: Row(
                        children: [
                          Icon(item.icon),
                          const SizedBox(width: 10),
                          Text(item.name,
                              style: const TextStyle(color: Colors.white)),
                        ],
                      ),
                    );
                  }).toList();
                },
              ),
            )
          ],
        ),
        body: Container(
            color: Style.contentBackgroundColor,
            child: Column(
              children: [
                //聊天列表
                Expanded(
                  flex: 1,
                  child: SlidableAutoCloseBehavior(
                    child: ListView.builder(
                        itemCount: _messageList.length,
                        itemBuilder: (BuildContext context, int index) {
                          var item = _messageList[index];
                          return Column(
                            children: [
                              //搜索按钮
                              index == 0
                                  ? const SearchView()
                                  : const SizedBox(),
                              Column(
                                children: [
                                  Slidable(
                                    // Specify a key if the Slidable is dismissible.
                                    key: ValueKey("$index"),
                                    groupTag: "ccc",
                                    // 把所有item归类到一个组, 保证同时只出现一个滑动的效果
                                    // The end action pane is the one at the right or the bottom side.
                                    endActionPane: ActionPane(
                                      extentRatio: 0.7,
                                      dragDismissible: false,
                                      motion: ScrollMotion(),
                                      children: [
                                        item.unReadNum == 0
                                            ? SlidableAction(
                                                // An action can be bigger than the others.
                                                flex: 2,
                                                onPressed:
                                                    (BuildContext context) {},
                                                backgroundColor: Colors.blue,
                                                foregroundColor: Colors.white,
                                                label: '标记未读',
                                              )
                                            : SlidableAction(
                                                // An action can be bigger than the others.
                                                flex: 2,
                                                onPressed:
                                                    (BuildContext context) {},
                                                backgroundColor: Colors.blue,
                                                foregroundColor: Colors.white,
                                                label: '标记已读',
                                              ),
                                        SlidableAction(
                                          flex: 1,
                                          onPressed: (BuildContext context) {},
                                          backgroundColor: Colors.amber,
                                          foregroundColor: Colors.white,
                                          label: '不显示',
                                        ),
                                        SlidableAction(
                                          autoClose: false,
                                          flex: 1,
                                          onPressed: (BuildContext context) {},
                                          backgroundColor: Colors.deepOrange,
                                          foregroundColor: Colors.white,
                                          label: '删除',
                                        ),
                                      ],
                                    ),

                                    // The child of the Slidable is what the user sees when the
                                    // component is not dragged.
                                    child: ListTile(
                                      //头像
                                      leading: BadgeAvatar(
                                        avatar: item.avatar,
                                        num: item.unReadNum,
                                      ),
                                      //名称和时间
                                      title: Row(
                                        children: [
                                          //名称
                                          Expanded(
                                              flex: 17,
                                              child: Text(item.name,
                                                  style: const TextStyle(
                                                      fontSize: 18,
                                                      fontWeight:
                                                          FontWeight.w500))),
                                          //右侧时间
                                          Expanded(
                                              flex: 3,
                                              child: Text(
                                                formatDate(item.lastTime,
                                                    [HH, ':', nn]),
                                                style: const TextStyle(
                                                    fontSize: 12,
                                                    color: Colors.grey),
                                              )),
                                        ],
                                      ),
                                      //消息内容
                                      subtitle: Padding(
                                        padding: const EdgeInsets.only(top: 10),
                                        child: Text(item.message,
                                            overflow: TextOverflow.ellipsis,
                                            maxLines: 1,
                                            style: const TextStyle(
                                                fontSize: 16,
                                                color: Colors.grey)),
                                      ),
                                    ),
                                  ),

                                  //下划线
                                  Padding(
                                    padding: index == _messageList.length - 1
                                        ? const EdgeInsets.only(left: 0)
                                        : const EdgeInsets.only(left: 80),
                                    child: const Divider(),
                                  )
                                ],
                              )
                            ],
                          );
                        }),
                  ),
                ),
              ],
            )));
  }
}

class MessageData {
  const MessageData(
      {required this.id,
      required this.avatar,
      required this.name,
      required this.message,
      required this.unReadNum,
      required this.lastTime});

  /// id
  final BigInt id;

  /// 头像
  final String avatar;

  /// 名称
  final String name;

  /// 消息
  final String message;

  /// 消息未读数量
  final int unReadNum;

  /// 消息时间
  final DateTime lastTime;
}

class PopupMenuData {
  const PopupMenuData({required this.name, required this.icon});

  /// 名称
  final String name;

  /// 图标
  final IconData icon;
}
