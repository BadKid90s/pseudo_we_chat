import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pseudo_we_chat/api/interface/user/user.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:pseudo_we_chat/pages/login/widget/bottom.dart';
import 'package:pseudo_we_chat/pages/login/widget/phone_content.dart';
import 'package:pseudo_we_chat/pages/login/widget/top_title.dart';
import 'package:pseudo_we_chat/router.dart';
import 'package:pseudo_we_chat/service/user_service.dart';

class LoginPhoneController extends GetxController {
  var phoneCode = "86".obs;
  var phone = "".obs;
  var region = Rxn<String>(null);
  var message = Rxn<String>(null);

  void changeRegion(String code, String? regionName) {
    phoneCode(code);
    region(regionName);
  }

  void login() async {
    UserApi.phoneLogin(
      phone.value,
    ).then((loginStatus) {
      if (loginStatus.status) {
        UserService.instance.changeLoginStatue(true);
        //跳转到消息页
        Get.offAllNamed(AppRoutes.index);
      } else {
        message(loginStatus.message);
      }
    });
  }
}

class LoginPhonePage extends GetView<LoginPhoneController> {
  const LoginPhonePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(
            Icons.close,
            color: context.iconColor,
            size: 30,
          ),
          onPressed: () {
            Get.offAndToNamed(AppRoutes.root);
          },
        ),
      ),
      body: Column(
        children: [
          TopTitle(4, AppLocalizations.of(context)!.login_phone_title),
          const PhoneContent(10),
          Bottom(
            flex: 6,
            title: AppLocalizations.of(context)!.login_phone_bottom_title,
            buttonTitle:
                AppLocalizations.of(context)!.login_phone_bottom_button_title,
            buttonPressed: () {
              if (controller.phone.value.isBlank == true) {
                Get.defaultDialog(
                  title: "❕",
                  middleText: AppLocalizations.of(context)!
                      .login_phone_phone_verify_message,
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
