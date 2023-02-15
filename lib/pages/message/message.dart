import 'package:date_format/date_format.dart';
import 'package:flutter/material.dart';

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
        unReadNum: 1),
    MessageData(
        id: BigInt.from(1),
        avatar: "https://www.itying.com/images/flutter/2.png",
        name: "魅力人生",
        message: "今天是个好日子。",
        lastTime: DateTime.now().subtract(const Duration(hours: 1)),
        unReadNum: 66),
    MessageData(
        id: BigInt.from(1),
        avatar: "https://www.itying.com/images/flutter/1.png",
        name: "随访飘逸",
        message: "你好啊",
        lastTime: DateTime.now().subtract(const Duration(hours: 2)),
        unReadNum: 99),
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
        ),
        body: Container(
            color: Style.contentBackgroundColor,
            child: Column(
              children: [
                //聊天列表
                Expanded(
                  flex: 1,
                  child: ListView.builder(
                      itemCount: _messageList.length,
                      itemBuilder: (BuildContext context, int index) {
                        var item = _messageList[index];
                        return Column(
                          children: [
                            //搜索按钮
                            index == 0
                                ? Container(
                                    width: double.infinity,
                                    padding: const EdgeInsets.only(
                                        left: 10, right: 10, top: 5, bottom: 5),
                                    decoration: const BoxDecoration(
                                        color:
                                            Style.messageSearchBackgroundColor),
                                    child: ElevatedButton(
                                      style: ButtonStyle(
                                          elevation:
                                              MaterialStateProperty.all(0),
                                          backgroundColor:
                                              MaterialStateProperty.all(
                                                  Colors.white)),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: const [
                                          Icon(
                                            Icons.search,
                                            color: Colors.grey,
                                          ),
                                          Text(
                                            "搜索",
                                            style: TextStyle(
                                                fontSize: 20,
                                                color: Colors.grey),
                                          )
                                        ],
                                      ),
                                      onPressed: () {},
                                    ),
                                  )
                                : const SizedBox(),
                            Column(
                              children: [
                                ListTile(
                                  //头像
                                  leading: Badge(
                                    label: Text("${item.unReadNum}"),
                                    backgroundColor: Colors.red,
                                    alignment: item.unReadNum < 10
                                        ? AlignmentDirectional(40, -6)
                                        : AlignmentDirectional(30, -6),
                                    child: Image.network(
                                      item.avatar,
                                      width: 50,
                                      height: 50,
                                      fit: BoxFit.cover,
                                    ),
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
                                            formatDate(
                                                item.lastTime, [HH, ':', nn]),
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
                                            fontSize: 16, color: Colors.grey)),
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
