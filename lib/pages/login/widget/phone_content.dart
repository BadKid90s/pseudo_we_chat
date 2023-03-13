import 'dart:ffi';

import 'package:country_picker/country_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:pseudo_we_chat/generated/l10n.dart';
import 'package:pseudo_we_chat/pages/login/login_phone.dart';
import 'package:pseudo_we_chat/pages/login/widget/onth_login.dart';
import 'package:pseudo_we_chat/router.dart';
import 'package:styled_widget/styled_widget.dart';

class PhoneContent extends StatelessWidget {
  const PhoneContent(this.flex, {super.key});

  final int flex;

  static LoginPhoneController get _controller =>
      Get.find<LoginPhoneController>();

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Expanded(
        flex: flex,
        child: Column(
          children: [
            _buildDivider(),
            _buildRegionView(
              context,
              title: AppLocalizations.of(context).login_phone_region,
              onChanged: (val) => _controller.region(val),
            ),
            _buildDivider(),
            _buildPhoneView(
              context,
              title: AppLocalizations.of(context).login_phone_phone,
              hintText: AppLocalizations.of(context).login_phone_phone_hint_text,
              onChanged: (val) => _controller.phone(val),
            ),
            _buildDivider(),
            OtherLogin(
              title: AppLocalizations.of(context).login_phone_use_other_login,
              buttonPressed: () => Get.offAndToNamed(AppRoutes.loginAccount),
            ),
          ],
        ).paddingSymmetric(horizontal: 40),
      ),
    );
  }

  Widget _buildDivider() {
    return const Divider(height: 1, thickness: 1);
  }

  Widget _buildRegionView(
    BuildContext context, {
    required String title,
    required ValueChanged<String> onChanged,
  }) {
    return InkWell(
      onTap: () {
        showCountryPicker(
            context: context,
            countryListTheme: CountryListThemeData(
              flagSize: 25,
              backgroundColor: Colors.white,
              textStyle: const TextStyle(fontSize: 16, color: Colors.blueGrey),
              // Optional. Country list modal height
              //Optional. Sets the border radius for the bottomsheet.
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(20.0),
                topRight: Radius.circular(20.0),
              ),
              //Optional. Styles the search field.
              inputDecoration: InputDecoration(
                prefixIcon: const Icon(Icons.search),
                border: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: const Color(0xFF8C98A8).withOpacity(0.2),
                  ),
                ),
              ),
            ),
            onSelect: (Country country) => _controller.changeRegion(
                country.phoneCode, country.nameLocalized));
      },
      child: Row(
        children: [
          Expanded(
            flex: 3,
            child: Container(
                alignment: Alignment.centerLeft,
                child: Text(title, style: context.textTheme.titleMedium)),
          ),
          Expanded(
            flex: 8,
            child: Center(
              child: Text(
                _controller.region.value ??
                    AppLocalizations.of(context).login_phone_default_region,
                style: context.textTheme.titleMedium,
              ),
            ).paddingOnly(left: 5),
          ),
          const Expanded(
            flex: 1,
            child: Icon(Icons.chevron_right_outlined),
          ),
        ],
      ).height(60),
    );
  }

  Widget _buildPhoneView(
    BuildContext context, {
    required String title,
    required String hintText,
    required ValueChanged<String> onChanged,
    bool obscureText = false,
  }) {
    return Row(
      children: [
        Expanded(
          flex: 3,
          child: Container(
              alignment: Alignment.centerLeft,
              child: Text(title, style: context.textTheme.titleMedium)),
        ),
        Expanded(
          flex: 2,
          child: Container(
              alignment: Alignment.centerLeft,
              child: Text("+${_controller.phoneCode.value}",
                  style: context.textTheme.titleMedium)),
        ),
        Expanded(
          flex: 7,
          child: TextField(
            obscureText: obscureText,
            decoration: InputDecoration(
              border: InputBorder.none,
              hintText: hintText,
            ),
            keyboardType: TextInputType.phone,
            inputFormatters: [
              FilteringTextInputFormatter.digitsOnly, //只允许输入数字
              LengthLimitingTextInputFormatter(11) //限制长度
            ],
            onChanged: onChanged,
          ),
        ),
      ],
    ).height(60);
  }
}
