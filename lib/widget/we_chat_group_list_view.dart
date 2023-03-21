import 'package:flutter/material.dart';
import 'package:get/get.dart';

class WeChatGroupListView<T> extends StatefulWidget {
  const WeChatGroupListView({
    Key? key,
    required this.data,
    required this.itemBuilder,
  }) : super(key: key);

  final List<List<T>> data;

  final Widget Function(BuildContext context, T item, bool isLast) itemBuilder;

  @override
  State<WeChatGroupListView> createState() => _WeChatGroupListViewState();
}

class _WeChatGroupListViewState extends State<WeChatGroupListView> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: widget.data.mapMany((element) {
        var list = element.asMap().entries.map((e) {
          var isLast = element.length - 1 == e.key;
          return widget.itemBuilder(context, e.value, isLast);
        }).toList();
        list.add(buildSeparateBox());
        return list;
      }).toList(),
    );
  }

  Widget buildSeparateBox() {
    return const SizedBox(
      height: 10,
    );
  }
}
