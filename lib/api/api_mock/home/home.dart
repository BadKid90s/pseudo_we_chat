import 'package:pseudo_we_chat/api/http.dart';
import 'package:pseudo_we_chat/api/interface/home/home.dart';

class HomeApiMock {
  static void homeListMock() {
    Http.instance.dioAdapter.onGet(
      HomeApi.homeListPath,
      (server) => server.reply(
        200,
        {
          "code": 200,
          "message": null,
          "data": [
            [
              {
                "nameChina": "服务",
                "nameEnglish": "Services",
                "avatar": "https://www.itying.com/images/flutter/1.png",
                "router": ""
              },
            ],
            [
              {
                "nameChina": "收藏",
                "nameEnglish": "Favorites",
                "avatar": "https://www.itying.com/images/flutter/1.png",
                "router": ""
              },
              {
                "nameChina": "朋友圈",
                "nameEnglish": "Moments",
                "avatar": "https://www.itying.com/images/flutter/1.png",
                "router": ""
              },
              {
                "nameChina": "卡包",
                "nameEnglish": "Cards & Offers",
                "avatar": "https://www.itying.com/images/flutter/1.png",
                "router": ""
              },
              {
                "nameChina": "表情",
                "nameEnglish": "Sticker Gallery",
                "avatar": "https://www.itying.com/images/flutter/1.png",
                "router": ""
              },
            ],
            [
              {
                "nameChina": "设置",
                "nameEnglish": "Settings",
                "avatar": "https://www.itying.com/images/flutter/1.png",
                "router": ""
              },
            ],
          ],
        },
      ),
    );
  }
}
