// GENERATED CODE - DO NOT MODIFY BY HAND
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'intl/messages_all.dart';

// **************************************************************************
// Generator: Flutter Intl IDE plugin
// Made by Localizely
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, lines_longer_than_80_chars
// ignore_for_file: join_return_with_assignment, prefer_final_in_for_each
// ignore_for_file: avoid_redundant_argument_values, avoid_escaping_inner_quotes

class AppLocalizations {
  AppLocalizations();

  static AppLocalizations? _current;

  static AppLocalizations get current {
    assert(_current != null,
        'No instance of AppLocalizations was loaded. Try to initialize the AppLocalizations delegate before accessing AppLocalizations.current.');
    return _current!;
  }

  static const AppLocalizationDelegate delegate = AppLocalizationDelegate();

  static Future<AppLocalizations> load(Locale locale) {
    final name = (locale.countryCode?.isEmpty ?? false)
        ? locale.languageCode
        : locale.toString();
    final localeName = Intl.canonicalizedLocale(name);
    return initializeMessages(localeName).then((_) {
      Intl.defaultLocale = localeName;
      final instance = AppLocalizations();
      AppLocalizations._current = instance;

      return instance;
    });
  }

  static AppLocalizations of(BuildContext context) {
    final instance = AppLocalizations.maybeOf(context);
    assert(instance != null,
        'No instance of AppLocalizations present in the widget tree. Did you add AppLocalizations.delegate in localizationsDelegates?');
    return instance!;
  }

  static AppLocalizations? maybeOf(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations);
  }

  /// `log in`
  String get login_login_button_title {
    return Intl.message(
      'log in',
      name: 'login_login_button_title',
      desc: '',
      args: [],
    );
  }

  /// `sign up`
  String get login_signup_button_title {
    return Intl.message(
      'sign up',
      name: 'login_signup_button_title',
      desc: '',
      args: [],
    );
  }

  /// `WeChat/QQ/Email`
  String get login_account_title {
    return Intl.message(
      'WeChat/QQ/Email',
      name: 'login_account_title',
      desc: '',
      args: [],
    );
  }

  /// `account`
  String get login_account_username {
    return Intl.message(
      'account',
      name: 'login_account_username',
      desc: '',
      args: [],
    );
  }

  /// `password`
  String get login_account_password {
    return Intl.message(
      'password',
      name: 'login_account_password',
      desc: '',
      args: [],
    );
  }

  /// `WeChat/QQ/Email`
  String get login_account_username_hint_text {
    return Intl.message(
      'WeChat/QQ/Email',
      name: 'login_account_username_hint_text',
      desc: '',
      args: [],
    );
  }

  /// `Please Enter Password`
  String get login_account_password_hint_text {
    return Intl.message(
      'Please Enter Password',
      name: 'login_account_password_hint_text',
      desc: '',
      args: [],
    );
  }

  /// `Use Phone Number Login`
  String get login_account_use_phone_login {
    return Intl.message(
      'Use Phone Number Login',
      name: 'login_account_use_phone_login',
      desc: '',
      args: [],
    );
  }

  /// `The above WeChat/QQ/Email are only used for verification`
  String get login_account_bottom_title {
    return Intl.message(
      'The above WeChat/QQ/Email are only used for verification',
      name: 'login_account_bottom_title',
      desc: '',
      args: [],
    );
  }

  /// `Agree And Log In`
  String get login_account_bottom_button_title {
    return Intl.message(
      'Agree And Log In',
      name: 'login_account_bottom_button_title',
      desc: '',
      args: [],
    );
  }

  /// `Please enter the correct WeChat/QQ/Email number`
  String get login_account_username_verify_message {
    return Intl.message(
      'Please enter the correct WeChat/QQ/Email number',
      name: 'login_account_username_verify_message',
      desc: '',
      args: [],
    );
  }

  /// `Please enter a password`
  String get login_account_password_verify_message {
    return Intl.message(
      'Please enter a password',
      name: 'login_account_password_verify_message',
      desc: '',
      args: [],
    );
  }

  /// `Phone Number Login`
  String get login_phone_title {
    return Intl.message(
      'Phone Number Login',
      name: 'login_phone_title',
      desc: '',
      args: [],
    );
  }

  /// `Country`
  String get login_phone_region {
    return Intl.message(
      'Country',
      name: 'login_phone_region',
      desc: '',
      args: [],
    );
  }

  /// `Phone`
  String get login_phone_phone {
    return Intl.message(
      'Phone',
      name: 'login_phone_phone',
      desc: '',
      args: [],
    );
  }

  /// `Please fill in the mobile phone number`
  String get login_phone_phone_hint_text {
    return Intl.message(
      'Please fill in the mobile phone number',
      name: 'login_phone_phone_hint_text',
      desc: '',
      args: [],
    );
  }

  /// `Log in using a different method`
  String get login_phone_use_other_login {
    return Intl.message(
      'Log in using a different method',
      name: 'login_phone_use_other_login',
      desc: '',
      args: [],
    );
  }

  /// `The above phone number is for verification only`
  String get login_phone_bottom_title {
    return Intl.message(
      'The above phone number is for verification only',
      name: 'login_phone_bottom_title',
      desc: '',
      args: [],
    );
  }

  /// `Agree And Continue`
  String get login_phone_bottom_button_title {
    return Intl.message(
      'Agree And Continue',
      name: 'login_phone_bottom_button_title',
      desc: '',
      args: [],
    );
  }

  /// `Please enter phone number`
  String get login_phone_phone_verify_message {
    return Intl.message(
      'Please enter phone number',
      name: 'login_phone_phone_verify_message',
      desc: '',
      args: [],
    );
  }

  /// `China`
  String get login_phone_default_region {
    return Intl.message(
      'China',
      name: 'login_phone_default_region',
      desc: '',
      args: [],
    );
  }

  /// `Wechat`
  String get index_message {
    return Intl.message(
      'Wechat',
      name: 'index_message',
      desc: '',
      args: [],
    );
  }

  /// `Directory`
  String get index_directory {
    return Intl.message(
      'Directory',
      name: 'index_directory',
      desc: '',
      args: [],
    );
  }

  /// `Discover`
  String get index_discover {
    return Intl.message(
      'Discover',
      name: 'index_discover',
      desc: '',
      args: [],
    );
  }

  /// `Home`
  String get index_home {
    return Intl.message(
      'Home',
      name: 'index_home',
      desc: '',
      args: [],
    );
  }
}

class AppLocalizationDelegate extends LocalizationsDelegate<AppLocalizations> {
  const AppLocalizationDelegate();

  List<Locale> get supportedLocales {
    return const <Locale>[
      Locale.fromSubtags(languageCode: 'en'),
      Locale.fromSubtags(languageCode: 'zh'),
    ];
  }

  @override
  bool isSupported(Locale locale) => _isSupported(locale);
  @override
  Future<AppLocalizations> load(Locale locale) => AppLocalizations.load(locale);
  @override
  bool shouldReload(AppLocalizationDelegate old) => false;

  bool _isSupported(Locale locale) {
    for (var supportedLocale in supportedLocales) {
      if (supportedLocale.languageCode == locale.languageCode) {
        return true;
      }
    }
    return false;
  }
}
