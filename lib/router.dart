import 'package:get/get.dart';

import 'pages/login.dart';
import 'pages/splash.dart';

abstract class AppRoutes {
  /// 首屏页
  static const splash = "/";

  /// 登录页
  static const login = "/login";
}

class AppPages {
  static const initial = AppRoutes.splash;

  static final List<GetPage> routes = [
    GetPage(
      name: AppRoutes.splash,
      page: () => const SplashPage(),
    ),
    GetPage(
      name: AppRoutes.login,
      page: () => const LoginPage(),
    ),
  ];
}
