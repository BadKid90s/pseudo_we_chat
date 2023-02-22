import 'package:flutter/material.dart';
import 'package:pseudo_we_chat/constant/style.dart';

class SearchView extends StatefulWidget {
  const SearchView({Key? key, this.text = "搜索", this.icon, this.onPressed})
      : super(key: key);
  final String text;
  final Icon? icon;
  final VoidCallback? onPressed;

  @override
  State<SearchView> createState() => _SearchViewState();
}

class _SearchViewState extends State<SearchView> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.only(left: 10, right: 10, top: 5, bottom: 5),
      decoration:
          const BoxDecoration(color: Style.messageSearchBackgroundColor),
      child: ElevatedButton(
        style: ButtonStyle(
            elevation: MaterialStateProperty.all(0),
            backgroundColor: MaterialStateProperty.all(Colors.white)),
        onPressed: widget.onPressed,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            widget.icon != null ? widget.icon! : const Icon(Icons.search),
            Text(
              widget.text,
              style: const TextStyle(fontSize: 20, color: Colors.grey),
            )
          ],
        ),
      ),
    );
  }
}
