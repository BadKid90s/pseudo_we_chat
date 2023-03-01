import 'package:get/get.dart';

class I18nMessages extends Translations {
  @override
  Map<String, Map<String, String>> get keys => {
        'zh_CN': {
          'login_login_button_title': '登录',
          'login_signup_button_title': '注册',
        },
        'en_Us': {
          'login_login_button_title': 'log In',
          'login_signup_button_title': 'sign Up',
        }
      };
}
