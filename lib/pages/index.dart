import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getwidget/getwidget.dart';
import 'package:pseudo_we_chat/router.dart';
import 'package:styled_widget/styled_widget.dart';

class IndexPage extends StatelessWidget {
  const IndexPage({super.key});

  TextStyle get _textStyle =>
      const TextStyle(fontSize: 18, wordSpacing: 20, letterSpacing: 20);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: Get.height,
        width: Get.width,
        decoration: const BoxDecoration(
            image: DecorationImage(
          image: AssetImage("images/login_bg.jpg"),
          fit: BoxFit.cover,
        )),
        child: Stack(
          alignment: Alignment.center, //指定未定位或部分定位widget的对齐方式
          children: <Widget>[
            Positioned(
                bottom: 120,
                child: IntrinsicWidth(
                  stepWidth: Get.width,
                  child: Flex(
                    direction: Axis.horizontal,
                    children: [
                      Expanded(
                        flex: 1,
                        child: GFButton(
                          onPressed: () {
                            // 跳转登录页
                            Get.toNamed(AppRoutes.login);
                          },
                          color: const Color.fromRGBO(247, 247, 247, 70),
                          child: Text(
                            'login_login_button_title'.tr,
                            style: _textStyle,
                          ),
                        ).height(50).paddingSymmetric(horizontal: 20),
                      ),
                      Expanded(
                        flex: 1,
                        child: GFButton(
                          onPressed: () {
                            // 跳转注册页
                            Get.toNamed(AppRoutes.signup);
                          },
                          color: Colors.green,
                          child: Text(
                            'login_signup_button_title'.tr,
                            style: _textStyle,
                          ),
                        ).height(50).paddingSymmetric(horizontal: 20),
                      ),
                    ],
                  ),
                )),
          ],
        ),
      ),
    );
  }
}
