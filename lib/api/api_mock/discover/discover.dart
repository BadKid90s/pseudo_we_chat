import 'package:pseudo_we_chat/api/http.dart';
import 'package:pseudo_we_chat/api/interface/discover/discover.dart';

class DiscoverApiMock {
  static void discoverList() {
    Http.instance.dioAdapter.onGet(
      DiscoverApi.discoverListPath,
      (server) => server.reply(
        200,
        {
          "code": 200,
          "message": null,
          "data": [
            [
              {
                "nameChina": "朋友圈",
                "nameEnglish": "Moments",
                "avatar": "https://www.itying.com/images/flutter/1.png",
              },
            ],
            [
              {
                "nameChina": "视频号",
                "nameEnglish": "Channels",
                "avatar": "https://www.itying.com/images/flutter/1.png",
              },
              {
                "nameChina": "生活号",
                "nameEnglish": "Live",
                "avatar": "https://www.itying.com/images/flutter/1.png",
              },
            ],
            [
              {
                "nameChina": "扫一扫",
                "nameEnglish": "Scan",
                "avatar": "https://www.itying.com/images/flutter/1.png",
              },
              {
                "nameChina": "摇一摇",
                "nameEnglish": "Shake",
                "avatar": "https://www.itying.com/images/flutter/1.png",
              },
            ],
            [
              {
                "nameChina": "看一看",
                "nameEnglish": "Top Stories",
                "avatar": "https://www.itying.com/images/flutter/1.png",
              },
              {
                "nameChina": "搜一搜",
                "nameEnglish": "Search",
                "avatar": "https://www.itying.com/images/flutter/1.png",
              },

            ],
            [
              {
                "nameChina": "直播和附近",
                "nameEnglish": "Nearby",
                "avatar": "https://www.itying.com/images/flutter/1.png",
              },
            ],
            [
              {
                "nameChina": "购物",
                "nameEnglish": "Shops",
                "avatar": "https://www.itying.com/images/flutter/1.png",
              },
              {
                "nameChina": "游戏",
                "nameEnglish": "Games",
                "avatar": "https://www.itying.com/images/flutter/1.png",
              },
            ],
            [
              {
                "nameChina": "小程序",
                "nameEnglish": "Mini Programs",
                "avatar": "https://www.itying.com/images/flutter/1.png",
              },
            ],
          ],
        },
      ),
    );
  }
}
