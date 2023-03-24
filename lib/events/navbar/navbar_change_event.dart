
/// 导航栏切换事件
class NavbarChangeEvent{
  final NavBarType navBarType;

  NavbarChangeEvent(this.navBarType);
}

/// 导航栏类型
/// 底部分为消息、通讯录、发现、我的
enum NavBarType{
  message,
  directory,
  discover,
  home,
}
