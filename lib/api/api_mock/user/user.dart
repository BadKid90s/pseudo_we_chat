import 'package:pseudo_we_chat/api/http.dart';

import '../../interface/user/user.dart';

class UserApiMock {
  static void accountLoginMock() {
    Http.instance.dioAdapter
      ..onPost(
        UserApi.accountLoginPath,
        (server) => server.reply(
          200,
          {
            "code": 200,
            "message": null,
            "data": {
              "status": false,
              "message": "用户名密码错误！",
            },
          },
        ),
      )
      ..onPost(
          UserApi.accountLoginPath,
          (server) => server.reply(
                200,
                {
                  "code": 200,
                  "message": null,
                  "data": {
                    "status": true,
                    "message": null,
                  },
                },
                // Reply would wait for one-sec before returning data.
                // delay: const Duration(seconds: 1),
              ),
          queryParameters: {
            "username": "admin",
            "password": "123456",
          });
  }

  static void phoneLoginMock() {
    Http.instance.dioAdapter
      ..onPost(
        UserApi.phoneLoginPath,
        (server) => server.reply(
          200,
          {
            "code": 200,
            "message": null,
            "data": {
              "status": false,
              "userId": null,
              "message": "该手机号无法登录！",
            },
          },
        ),
      )
      ..onPost(
          UserApi.phoneLoginPath,
          (server) => server.reply(
                200,
                {
                  "code": 200,
                  "message": null,
                  "data": {
                    "status": true,
                    "userId": "111111",
                    "message": null,
                  },
                },
                // Reply would wait for one-sec before returning data.
                // delay: const Duration(seconds: 1),
              ),
          queryParameters: {
            "phone": "11122223333",
          });
  }

  static void userInfoMock() {
    Http.instance.dioAdapter.onGet(
        UserApi.userInfoPath,
        (server) => server.reply(
              200,
              {
                "code": 200,
                "message": null,
                "data": {
                  "name": "我自是年少轻浮",
                  "avatar": "https://pic2.zhimg.com/v2-639b49f2f6578eabddc458b84eb3c6a1.jpg",
                  "weChatNum": "qwertyuiop_12345",
                },
              },
            ),
        queryParameters: {
          "userId": "111111",
        });
  }
}
