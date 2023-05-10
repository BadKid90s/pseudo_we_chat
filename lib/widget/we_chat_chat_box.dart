import 'package:flutter/material.dart';

enum ChatType { image, text, sound, redPacket }

class WeChatChatBox extends StatelessWidget {
  const WeChatChatBox({
    super.key,
    required this.child,
    required this.avatar,
    this.avatarSize = 45,
    this.isLeft = true,
  });

  final Widget child;
  final String avatar;
  final double avatarSize;
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
      constraints: BoxConstraints(
        maxWidth: MediaQuery.of(context).size.width * 0.6,
      ),
      margin: const EdgeInsets.all(10),
      child: child,
    );
  }
}
