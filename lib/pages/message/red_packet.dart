import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class RedPacketController extends GetxController {
  final RxDouble money = RxDouble(0.00);

  final TextEditingController _textEditingController = TextEditingController();
}

class RedPacket extends GetView<RedPacketController> {
  const RedPacket({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("发红包"),
      ),
      body: Column(
        children: [
          Expanded(
            flex: 3,
            child: Column(
              children: [
                Container(
                  height: 50,
                  decoration: BoxDecoration(
                    color: context.theme.primaryColor,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "金额",
                        style: context.textTheme.titleMedium,
                      ),
                      Expanded(
                        child: TextFormField(
                          controller: controller._textEditingController,
                          onChanged: (value) {},
                          inputFormatters: [
                            NumberInputFormatter(),
                            FilteringTextInputFormatter.allow(
                                RegExp('[0-9.¥]+'))
                          ],
                          textAlign: TextAlign.right,
                          keyboardType: TextInputType.number,
                          maxLines: 1,
                          decoration: const InputDecoration(
                            hintText: "¥0.00",
                            border: InputBorder.none,
                          ),
                        ),
                      )
                    ],
                  ).paddingSymmetric(horizontal: 10),
                )
                    .paddingSymmetric(horizontal: 10)
                    .marginSymmetric(vertical: 10),
                Container(
                  height: 50,
                  decoration: BoxDecoration(
                    color: context.theme.primaryColor,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "恭喜发财",
                        style: context.textTheme.titleMedium,
                      ),
                      Text("😊"),
                    ],
                  ).paddingSymmetric(horizontal: 10),
                )
                    .paddingSymmetric(horizontal: 10)
                    .marginSymmetric(vertical: 10),
              ],
            ),
          ),
          Expanded(
              flex: 7,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    "¥${controller.money.toStringAsFixed(2)}",
                    style: context.textTheme.displaySmall,
                  ).paddingSymmetric(vertical: 10),
                  SizedBox(
                    width: 200,
                    height: 60,
                    child: ElevatedButton(
                      style:
                          ElevatedButton.styleFrom(backgroundColor: Colors.red),
                      onPressed: () {},
                      child: Text(
                        "塞钱进红包",
                        style: context.textTheme.titleLarge?.copyWith(
                            color: context.theme.primaryColor,
                            fontWeight: FontWeight.w900),
                      ),
                    ),
                  )
                ],
              ))
        ],
      ),
    );
  }
}

class NumberInputFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue, TextEditingValue newValue) {
    String numberString = newValue.text;
    int decimalIndex = numberString.indexOf('.');
    var decimalPlaces = numberString.length - decimalIndex - 1;

    if (decimalIndex >=0 && decimalPlaces > 2) {
      return oldValue;
    }

    if (newValue.text.isEmpty) {
      return newValue.copyWith(text: '');
    } else if (newValue.text.compareTo(oldValue.text) != 0) {
      if (newValue.text.contains("¥")) {
        return newValue;
      }
      return newValue.copyWith(
        text: '¥${newValue.text}',
        selection: TextSelection.collapsed(
          offset: newValue.text.length + 1,
        ),
      );
    } else {
      return newValue;
    }
  }
}
