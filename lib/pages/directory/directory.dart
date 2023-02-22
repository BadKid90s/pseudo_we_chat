import 'package:flutter/material.dart';
import 'package:pseudo_we_chat/constant/style.dart';
import 'package:pseudo_we_chat/ui/search.dart';
import 'package:section_view/section_view.dart';

class DirectoryPage extends StatefulWidget {
  const DirectoryPage({Key? key}) : super(key: key);

  @override
  State<DirectoryPage> createState() => _DirectoryPageState();
}

class _DirectoryPageState extends State<DirectoryPage> {
  final List<DirectoryGroupData> _list = [
    DirectoryGroupData(groupName: "", list: [
      DirectoryData(
        id: BigInt.from(-1),
        avatar: "images/friend.png",
        name: "新的朋友",
        initial: "",
      ),
      DirectoryData(
        id: BigInt.from(-1),
        avatar: "images/group_chat.png",
        name: "群聊",
        initial: "",
      ),
      DirectoryData(
        id: BigInt.from(-1),
        avatar: "images/label.png",
        name: "标签",
        initial: "",
      ),
      DirectoryData(
        id: BigInt.from(-1),
        avatar: "images/official_accounts.png",
        name: "公众号",
        initial: "",
      )
    ])
  ];

  final List<DirectoryData> _dataList = [
    DirectoryData(
      id: BigInt.from(1),
      avatar:
          "https://d36tnp772eyphs.cloudfront.net/blogs/1/2018/02/Taj-Mahal.jpg",
      name: "啊三",
      initial: "a",
    ),
    DirectoryData(
      id: BigInt.from(11),
      avatar: "https://www.itying.com/images/flutter/1.png",
      name: "阿衰",
      initial: "a",
    ),
    DirectoryData(
      id: BigInt.from(12),
      avatar: "https://www.itying.com/images/flutter/1.png",
      name: "阿里巴巴",
      initial: "a",
    ),
    DirectoryData(
      id: BigInt.from(2),
      avatar: "https://www.itying.com/images/flutter/2.png",
      name: "在水一方",
      initial: "z",
      remarks: "xxxx",
    ),
    DirectoryData(
      id: BigInt.from(2),
      avatar: "https://www.itying.com/images/flutter/2.png",
      name: "晚秋骄阳",
      initial: "w",
    ),
    DirectoryData(
      id: BigInt.from(2),
      avatar: "https://www.itying.com/images/flutter/3.png",
      name: "云淡风轻",
      initial: "y",
    ),
    DirectoryData(
      id: BigInt.from(2),
      avatar: "https://www.itying.com/images/flutter/3.png",
      name: "人已老心未老",
      initial: "r",
    ),
    DirectoryData(
      id: BigInt.from(2),
      avatar: "https://www.itying.com/images/flutter/1.png",
      name: "回忆",
      initial: "h",
    ),
    DirectoryData(
      id: BigInt.from(2),
      avatar: "https://www.itying.com/images/flutter/1.png",
      name: "人生岁月老添辉",
      initial: "r",
    ),
    DirectoryData(
      id: BigInt.from(3),
      avatar: "https://www.itying.com/images/flutter/2.png",
      name: "浪漫人生",
      initial: "l",
    ),
    DirectoryData(
      id: BigInt.from(4),
      avatar: "https://www.itying.com/images/flutter/1.png",
      name: "时光荏苒",
      initial: "s",
    ),
    DirectoryData(
      id: BigInt.from(4),
      avatar: "https://www.itying.com/images/flutter/3.png",
      name: "上善若水",
      initial: "s",
    ),
  ];

  late final ScrollController _scrollController;

  @override
  void initState() {
    super.initState();

    Map<String, List<DirectoryData>> map = {
      for (var e in _dataList)
        e.initial: _dataList.where((item) => item.initial == e.initial).toList()
    };
    var tempData = map.keys
        .map((key) => DirectoryGroupData(groupName: key, list: map[key]!))
        .toList();
    _list.addAll(tempData);
    _list.sort((a, b) => a.groupName.compareTo(b.groupName));

    _scrollController = ScrollController();
    _scrollController.addListener(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            elevation: 0,
            title: const Text(
              "通讯录",
              style: TextStyle(color: Style.appBarTextColor),
            ),
            backgroundColor: Style.appBarBackgroundColor),
        body: Container(
          color: Style.contentBackgroundColor,
          child:  SectionView<DirectoryGroupData, DirectoryData>(
            source: _list,
            onFetchListData: (header) => header.list,
            enableSticky: true,
            alphabetAlign: Alignment.center,
            alphabetInset: const EdgeInsets.all(4.0),
            headerBuilder: (context, headerData, headerIndex) {
              if (headerData.groupName == '') {
                return const SearchView();
              }
              return Container(
                  alignment: Alignment.centerLeft,
                  height: 30,
                  color: Style.groupBackgroundColor,
                  padding: const EdgeInsets.only(left: 15, top: 5, bottom: 5),
                  child: Text(headerData.groupName.toUpperCase()));
            },
            itemBuilder: (context, itemData, itemIndex, headerData, headerIndex) {
              return Container(
                color: Style.contentBackgroundColor,
                child: Column(
                  children: [
                    //构建列表信息
                    ListTile(
                      leading: itemData.avatar.startsWith("images")
                          ? Image.asset(
                        itemData.avatar,
                        width: 50,
                        height: 50,
                      )
                          : Image.network(
                        itemData.avatar,
                        width: 50,
                        height: 50,
                        fit: BoxFit.cover,
                      ),
                      title: Text(itemData.name),
                    ),
                    //构建下划线
                    _buildUnderline(headerData.list, itemIndex,
                        _list.length - 1 == headerIndex),
                    //构建总人数统计
                    _buildCountPersonNum(
                        _list.length - 1 == headerIndex &&
                            headerData.list.length - 1 == itemIndex,
                        _list.map((e) => e.list.length).fold(0,
                                (previousValue, element) => previousValue + element))
                  ],
                ),
              );
            },
            alphabetBuilder: (context, headerData, isCurrent, headerIndex) {
              return isCurrent
                  ? SizedBox(
                  width: 18,
                  height: 18,
                  child: Container(
                      decoration: BoxDecoration(
                          color: Colors.grey[400],
                          borderRadius: BorderRadius.circular(9)),
                      child: Center(
                          child: Text(
                            headerData.groupName == ''
                                ? "🔍"
                                : headerData.groupName,
                            style: const TextStyle(
                                color: Colors.white, fontSize: 12),
                          ))))
                  : Text(
                headerData.groupName == '' ? "🔍" : headerData.groupName,
                style: const TextStyle(color: Color(0xFF767676)),
              );
            },
          ),
        )
    );
  }

  Widget _buildUnderline(
      List<DirectoryData> data, int currentIndex, bool isLastGroup) {
    int dataSize = data.length;
    bool isLastItem = (dataSize - 1 == currentIndex);
    // 最后一组,最后一个不需要缩进，直接添加下划线，其余的添加缩进下划线
    if (isLastGroup) {
      return Padding(
        padding: isLastItem
            ? const EdgeInsets.only()
            : const EdgeInsets.only(left: 80),
        child: const Divider(),
      );
    }
    //如果只有一个元素不添加下划线
    if (dataSize <= 1 || isLastItem) {
      return const SizedBox.shrink();
    }

    //其余添加缩进下划线
    return const Padding(
      padding: EdgeInsets.only(left: 80),
      child: Divider(),
    );
  }

  Widget _buildCountPersonNum(bool isLastItem, int num) {
    if (isLastItem) {
      return Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            "共$num个朋友",
            style: const TextStyle(fontSize: 18, color: Colors.grey),
          )
        ],
      );
    }
    return const SizedBox.shrink();
  }
}

class DirectoryData {
  const DirectoryData(
      {required this.id,
      required this.avatar,
      required this.initial,
      required this.name,
      this.remarks});

  /// id
  final BigInt id;

  /// 头像
  final String avatar;

  /// 名称
  final String name;

  /// 首字母
  final String initial;

  /// 备注
  final String? remarks;
}

class DirectoryGroupData {
  const DirectoryGroupData({
    required this.groupName,
    required this.list,
  });

  /// 分组名称
  final String groupName;

  /// 分组数据
  final List<DirectoryData> list;
}
