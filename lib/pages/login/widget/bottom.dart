import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getwidget/getwidget.dart';

class Bottom extends StatelessWidget {
  const Bottom(
      {super.key,
      required this.flex,
      required this.title,
      required this.buttonTitle,
      required this.buttonPressed});

  final int flex;
  final String title;
  final String buttonTitle;
  final VoidCallback buttonPressed;

  @override
  Widget build(BuildContext context) {
    return Expanded(
        flex: 6,
        child: Container(
          alignment: Alignment.center,
          // color: Colors.red,
          width: Get.width,
          child: Column(
            children: [
              Text(
                title,
                style: context.textTheme.bodySmall,
              ).paddingOnly(bottom: 20),
              SizedBox(
                height: 50,
                child: GFButton(
                  onPressed: buttonPressed,
                  text: buttonTitle,
                  textStyle: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                      wordSpacing: 2,
                      letterSpacing: 2,
                      color: Colors.white),
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  color: GFColors.SUCCESS,
                  shape: GFButtonShape.standard,
                ),
              )
            ],
          ),
        ));
  }
}
