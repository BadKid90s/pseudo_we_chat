import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:pseudo_we_chat/router.dart';

class RedPacketController extends GetxController {
  final RxDouble money = RxDouble(0.00);

  final TextEditingController _moneyController = TextEditingController();
  final TextEditingController _titleController = TextEditingController();

  final moneyText = "¥0.00".obs;
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
                            controller
                                .moneyText(value.isEmpty ? "¥0.00" : value);
                          },
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
                      Expanded(
                        child: TextFormField(
                          controller: controller._titleController,
                          keyboardType: TextInputType.text,
                          maxLength: 12,
                          maxLines: 1,
                          decoration: const InputDecoration(
                            hintText: "恭喜发财",
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
                        Get.offNamed(AppRoutes.redPacket,parameters: {
                          "money":controller._moneyController.text.replaceFirst("¥", ''),
                          "title":controller._titleController.text,
                        });
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
