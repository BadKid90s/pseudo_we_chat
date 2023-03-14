import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Search extends StatelessWidget {
  const Search({Key? key, this.onPressed, this.text}) : super(key: key);

  final VoidCallback? onPressed;
  final String? text;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      color: context.theme.appBarTheme.backgroundColor,
      padding: const EdgeInsets.only(left: 10, right: 10, top: 5, bottom: 5),
      child: ElevatedButton(
        style: ButtonStyle(
            elevation: MaterialStateProperty.all(0),
            backgroundColor: MaterialStateProperty.all(Colors.white60)),
        onPressed: onPressed,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.search,
              color: context.textTheme.bodySmall?.color,
            ),
            Text(
              text ?? "搜索",
              style: TextStyle(
                  fontSize: 20, color: context.textTheme.bodySmall?.color),
            )
          ],
        ),
      ),
    );
  }
}
