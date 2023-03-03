import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TopTitle extends StatelessWidget {
  const TopTitle(this.flex, this.title, {super.key, required});

  final int flex;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Expanded(
        flex: flex,
        child: Container(
          alignment: Alignment.center,
          width: Get.width,
          child: Text(
            title,
            style: context.textTheme.headlineSmall,
          ),
        ));
  }
}
