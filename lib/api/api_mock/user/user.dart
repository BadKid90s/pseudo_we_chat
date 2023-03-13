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
              "message": "该手机号无法登录！",
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
            "phone": "11122223333",
          });
  }
}
