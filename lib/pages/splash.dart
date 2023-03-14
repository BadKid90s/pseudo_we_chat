import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pseudo_we_chat/router.dart';
import 'package:pseudo_we_chat/service/user_service.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({super.key});

  @override
  Widget build(BuildContext context) {
    Future.delayed(const Duration(milliseconds: 1000), () async {
      final isLogin = await UserService.instance.isLogin();
      //判断是否登录
      if (isLogin) {
        //跳转到首页
        Get.offNamed(AppRoutes.index);
      } else {
        //跳转到登录页
        Get.offNamed(AppRoutes.root);
      }
    });
    return Scaffold(
      body: Container(
          height: Get.height,
          width: Get.width,
          decoration: const BoxDecoration(
              image: DecorationImage(
            image: AssetImage("images/login_bg.jpg"),
            fit: BoxFit.cover,
          ))),
    );
  }
}
