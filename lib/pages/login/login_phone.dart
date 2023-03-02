import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pseudo_we_chat/pages/login/widget/bottom.dart';
import 'package:pseudo_we_chat/pages/login/widget/top_title.dart';

class LoginPhoneController extends GetxController {
  TextEditingController phoneController = TextEditingController();

  void login() async {}
}

class LoginPhonePage extends GetView<LoginPhoneController> {
  const LoginPhonePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          TopTitle(4, "login_phone_title".tr),
          Bottom(
            flex: 6,
            title: "login_phone_bottom_title".tr,
            buttonTitle: "login_phone_bottom_button_title".tr,
            buttonPressed: () {
              if (controller.phoneController.text.isBlank == true) {
                Get.defaultDialog(
                  title: "❕",
                  middleText: "login_account_username_verify_message".tr,
                );
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
