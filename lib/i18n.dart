import 'package:get/get.dart';

class I18nMessages extends Translations {
  @override
  Map<String, Map<String, String>> get keys => {
        'zh_CN': {
          'login_login_button_title': '登录',
          'login_signup_button_title': '注册',

          'login_account_title': '微信号/QQ号/邮箱号',
          'login_account_username': '账 号',
          'login_account_password': '密 码',
          'login_account_username_hint_text': '微信号/QQ号/邮箱号',
          'login_account_password_hint_text': '请输入密码',
          'login_account_use_phone_login': '使用手机号登录',
          'login_account_bottom_title': '上述微信号/QQ号/邮箱号仅用于验证',
          'login_account_bottom_button_title': '同意并登录',
          'login_account_username_verify_message': '请输入正确的微信号/QQ号/邮箱号',
          'login_account_password_verify_message': '请输入密码',

          'login_phone_title': '手机号登录',
          'login_phone_bottom_title': '上述手机号仅用于验证',
          'login_phone_bottom_button_title': '同意并继续',
          'login_phone_phone_verify_message': '请输入正确的手机号',

        },
        'en_Us': {
          'login_login_button_title': 'log in',
          'login_signup_button_title': 'sign up',

          'login_account_title': 'WeChat/QQ/Email',
          'login_account_username': 'account',
          'login_account_password': 'password',
          'login_account_username_hint_text': 'WeChat/QQ/Email',
          'login_account_password_hint_text': 'Please Enter Password',
          'login_account_use_phone_login': 'Use Phone Number Login',
          'login_account_bottom_title': 'The above WeChat/QQ/Email are only used for verification',
          'login_account_bottom_button_title': 'Agree And Log In',
          'login_account_username_verify_message': 'Please enter the correct WeChat/QQ/Email number',
          'login_account_password_verify_message': 'Please enter a password',

          'login_phone_title': 'Phone Number Login',
          'login_phone_bottom_title': 'The above phone number is for verification only',
          'login_phone_bottom_button_title': 'Agree And Continue',
          'login_phone_phone_verify_message': 'Please enter the correct mobile phone number',

        }
      };
}
