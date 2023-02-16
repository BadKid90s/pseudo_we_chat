import 'package:flutter/material.dart';

class BadgeAvatar extends StatelessWidget {
  final String avatar;
  final int num;

  const BadgeAvatar({Key? key, required this.avatar, required this.num})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (num == 0) {
      return Image.network(
        avatar,
        width: 50,
        height: 50,
        fit: BoxFit.cover,
      );
    }
    return Badge(
      label: Text("${num > 99 ? '99' : num}"),
      backgroundColor: Colors.red,
      alignment: num < 10
          ? const AlignmentDirectional(40, -6)
          : const AlignmentDirectional(30, -6),
      child: Image.network(
        avatar,
        width: 50,
        height: 50,
        fit: BoxFit.cover,
      ),
    );
  }
}
