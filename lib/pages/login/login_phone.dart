import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getwidget/getwidget.dart';
import 'package:pseudo_we_chat/generated/l10n.dart';
import 'package:pseudo_we_chat/pages/login/widget/bottom.dart';
import 'package:pseudo_we_chat/pages/login/widget/phone_content.dart';
import 'package:pseudo_we_chat/pages/login/widget/top_title.dart';
import 'package:pseudo_we_chat/router.dart';

class LoginPhoneController extends GetxController {
  var phoneCode = "86".obs;
  var phone = "".obs;
  var region = Rxn<String>(null);

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
                Get.offAndToNamed(AppRoutes.root);
              })),
      body: Column(
        children: [
          TopTitle(4, S.of(context).login_phone_title),
          const PhoneContent(10),
          Bottom(
            flex: 6,
            title: S.of(context).login_phone_bottom_title,
            buttonTitle: S.of(context).login_phone_bottom_button_title,
            buttonPressed: () {
              if (controller.phone.value.isBlank == true) {
                Get.defaultDialog(
                  title: "❕",
                  middleText: S.of(context).login_account_username_verify_message,
                );
                return;
              }
              controller.login();
              Get.offAllNamed(AppRoutes.index);
            },
          ),
        ],
      ),
    );
  }
}
