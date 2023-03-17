import 'package:pseudo_we_chat/api/http.dart';
import 'package:pseudo_we_chat/api/interface/directory/directory.dart';

class DirectoryApiMock {
  static void directoryList() {
    Http.instance.dioAdapter.onGet(
      DirectoryApi.directoryListPath,
      (server) => server.reply(
        200,
        {
          "code": 200,
          "message": null,
          "data": [
            {
              "name": "A",
              "dataList": [
                {
                  "id": 11,
                  "avatar": "https://www.itying.com/images/flutter/3.png",
                  "name": "阿尔法人间",
                  "remarks": "",
                  "initial": "A",
                },
                {
                  "id": 12,
                  "avatar": "https://www.itying.com/images/flutter/1.png",
                  "name": "阿里巴巴",
                  "remarks": "",
                  "initial": "A",
                },
                {
                  "id": 13,
                  "avatar": "https://www.itying.com/images/flutter/2.png",
                  "name": "阿尔法人间2",
                  "remarks": "",
                  "initial": "A",
                },
                {
                  "id": 14,
                  "avatar": "https://www.itying.com/images/flutter/3.png",
                  "name": "阿里巴巴3",
                  "remarks": "",
                  "initial": "A",
                },
              ],
            },
            {
              "name": "C",
              "dataList": [
                {
                  "id": 21,
                  "avatar": "https://www.itying.com/images/flutter/1.png",
                  "name": "称孤道寡1",
                  "remarks": "",
                  "initial": "C",
                },
                {
                  "id": 22,
                  "avatar": "https://www.itying.com/images/flutter/2.png",
                  "name": "称孤道寡2",
                  "remarks": "",
                  "initial": "C",
                },
                {
                  "id": 23,
                  "avatar": "https://www.itying.com/images/flutter/3.png",
                  "name": "称孤道寡3",
                  "remarks": "",
                  "initial": "C",
                },
              ],
            },
            {
              "name": "#",
              "dataList": [
                {
                  "id": 31,
                  "avatar": "https://www.itying.com/images/flutter/4.png",
                  "name": "🌛",
                  "remarks": "",
                  "initial": "#",
                },
                {
                  "id": 32,
                  "avatar": "https://www.itying.com/images/flutter/3.png",
                  "name": "❤️",
                  "remarks": "",
                  "initial": "#",
                },
                {
                  "id": 33,
                  "avatar": "https://www.itying.com/images/flutter/2.png",
                  "name": "🌟",
                  "remarks": "",
                  "initial": "#",
                },
                {
                  "id": 33,
                  "avatar": "https://www.itying.com/images/flutter/1.png",
                  "name": "🌞",
                  "remarks": "",
                  "initial": "#",
                },
              ],
            },
          ],
        },
      ),
    );
  }

  static void defaultGroupList() {
    Http.instance.dioAdapter.onGet(
      DirectoryApi.defaultGroupPath,
      (server) => server.reply(
        200,
        {
          "code": 200,
          "message": null,
          "data": [
            {
              "avatar": "https://www.itying.com/images/flutter/3.png",
              "nameChina": "新朋友",
              "nameEnglish": "New Friends",
            },
            {
              "avatar": "https://www.itying.com/images/flutter/3.png",
              "nameChina": "群聊",
              "nameEnglish": "Group Chats",
            },
            {
              "avatar": "https://www.itying.com/images/flutter/3.png",
              "nameChina": "标签",
              "nameEnglish": "Tags",
            },
            {
              "avatar": "https://www.itying.com/images/flutter/3.png",
              "nameChina": "公众号",
              "nameEnglish": "Official Accounts",
            },
          ],
        },
      ),
    );
  }
}
