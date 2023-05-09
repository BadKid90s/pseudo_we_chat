import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:pseudo_we_chat/router.dart';

class RedPacketController extends GetxController {
  final TextEditingController _moneyController = TextEditingController();
  final TextEditingController _titleController = TextEditingController();

  final moneyText = "¥0.00".obs;
  final defaultMoneyText = "¥0.00";
  final defaultMoneyTitleText = "恭喜发财";

  String get moneyValue =>
      (_moneyController.text.isEmpty ? defaultMoneyText : _moneyController.text)
          .replaceFirst("¥", '');

  String get titleValue => _titleController.text.isEmpty
      ? defaultMoneyTitleText
      : _titleController.text;

  void back() {
    var money = double.parse(moneyValue);
    if (money < 0.01) {
      Get.defaultDialog(title: "⚠️",content: const Text("金额必须大于0.01"));
      return;
    } else if (money > 200) {
      Get.defaultDialog(title: "⚠️",content: const Text("金额必须小于200"));
      return;
    }
    Get.offNamed(AppRoutes.chat, parameters: {
      "money": moneyValue,
      "title": titleValue,
    });
  }
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
                          controller: controller._moneyController,
                          onChanged: (value) {
                            controller.moneyText(value.isEmpty
                                ? controller.defaultMoneyText
                                : value);
                          },
                          inputFormatters: [
                            NumberInputFormatter(),
                            FilteringTextInputFormatter.allow(
                                RegExp('[0-9.¥]+'))
                          ],
                          textAlign: TextAlign.right,
                          keyboardType: TextInputType.number,
                          maxLines: 1,
                          decoration: InputDecoration(
                            hintText: controller.defaultMoneyText,
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
                      Expanded(
                        child: TextFormField(
                          controller: controller._titleController,
                          keyboardType: TextInputType.text,
                          maxLines: 1,
                          decoration: InputDecoration(
                            hintText: controller.defaultMoneyTitleText,
                            border: InputBorder.none,
                          ),
                        ),
                      )
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
                  Obx(() => Text(
                        controller.moneyText.value,
                        style: context.textTheme.displaySmall,
                      ).paddingSymmetric(vertical: 10)),
                  SizedBox(
                    width: 200,
                    height: 60,
                    child: ElevatedButton(
                      style:
                          ElevatedButton.styleFrom(backgroundColor: Colors.red),
                      onPressed: () {
                        controller.back();
                      },
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

    if (decimalIndex >= 0 && decimalPlaces > 2) {
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
