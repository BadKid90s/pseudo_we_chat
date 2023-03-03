import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getwidget/getwidget.dart';
import 'package:pseudo_we_chat/pages/login/login_account.dart';
import 'package:pseudo_we_chat/router.dart';
import 'package:styled_widget/styled_widget.dart';

class AccountContent extends StatelessWidget {
  AccountContent(this.flex, {super.key});

  final int flex;

  final _controller = Get.find<LoginAccountController>();

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: flex,
      child: Container(
          alignment: Alignment.topCenter,
          // color: Colors.yellow,
          width: Get.width,
          child: Column(
            children: [
              const Divider(height: 2, thickness: 1),
              Row(
                children: [
                  Expanded(
                    flex: 3,
                    child: Container(
                        alignment: Alignment.centerLeft,
                        child: Text("login_account_username".tr,
                            style: context.textTheme.titleMedium)),
                  ),
                  Expanded(
                    flex: 7,
                    child: TextField(
                      controller: _controller.usernameController,
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: "login_account_username_hint_text".tr,
                      ),
                    ),
                  ),
                ],
              ).height(60),
              const Divider(height: 1, thickness: 1),
              Row(
                children: [
                  Expanded(
                    flex: 3,
                    child: Container(
                        alignment: Alignment.centerLeft,
                        child: Text("login_account_password".tr,
                            style: context.textTheme.titleMedium)),
                  ),
                  Expanded(
                    flex: 7,
                    child: TextField(
                        obscureText: true,
                        controller: _controller.passwordController,
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: "login_account_password_hint_text".tr,
                        )),
                  ),
                ],
              ).height(60),
              const Divider(height: 1, thickness: 1),
              Row(children: [
                GFButton(
                  splashColor: Colors.transparent,
                  highlightColor: Colors.transparent,
                  highlightElevation: 0, // 控制按钮下方阴影的大小，默认值为 8
                  elevation: 0, // 凸起按钮下方阴影的大小，默认值为 2
                  padding: EdgeInsets.zero,
                  type: GFButtonType.transparent,
                  child: Text("login_account_use_phone_login".tr,
                      style: context.textTheme.bodySmall),
                  onPressed: () {
                    Get.offAndToNamed(AppRoutes.loginPhone);
                  },

                )
              ]),
            ],
          ).paddingSymmetric(horizontal: 40)),
    );
  }
}
