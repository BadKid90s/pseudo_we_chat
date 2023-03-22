import 'package:pseudo_we_chat/api/http.dart';
import 'package:pseudo_we_chat/api/interface/user/model/login_status.dart';
import 'package:pseudo_we_chat/api/interface/user/model/user_info.dart';

class UserApi {
  static const String accountLoginPath = "/accountLoginPath";
  static const String phoneLoginPath = "/phoneLoginPath";
  static const String userInfoPath = "/userInfo";

  /// 账户登录接口
  static Future<LoginStatus> accountLogin(
      String username,
      String password,
      ) async {
    var result = await Http.instance.dio.post(
      accountLoginPath,
      queryParameters: {
        "username": username,
        "password": password,
      },
    );
    return LoginStatus.fromJson(result.data);
  }

  /// 手机登录接口
  static Future<LoginStatus> phoneLogin(
      String phone,
      ) async {
    var result = await Http.instance.dio.post(
      phoneLoginPath,
      queryParameters: {
        "phone": phone,
      },
    );
    return LoginStatus.fromJson(result.data);
  }

  /// 获取用户信息
  static Future<UserInfo> userInfo(
      String userId,
      ) async {
    var result = await Http.instance.dio.get(
      userInfoPath,
      queryParameters: {
        "userId": userId,
      },
    );
    return UserInfo.fromJson(result.data);
  }
}
