import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getwidget/getwidget.dart';
import 'package:pseudo_we_chat/generated/l10n.dart';
import 'package:pseudo_we_chat/pages/login/widget/account_content.dart';
import 'package:pseudo_we_chat/pages/login/widget/bottom.dart';
import 'package:pseudo_we_chat/pages/login/widget/top_title.dart';
import 'package:pseudo_we_chat/router.dart';

import '../../api/interface/user/model/user_info.dart';
import '../../api/interface/user/user.dart';

class LoginFormData {
  const LoginFormData(this.username, this.password);

  final String username;
  final String password;
}

class LoginAccountController extends GetxController {
  final loginForm = const LoginFormData("", "").obs;

  void changeUsername(String value) {
    loginForm(LoginFormData(value, loginForm.value.password));
  }

  void changePassword(String value) {
    loginForm(LoginFormData(loginForm.value.username, value));
  }

  void login() async {
    UserInfo userInfo = await UserApi.accountLogin(
        loginForm.value.username, loginForm.value.password);
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
                Get.offAndToNamed(AppRoutes.root);
              })),
      body: Column(
        children: [
          TopTitle(4, AppLocalizations.of(context).login_account_title),
          const AccountContent(10),
          Bottom(
            flex: 6,
            title: AppLocalizations.of(context).login_account_bottom_title,
            buttonTitle: AppLocalizations.of(context).login_account_bottom_button_title,
            buttonPressed: () {
              if (controller.loginForm.value.username.isBlank == true) {
                Get.defaultDialog(
                  title: "❕",
                  middleText: AppLocalizations.of(context).login_account_username_verify_message,
                );
                return;
              }
              if (controller.loginForm.value.password.isBlank == true) {
                Get.defaultDialog(
                    title: "❕",
                    middleText: AppLocalizations.of(context).login_account_password_verify_message);
                return;
              }
              controller.login();
              //跳转到消息页
              Get.offAllNamed(AppRoutes.index);
            },
          ),
        ],
      ),
    );
  }
}
