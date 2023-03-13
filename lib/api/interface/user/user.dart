import 'package:pseudo_we_chat/api/http.dart';
import 'package:pseudo_we_chat/api/interface/user/model/user_info.dart';

class UserApi {
  static const String accountLoginPath = "/accountLoginPath";

  ///
  ///
  ///
  static Future<UserInfo> accountLogin(
      String username, String password) async {
    var result = await Http.instance.post(accountLoginPath, queryParameters: {
      "username": username,
      "password": password,
    });
    return UserInfo.fromJson(result);
  }
}
