import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getwidget/getwidget.dart';
import 'package:pseudo_we_chat/pages/login/widget/bottom.dart';
import 'package:pseudo_we_chat/pages/login/widget/phone_content.dart';
import 'package:pseudo_we_chat/pages/login/widget/top_title.dart';
import 'package:pseudo_we_chat/router.dart';

class LoginPhoneController extends GetxController {
  var phoneCode = "86".obs;
  var phone = "".obs;
  var region = "中国".obs;

  void changeRegion(String code, String? regionName) {
    phoneCode(code);
    region(regionName);
  }

  void login() async {
    print("loginPhone: +$phoneCode $phone");
  }
}

class LoginPhonePage extends GetView<LoginPhoneController> {
  const LoginPhonePage({super.key});

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
          TopTitle(4, "login_phone_title".tr),
          const PhoneContent(10),
          Bottom(
            flex: 6,
            title: "login_phone_bottom_title".tr,
            buttonTitle: "login_phone_bottom_button_title".tr,
            buttonPressed: () {
              if (controller.phone.value.isBlank == true) {
                Get.defaultDialog(
                  title: "❕",
                  middleText: "login_phone_phone_verify_message".tr,
                );
                return;
              }
              controller.login();
              Get.offAllNamed(AppRoutes.message);
            },
          ),
        ],
      ),
    );
  }
}
