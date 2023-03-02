import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getwidget/getwidget.dart';
import 'package:pseudo_we_chat/pages/login/widget/account_content.dart';
import 'package:pseudo_we_chat/pages/login/widget/bottom.dart';
import 'package:pseudo_we_chat/pages/login/widget/top_title.dart';
import 'package:pseudo_we_chat/router.dart';

class LoginFormData {
  LoginFormData({this.username = '', this.password = ''});

  String username;
  String password;
}

class LoginAccountController extends GetxController {
  TextEditingController usernameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  void login() async {
    //TODO("后台处理")
    //跳转到消息页
    Get.offAllNamed(AppRoutes.message);
  }

  @override
  void dispose() {
    super.dispose();
    usernameController.dispose();
    passwordController.dispose();
  }
}

class LoginAccountPage extends GetView<LoginAccountController> {
  const LoginAccountPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          leading: GFButton(
              type: GFButtonType.transparent,
              child: Icon(
                Icons.close,
                color: context.iconColor,
                size: 30,
              ),
              onPressed: () {
                Get.offAndToNamed(AppRoutes.index);
              })),
      body: Column(
        children: [
          TopTitle(4, "login_account_title".tr),
          AccountContent(10),
          Bottom(
            flex: 6,
            title: "login_account_bottom_title".tr,
            buttonTitle: "login_account_bottom_button_title".tr,
            buttonPressed: () {
              if (controller.usernameController.text.isBlank == true) {
                Get.defaultDialog(
                  title: "❕",
                  middleText: "login_account_username_verify_message".tr,
                );
                return;
              }
              if (controller.passwordController.text.isBlank == true) {
                Get.defaultDialog(
                    title: "❕",
                    middleText: "login_account_password_verify_message".tr);
                return;
              }
              controller.login();
            },
          ),
        ],
      ),
    );
  }
}
