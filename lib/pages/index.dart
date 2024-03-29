import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:pseudo_we_chat/events/event_bus.dart';
import 'package:pseudo_we_chat/events/navbar/navbar_change_event.dart';
import 'package:pseudo_we_chat/pages/directory/directory.dart';
import 'package:pseudo_we_chat/pages/discover/discover.dart';
import 'package:pseudo_we_chat/pages/home/home.dart';
import 'package:pseudo_we_chat/pages/message/message.dart';

class IndexPage extends StatefulWidget {
  const IndexPage({Key? key}) : super(key: key);

  @override
  State<IndexPage> createState() => _IndexPageState();
}

class _IndexPageState extends State<IndexPage> {
  static int _index = 0;

  // 定义导航栏组件集合
  static const List<Widget> _pageItem = [
    MessagePage(),
    DirectoryPage(),
    DiscoverPage(),
    HomePage(),
  ];

  //定义页面控制器，可以左右滑动切换页面
  static final PageController _pageController =
      PageController(initialPage: _index);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _buildPageView(_index),
      bottomNavigationBar: _buildNavigationBar(context),
    );
  }

  Widget _buildPageView(int index) {
    return PageView.builder(
        onPageChanged: (value) => _changeIndex(value),
        controller: _pageController,
        itemCount: _pageItem.length,
        itemBuilder: (BuildContext context, int index) {
          return _pageItem[index];
        });
  }

  Widget _buildNavigationBar(BuildContext context) {
    return Container(
      color: const Color(0x88FFFFFF),
      child: ClipRect(
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 100, sigmaY: 100),
          //背景模糊化
          child: BottomNavigationBar(
            type: BottomNavigationBarType.fixed,
            items: _buildNavigationBarItemList(context),
            elevation: 0,
            onTap: (index) {
              _pageController.animateToPage(
                index,
                duration: const Duration(milliseconds: 300),
                curve: Curves.ease,
              );
            },
            currentIndex: _index,
          ),
        ),
      ),
    );
  }

  List<BottomNavigationBarItem> _buildNavigationBarItemList(
      BuildContext context) {
    return _buildNavBarData(context)
        .entries
        .map((item) => _buildNavigationBarItem(item.value, item.key))
        .toList();
  }

  BottomNavigationBarItem _buildNavigationBarItem(Widget icon, String label) {
    return BottomNavigationBarItem(
      icon: icon,
      label: label,
    );
  }

  Map<String, Widget> _buildNavBarData(BuildContext context) {
    return {
      AppLocalizations.of(context)!.index_message: const Icon(Icons.message),
      AppLocalizations.of(context)!.index_directory: const Icon(Icons.people),
      AppLocalizations.of(context)!.index_discover:
          const Icon(Icons.my_location),
      AppLocalizations.of(context)!.index_home: const Icon(Icons.person),
    };
  }

  void _changeIndex(int index) {
    setState(() {
      _index = index;
    });

    NavBarType navBarType = NavBarType.message;
    switch (index) {
      case 0:
        navBarType = NavBarType.message;
        break;
      case 1:
        navBarType = NavBarType.directory;
        break;
      case 2:
        navBarType = NavBarType.discover;
        break;
      case 3:
        navBarType = NavBarType.home;
        break;
    }
    // 发送NavBar切换事件
    AppEventBus.eventBus.fire(NavbarChangeEvent(navBarType));
  }
}
