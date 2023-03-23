import 'package:country_picker/country_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:get/get.dart';
import 'package:pseudo_we_chat/api/interface/user/model/user_status.dart';
import 'package:pseudo_we_chat/api/interface/user/user.dart';
import 'package:pseudo_we_chat/router.dart';
import 'package:styled_widget/styled_widget.dart';

class SignupController extends GetxController {
  var phoneCode = "86".obs;
  var phone = "".obs;
  var nikeName = "".obs;
  var password = "".obs;
  var region = Rxn<String>(null);
  var consentAgreement = true.obs;

  void changeRegion(String code, String? regionName) {
    phoneCode(code);
    region(regionName);
  }

  Future<bool> signup() async {
    UserStatus userStatus = await UserApi.userSignup(
        "avatar", nikeName.value, phone.value, password.value);
    return userStatus.status;
  }
}

class SignupPage extends GetView<SignupController> {
  const SignupPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Scaffold(
        appBar: AppBar(
          leading: IconButton(
            icon: Icon(
              Icons.close,
              color: context.iconColor,
              size: 30,
            ),
            onPressed: () {
              Get.offAndToNamed(AppRoutes.root);
            },
          ),
        ),
        body: Column(
          children: [
            Expanded(
              flex: 2,
              child: Container(
                // color: Colors.green,
                alignment: Alignment.bottomCenter,
                child: Text(
                  AppLocalizations.of(context)!.signup_title,
                  style: context.textTheme.headlineSmall,
                ),
              ),
            ),
            Expanded(
              flex: 4,
              child: Container(
                // color: Colors.yellow,
                alignment: Alignment.center,
                child: TextButton(
                  onPressed: () {},
                  child: Icon(
                    Icons.image,
                    size: 114,
                    color: context.theme.primaryColorLight,
                  ),
                ),
              ),
            ),
            Expanded(
              flex: 8,
              child: Container(
                // color: Colors.red,
                alignment: Alignment.center,
                child: Column(
                  children: [
                    _buildDivider(),
                    _buildNickName(context),
                    _buildRegionView(
                      context,
                      title: AppLocalizations.of(context)!.signup_phone_region,
                      onChanged: (val) => controller.region(val),
                    ),
                    _buildDivider(),
                    _buildPhoneView(context),
                    _buildPassword(context),
                    _buildDivider(),
                  ],
                ),
              ).paddingSymmetric(horizontal: 40),
            ),
            Expanded(
              flex: 7,
              child: Container(
                // color: Colors.blue,
                alignment: Alignment.center,
                child: Column(
                  children: [
                    Flex(
                      direction: Axis.horizontal,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        InkWell(
                          child: Container(
                            width: 20,
                            height: 20,
                            decoration: BoxDecoration(
                              border: Border.all(
                                  color: Colors.black26,
                                  width: 5,
                                  style: BorderStyle.solid),
                              shape: BoxShape.circle,
                              color: controller.consentAgreement.value
                                  ? Colors.cyanAccent
                                  : Colors.grey,
                            ),
                          ).paddingAll(5),
                          onTap: () {
                            controller.consentAgreement(
                                !controller.consentAgreement.value);
                          },
                        ),
                        Text(AppLocalizations.of(context)!
                            .signup_agreement_title),
                      ],
                    ),
                    Text(AppLocalizations.of(context)!
                        .signup_agreement_subtitle),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        elevation: 0,
                        backgroundColor: Colors.green,
                      ),
                      onPressed: () async {
                        var status = await controller.signup();
                        if (status) {
                          Get.offNamed(AppRoutes.loginPhone);
                        }
                      },
                      child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20),
                          child: Text(
                            AppLocalizations.of(context)!.signup_button_title,
                            style: const TextStyle(
                                fontSize: 18,
                                wordSpacing: 2,
                                letterSpacing: 2,
                                color: Colors.white),
                          )),
                    ).height(50).paddingAll(30)
                  ],
                ),
              ),
            ),
          ],
        ),
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
              backgroundColor: context.theme.primaryColor,
              textStyle: context.textTheme.titleMedium,
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
            onSelect: (Country country) => controller.changeRegion(
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
                controller.region.value ??
                    AppLocalizations.of(context)!.login_phone_default_region,
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

  Widget _buildPhoneView(BuildContext context) {
    return _buildPhoneInputView(context,
        title: AppLocalizations.of(context)!.signup_phone_phone,
        hintText: AppLocalizations.of(context)!.signup_phone_phone_hint_text,
        onChanged: (value) => controller.phone(value),
        inputFormatters: [
          FilteringTextInputFormatter.digitsOnly, //只允许输入数字
          LengthLimitingTextInputFormatter(11) //限制长度
        ]);
  }

  Widget _buildNickName(BuildContext context) {
    return _buildInputView(context,
        title: AppLocalizations.of(context)!.signup_nike_name,
        hintText: AppLocalizations.of(context)!.signup_nike_name_hint_text,
        onChanged: (value) => controller.nikeName(value),
        inputFormatters: [
          LengthLimitingTextInputFormatter(11) //限制长度
        ]);
  }

  Widget _buildPassword(BuildContext context) {
    return _buildInputView(context,
        title: AppLocalizations.of(context)!.signup_password,
        hintText: AppLocalizations.of(context)!.signup_password_hint_text,
        obscureText: true,
        onChanged: (value) => controller.password(value),
        inputFormatters: [
          FilteringTextInputFormatter.digitsOnly, //只允许输入数字
          LengthLimitingTextInputFormatter(11) //限制长度
        ]);
  }

  Widget _buildPhoneInputView(
    BuildContext context, {
    required String title,
    required String hintText,
    ValueChanged<String>? onChanged,
    List<TextInputFormatter>? inputFormatters,
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
              child: Text("+${controller.phoneCode.value}",
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
            inputFormatters: inputFormatters,
            onChanged: onChanged,
          ),
        ),
      ],
    ).height(60);
  }

  Widget _buildInputView(
    BuildContext context, {
    required String title,
    required String hintText,
    ValueChanged<String>? onChanged,
    List<TextInputFormatter>? inputFormatters,
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
          flex: 9,
          child: TextField(
            obscureText: obscureText,
            decoration: InputDecoration(
              border: InputBorder.none,
              hintText: hintText,
            ),
            keyboardType: TextInputType.phone,
            inputFormatters: inputFormatters,
            onChanged: onChanged,
          ),
        ),
      ],
    ).height(60);
  }
}
