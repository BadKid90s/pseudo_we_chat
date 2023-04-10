import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UserService extends GetxService {
  /// 单例
  static UserService get instance => Get.find<UserService>();

  Future<String?> get avatar => getAvatar();

  late SharedPreferences prefs;


  void init() async {
    prefs = await SharedPreferences.getInstance();
  }

  Future<bool> isLogin() async {
    return prefs.getBool('isLogin') ?? false;
  }

  void changeLoginStatue(bool statue) async {
    prefs.setBool("isLogin", statue);
  }

  Future<String?> getAvatar() async {
    return prefs.getString('avatar');
  }

  void setAvatar(String avatar) async {
    prefs.setString("avatar", avatar);
  }

}
