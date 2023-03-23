import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OtherLogin extends StatelessWidget {
  const OtherLogin({Key? key, required this.title, required this.buttonPressed})
      : super(key: key);

  final String title;
  final VoidCallback buttonPressed;

  @override
  Widget build(BuildContext context) {
    return Row(children: [
      TextButton(
        onPressed: buttonPressed,
        child: Text(
          title,
          style: context.textTheme.bodySmall,
        ),
      )
    ]);
  }
}
