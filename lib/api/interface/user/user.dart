import 'package:pseudo_we_chat/api/http.dart';
import 'package:pseudo_we_chat/api/interface/user/model/user_info.dart';
import 'package:pseudo_we_chat/api/interface/user/model/user_status.dart';

class UserApi {
  static const String accountLoginPath = "/accountLoginPath";
  static const String phoneLoginPath = "/phoneLoginPath";
  static const String userInfoPath = "/userInfo";
  static const String userSignupPath = "/signup";

  /// 账户登录接口
  static Future<UserStatus> accountLogin(
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
    return UserStatus.fromJson(result.data);
  }

  /// 手机登录接口
  static Future<UserStatus> phoneLogin(
      String phone,
      ) async {
    var result = await Http.instance.dio.post(
      phoneLoginPath,
      queryParameters: {
        "phone": phone,
      },
    );
    return UserStatus.fromJson(result.data);
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

  /// 注册用户
  static Future<UserStatus> userSignup(
      String avatar,
      String nikeName,
      String phone,
      String password,
      ) async {
    var result = await Http.instance.dio.post(
      userSignupPath,
      queryParameters: {
        "avatar": avatar,
        "nikeName": nikeName,
        "phone": phone,
        "password": password,
      },
    );
    return UserStatus.fromJson(result.data);
  }
}
