import 'package:flutter/material.dart';
import 'package:pseudo_we_chat/pages/directory/directory.dart';
import 'package:pseudo_we_chat/pages/discover/discover.dart';
import 'package:pseudo_we_chat/pages/home/home.dart';
import 'package:pseudo_we_chat/pages/message/message.dart';

class IndexPage extends StatefulWidget {
  final int index;

  const IndexPage({Key? key, this.index = 0}) : super(key: key);

  @override
  State<IndexPage> createState() => _IndexPageState();
}

class _IndexPageState extends State<IndexPage> {
  late int _index;

  @override
  void initState() {
    super.initState();
    _index = widget.index;
  }

  final List<Widget> _pageItem = const [
    MessagePage(),
    DirectoryPage(),
    DiscoverPage(),
    HomePage(),
  ];

  final Map<String, Icon> _iconMap = const {
    "message": Icon(Icons.message),
    "directory": Icon(Icons.list),
    "discover": Icon(Icons.find_in_page),
    "home": Icon(Icons.person),
  };

  final List<NavBarItem> _navBarItem = const [
    NavBarItem(icon: "message", label: "微信"),
    NavBarItem(icon: "directory", label: "通讯录"),
    NavBarItem(icon: "discover", label: "发现"),
    NavBarItem(icon: "home", label: "我的"),
  ];

  void _onBottomNavigationBarTapped(index) {
    setState(() {
      _index = index;
    });
  }

  List<BottomNavigationBarItem> _getNavBarItem() {
    return _navBarItem
        .map((e) => BottomNavigationBarItem(
            icon: _iconMap[e.icon] ?? const Icon(Icons.search), label: e.label))
        .toList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: IndexedStack(
          index: _index,
          children: _pageItem,
        ),
        bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          currentIndex: _index,
          onTap: _onBottomNavigationBarTapped,
          iconSize: 38,
          items: _getNavBarItem(),
        ));
  }
}

class NavBarItem {
  const NavBarItem({required this.icon, required this.label});

  final String icon;
  final String label;
}
