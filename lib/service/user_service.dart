import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UserService extends GetxService {
  /// 单例
  static UserService get instance => Get.find<UserService>();

  Future<bool> isLogin() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getBool('isLogin') ?? false;
  }

  void changeLoginStatue(bool statue) async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setBool("isLogin", statue);
  }
}
