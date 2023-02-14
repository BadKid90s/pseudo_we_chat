import 'package:flutter/material.dart';

import '../../constant/style.dart';

class MessagePage extends StatefulWidget {
  const MessagePage({Key? key}) : super(key: key);

  @override
  State<MessagePage> createState() => _MessagePageState();
}

class _MessagePageState extends State<MessagePage> {
  final List<MessageData> _messageList = [
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
          title: const Text(
            "微信",
            style: TextStyle(color: Style.appBarTextColor),
          ),
          backgroundColor: Style.appBarBackgroundColor,
        ),
        body: Container(
          color: Style.contentBackgroundColor,
          child: ListView.builder(
              itemCount: _messageList.length,
              itemBuilder: (BuildContext context, int index) {
                var item = _messageList[index];
                return ListTile(
                  leading: Image.network(
                    item.avatar,
                    width: 50,
                    height: 50,
                    fit: BoxFit.cover,
                  ),
                  title: Text(item.name),
                  subtitle: Text(item.message),
                );
              }),
        ));
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
