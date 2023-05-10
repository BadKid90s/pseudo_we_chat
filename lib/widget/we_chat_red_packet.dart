import 'package:flutter/material.dart';
import 'package:get/get.dart';

class WeChatRedPacket extends StatefulWidget {
  const WeChatRedPacket({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<WeChatRedPacket> createState() => _WeChatRedPacketState();
}

class _WeChatRedPacketState extends State<WeChatRedPacket> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      decoration: BoxDecoration(
        color: Colors.orange,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        children: [
          Expanded(
            child: Row(
              children: [
                Expanded(flex: 2, child: Image.asset("images/red_packet.png")),
                const Expanded(flex: 1, child: SizedBox()),
                 Expanded(
                  flex: 7,
                  child: Text(
                    widget.title,
                    style: const TextStyle(
                        color: Colors.white, fontWeight: FontWeight.w600),
                  ),
                ),
              ],
            ),
          ),
          const Divider(
            color: Colors.white,
          ),
          const Align(
            alignment: Alignment.centerLeft,
            child: Text(
              "微信红包",
              style: TextStyle(color: Colors.white, fontSize: 14),
            ),
          )
        ],
      ).paddingAll(10),
    );
  }
}
