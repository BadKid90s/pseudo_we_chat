import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pseudo_we_chat/widget/we_chat_voice_player.dart';

enum ChatType { image, text, sound }

class WeChatChatBox extends StatelessWidget {
  static WeChatChatBox buildText({
    required String text,
    required String avatar,
    required bool isLeft,
  }) {
    return WeChatChatBox(
      chatType: ChatType.text,
      text: text,
      avatar: avatar,
      isLeft: isLeft,
    );
  }

  static WeChatChatBox buildImage({
    required ImageProvider? image,
    required String avatar,
    required bool isLeft,
  }) {
    return WeChatChatBox(
      chatType: ChatType.image,
      image: image,
      avatar: avatar,
      isLeft: isLeft,
    );
  }

  static WeChatChatBox buildSound({
    required String? recordFilePath,
    required Duration? recordDuration,
    required String avatar,
    required bool isLeft,
  }) {
    return WeChatChatBox(
      chatType: ChatType.sound,
      recordFilePath: recordFilePath,
      recordDuration: recordDuration,
      avatar: avatar,
      isLeft: isLeft,
    );
  }

  const WeChatChatBox(
      {super.key,
      this.text,
      this.image,
      this.recordFilePath,
      this.recordDuration,
      required this.chatType,
      required this.avatar,
      this.avatarSize = 45,
      this.isLeft = true});

  final String avatar;
  final double avatarSize;
  final bool isLeft;
  final ChatType chatType;

  final String? text;
  final ImageProvider? image;
  final String? recordFilePath;
  final Duration? recordDuration;

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
        maxWidth: MediaQuery.of(context).size.width * 0.5,
      ),
      margin: const EdgeInsets.all(10),
      padding: const EdgeInsets.all(10),
      color: image == null
          ? isLeft
              ? context.theme.primaryColor
              : Colors.green
          : null,
      child: getContent(context),
    );
  }

  Widget getContent(BuildContext context) {
    switch (chatType) {
      case ChatType.text:
        return Text(
          text!,
          style: context.textTheme.titleMedium,
          maxLines: 20,
          softWrap: true,
          overflow: TextOverflow.clip,
        );
      case ChatType.image:
        return Image(image: image!);
      case ChatType.sound:
        return WeChatVoicePlayer(
          filePath: recordFilePath!,
          duration: recordDuration!,
        );
    }
  }
}
