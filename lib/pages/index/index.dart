import 'package:flutter/material.dart';
import 'package:pseudo_we_chat/pages/directory/directory.dart';
import 'package:pseudo_we_chat/pages/discover/discover.dart';
import 'package:pseudo_we_chat/pages/home/home.dart';
import 'package:pseudo_we_chat/pages/message/message.dart';
import 'package:pseudo_we_chat/ui/font/WeChatFont.dart';

import '../../constant/style.dart';

class IndexPage extends StatefulWidget {
  // 定义初始化导航栏选择的下标，默认为0
  final int index;

  const IndexPage({Key? key, this.index = 0}) : super(key: key);

  @override
  State<IndexPage> createState() => _IndexPageState();
}

class _IndexPageState extends State<IndexPage> {
  late int _index;

  //定义页面控制器，可以左右滑动切换页面
  PageController pageController = PageController(initialPage: 0);

  // 重写初始化状态方法进行下标赋值
  @override
  void initState() {
    super.initState();
    _index = widget.index;
  }

  // 定义导航栏组件集合
  final List<Widget> _pageItem = const [
    MessagePage(),
    DirectoryPage(),
    DiscoverPage(),
    HomePage(),
  ];

  // 定义图标Map(方便后期使用自定义图标库)
  final Map<String, Icon> _iconMap = const {
    "message": Icon(WeChatFont.message),
    "directory": Icon(WeChatFont.directory),
    "discover": Icon(WeChatFont.discover),
    "home": Icon(WeChatFont.my),
  };

  // 定义导航栏组件的数据
  final List<NavBarItem> _navBarItem = const [
    NavBarItem(icon: "message", label: "微信"),
    NavBarItem(icon: "directory", label: "通讯录"),
    NavBarItem(icon: "discover", label: "发现"),
    NavBarItem(icon: "home", label: "我的"),
  ];

  // 导航栏按钮按下事件
  void _onBottomNavigationBarTapped(index) {
    pageController.animateToPage(index,
        duration: const Duration(milliseconds: 300), curve: Curves.ease);
  }

  // 页面切换事件
  void _onPageChanged(index) {
    // 下标重新赋值，进行切换
    setState(() {
      _index = index;
    });
  }

  // 自定义构建导航栏组件的方法 - 代码复用
  List<BottomNavigationBarItem> _getNavBarItem() {
    return _navBarItem
        .map((e) => BottomNavigationBarItem(
            icon: _iconMap[e.icon] ?? const Icon(Icons.search), label: e.label))
        .toList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: PageView.builder(
            onPageChanged: _onPageChanged,
            controller: pageController,
            itemCount: _pageItem.length,
            itemBuilder: (BuildContext context, int index) {
              return _pageItem[index];
            }),
        bottomNavigationBar: BottomNavigationBar(
          elevation: 0,
          backgroundColor: Style.navBarBgColor,
          //设置选中图标颜色
          selectedItemColor: Style.navBarSelectedItemColor,
          //设置未选中图标颜色
          unselectedItemColor: Style.navBarUnSelectedItemColor,
          //设置选中文字大小
          selectedLabelStyle: const TextStyle(fontSize: 14),
          //设置未选中文字大小
          unselectedLabelStyle: const TextStyle(fontSize: 14),
          //设置类型
          type: BottomNavigationBarType.fixed,
          //设置选中下标
          currentIndex: _index,
          //设置按钮按下事件
          onTap: _onBottomNavigationBarTapped,
          //调用构建导航栏组件方法
          items: _getNavBarItem(),
        ));
  }
}

/// 自定义导航栏组件数据结构
class NavBarItem {
  const NavBarItem({required this.icon, required this.label});

  /// 图标
  final String icon;

  /// 名称
  final String label;
}
