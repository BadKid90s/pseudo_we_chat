import 'package:flutter/material.dart';
import 'package:get/get.dart';

class WeChatChatBox extends StatelessWidget {
  const WeChatChatBox(
      {super.key,
      this.text,
      this.image,
      required this.avatar,
      this.avatarSize = 45,
      this.isLeft = true});

  final String avatar;
  final double avatarSize;
  final String? text;
  final ImageProvider? image;

  final bool isLeft;

  @override
  Widget build(BuildContext context) {
    var children = [_buildAvatar(context), _buildMessage(context)];
    return Row(
      mainAxisAlignment:
          isLeft ? MainAxisAlignment.start : MainAxisAlignment.end,
      children: isLeft ? children : children.reversed.toList(),
    );
  }

  Widget _buildAvatar(BuildContext context) {
    return Container(
      width: avatarSize,
      height: avatarSize,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5),
        image: DecorationImage(
          image: NetworkImage(avatar),
          fit: BoxFit.cover,
        ),
      ),
    );
  }

  Widget _buildMessage(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(10),
      padding: const EdgeInsets.all(10),
      color: image == null
          ? isLeft
              ? context.theme.primaryColor
              : Colors.green
          : null,
      child: text != null
          ? Text(text!, style: context.textTheme.titleMedium)
          : Image(image: image!),
    );
  }
}
