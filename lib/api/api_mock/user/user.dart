import 'package:pseudo_we_chat/api/http.dart';

import '../../interface/user/user.dart';

class UserApiMock {
  static void accountLoginMock() {
    Http.instance.dioAdapter.onPost(
      UserApi.accountLoginPath,
      (server) => server.reply(
        200,
        {"name": "zhangSan"},
        // Reply would wait for one-sec before returning data.
        delay: const Duration(seconds: 1),
      ),
    );
  }
}
