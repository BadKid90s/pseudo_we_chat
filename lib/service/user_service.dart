import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UserService extends GetxService {
  /// 单例
  static UserService get instance => Get.find<UserService>();

  String get avatar => getAvatar();

  get prefs => getPrefs;

  Future<bool> isLogin() async {
    return prefs.getBool('isLogin') ?? false;
  }

  void changeLoginStatue(bool statue) async {
    prefs.setBool("isLogin", statue);
  }

  String getAvatar() {
    return prefs.getString('avatar');
  }

  void setAvatar(String avatar) {
    prefs.setString("avatar", avatar);
  }

  Future<SharedPreferences> getPrefs() async {
    return await SharedPreferences.getInstance();
  }
}
