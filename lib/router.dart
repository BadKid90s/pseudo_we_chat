import 'package:get/get.dart';
import 'package:pseudo_we_chat/pages/index.dart';

import 'pages/root.dart';
import 'pages/login/login_account.dart';
import 'pages/login/login_phone.dart';
import 'pages/signup.dart';
import 'pages/splash.dart';

abstract class AppRoutes {
  /// 闪屏页
  static const splash = "/";

  /// 首屏页
  static const root = "/root";

  /// 登录页-账号
  static const loginAccount = "/loginAccount";

  /// 登录页-手机号
  static const loginPhone = "/loginPhone";

  /// 注册页
  static const signup = "/signup";

  /// 消息页
  static const index = "/index";
}

class AppPages {
  static const splash = AppRoutes.splash;

  static final List<GetPage> routes = [
    GetPage(
      name: AppRoutes.splash,
      page: () => const SplashPage(),
    ),
    GetPage(
      name: AppRoutes.root,
      page: () => const RootPage(),
    ),
    GetPage(
        name: AppRoutes.loginAccount,
        page: () => const LoginAccountPage(),
        binding:
            BindingsBuilder(() => Get.lazyPut(() => LoginAccountController()))),
    GetPage(
        name: AppRoutes.loginPhone,
        page: () => const LoginPhonePage(),
        binding:
            BindingsBuilder(() => Get.lazyPut(() => LoginPhoneController()))),
    GetPage(
      name: AppRoutes.signup,
      page: () => const SignupPage(),
    ),
    GetPage(
      name: AppRoutes.index,
      page: () => const IndexPage(),
    ),
  ];
}
