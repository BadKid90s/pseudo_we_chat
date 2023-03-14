import 'package:pseudo_we_chat/api/http.dart';
import 'package:pseudo_we_chat/api/interface/message/message.dart';

class MessageApiMock {
  static void messageList() {
    Http.instance.dioAdapter.onGet(
      MessageApi.messageListPath,
      (server) => server.reply(
        200,
        {
          "code": 200,
          "message": null,
          "data": [
            {
              "id": 1,
              "avatar": "https://www.itying.com/images/flutter/1.png",
              "name": "阿尔法人间",
              "lastMessage": "[图片]",
              "lastMessageTime": "12:35",
              "unReadNum": 99,
              "isMute": false,
            },
            {
              "id": 2,
              "avatar": "https://www.itying.com/images/flutter/2.png",
              "name": "云淡风轻",
              "lastMessage": "今天是个好日子。",
              "lastMessageTime": "11:35",
              "unReadNum": 10,
              "isMute": true,
            },
            {
              "id": 3,
              "avatar": "https://www.itying.com/images/flutter/3.png",
              "name": "魅力人生",
              "lastMessage": "你好啊",
              "lastMessageTime": "昨天10:20",
              "unReadNum": 10,
              "isMute": false,
            },
            {
              "id": 4,
              "avatar": "https://www.itying.com/images/flutter/4.png",
              "name": "随访飘逸",
              "lastMessage": "今天去欢乐谷",
              "lastMessageTime": "星期六",
              "unReadNum": 10,
              "isMute": true,
            },
            {
              "id": 5,
              "avatar": "https://www.itying.com/images/flutter/5.png",
              "name": "少女🥷",
              "lastMessage": "三里屯有妹子！",
              "lastMessageTime": "3月6日",
              "unReadNum": 10,
              "isMute": true,
            },
            {
              "id": 6,
              "avatar": "https://www.itying.com/images/flutter/1.png",
              "name": "阿尔法人间",
              "lastMessage": "[图片]",
              "lastMessageTime": "3月5日",
              "unReadNum": 10,
              "isMute": false,
            },
            {
              "id": 7,
              "avatar": "https://www.itying.com/images/flutter/2.png",
              "name": "云淡风轻",
              "lastMessage": "今天是个好日子。",
              "lastMessageTime": "3月4日",
              "unReadNum": 10,
              "isMute": false,
            },
            {
              "id": 8,
              "avatar": "https://www.itying.com/images/flutter/3.png",
              "name": "魅力人生",
              "lastMessage": "你好啊",
              "lastMessageTime": "3月3日",
              "unReadNum": 10,
              "isMute": false,
            },
            {
              "id": 9,
              "avatar": "https://www.itying.com/images/flutter/4.png",
              "name": "随访飘逸",
              "lastMessage": "今天去欢乐谷",
              "lastMessageTime": "3月2日",
              "unReadNum": 10,
              "isMute": false,
            },
            {
              "id": 10,
              "avatar": "https://www.itying.com/images/flutter/5.png",
              "name": "少女🥷",
              "lastMessage": "三里屯有妹子！",
              "lastMessageTime": "3月1日",
              "unReadNum": 10,
              "isMute": false,
            },
          ],
        },
      ),
    );
  }
}
