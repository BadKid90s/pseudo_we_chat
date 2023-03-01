import 'package:get/get.dart';

import 'pages/index.dart';
import 'pages/login.dart';
import 'pages/signup.dart';
import 'pages/splash.dart';

abstract class AppRoutes {
  /// 闪屏页
  static const splash = "/";

  /// 首屏页
  static const index = "/index";

  /// 登录页
  static const login = "/login";

  /// 注册页
  static const signup = "/signup";
}

class AppPages {
  static const splash = AppRoutes.splash;

  static final List<GetPage> routes = [
    GetPage(
      name: AppRoutes.splash,
      page: () => const SplashPage(),
    ),
    GetPage(
      name: AppRoutes.index,
      page: () => const IndexPage(),
    ),
    GetPage(
      name: AppRoutes.login,
      page: () => const LoginPage(),
    ),
    GetPage(
      name: AppRoutes.signup,
      page: () => const SignupPage(),
    ),
  ];
}
