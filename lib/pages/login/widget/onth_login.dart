import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getwidget/getwidget.dart';

class OtherLogin extends StatelessWidget {
  const OtherLogin({Key? key, required this.title, required this.buttonPressed})
      : super(key: key);

  final String title;
  final VoidCallback buttonPressed;

  @override
  Widget build(BuildContext context) {
    return Row(children: [
      GFButton(
        splashColor: Colors.transparent,
        highlightColor: Colors.transparent,
        highlightElevation: 0,
        // 控制按钮下方阴影的大小，默认值为 8
        elevation: 0,
        // 凸起按钮下方阴影的大小，默认值为 2
        padding: EdgeInsets.zero,
        type: GFButtonType.transparent,
        onPressed: buttonPressed,
        child: Text(
          title,
          style: context.textTheme.bodySmall,
        ),
      )
    ]);
  }
}
