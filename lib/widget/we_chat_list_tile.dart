import 'package:flutter/material.dart';
import 'package:badges/badges.dart' as badges;

class WeChatListTile extends StatefulWidget {
  const WeChatListTile(
      {Key? key,
      this.showBadges = false,
      this.badgeText,
      required this.avatarUrl,
      required this.title,
      this.subtitle,
      this.trailingIcon})
      : super(key: key);

  /// 是否显示小红点
  final bool showBadges;

  /// 小红点显示的内容
  final String? badgeText;

  /// 头像链接
  final String avatarUrl;

  /// 标题
  final Widget title;

  /// 副标题
  final Widget? subtitle;

  /// 右侧图标
  final IconData? trailingIcon;

  @override
  State<WeChatListTile> createState() => _WeChatListTileState();
}

class _WeChatListTileState extends State<WeChatListTile> {
  @override
  Widget build(BuildContext context) {
    return _buildItem(context);
  }

  Widget _buildItem(BuildContext context) {
    return ListTile(
      leading: badges.Badge(
        position: badges.BadgePosition.topEnd(top: -8, end: -6),
        badgeContent: widget.showBadges && widget.badgeText != null
            ? Text(
                widget.badgeText!,
                style: const TextStyle(color: Colors.white),
              )
            : null,
        showBadge: widget.showBadges ,
        child: Container(
          width: 64,
          height: 64,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5),
            image: DecorationImage(
              image: NetworkImage(widget.avatarUrl),
              fit: BoxFit.cover,
            ),
          ),
        ),
      ),
      contentPadding: EdgeInsets.zero,
      title: widget.title,
      subtitle: widget.subtitle,
      trailing: widget.trailingIcon != null
          ? Icon(
              widget.trailingIcon,
            )
          : null,
    );
  }
}
