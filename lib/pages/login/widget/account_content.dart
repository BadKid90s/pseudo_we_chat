import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:pseudo_we_chat/pages/login/login_account.dart';
import 'package:pseudo_we_chat/pages/login/widget/onth_login.dart';
import 'package:pseudo_we_chat/router.dart';
import 'package:styled_widget/styled_widget.dart';

class AccountContent extends StatelessWidget {
  const AccountContent(this.flex, {super.key});

  final int flex;

  static LoginAccountController get _controller =>
      Get.find<LoginAccountController>();

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Expanded(
        flex: flex,
        child: Column(
          children: [
            _buildDivider(),
            _buildRowView(
              context,
              title: AppLocalizations.of(context)!.login_account_username,
              hintText:
                  AppLocalizations.of(context)!.login_account_username_hint_text,
              onChanged: (val) => _controller.changeUsername(val),
            ),
            _buildDivider(),
            _buildRowView(
              context,
              title: AppLocalizations.of(context)!.login_account_password,
              hintText:
                  AppLocalizations.of(context)!.login_account_password_hint_text,
              obscureText: true,
              onChanged: (val) => _controller.changePassword(val),
            ),
            _buildDivider(),
            if (_controller.message.value != null)
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  _controller.message.value!,
                  style: const TextStyle(color: Colors.red),
                ),
              ),
            OtherLogin(
              title: AppLocalizations.of(context)!.login_account_use_phone_login,
              buttonPressed: () => Get.offAndToNamed(AppRoutes.loginPhone),
            ),
          ],
        ).paddingSymmetric(horizontal: 40),
      ),
    );
  }

  Widget _buildDivider() {
    return const Divider(height: 1, thickness: 1);
  }

  Widget _buildRowView(
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
          flex: 7,
          child: TextField(
            obscureText: obscureText,
            decoration: InputDecoration(
              border: InputBorder.none,
              hintText: hintText,
            ),
            onChanged: onChanged,
          ),
        ),
      ],
    ).height(60);
  }
}
