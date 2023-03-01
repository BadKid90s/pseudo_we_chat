import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'i18n.dart';
import 'router.dart';
import 'dart:ui';

void main() {
  runApp(const App());
}

class App extends StatelessWidget {
  const App({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      // 国际化
      translations: I18nMessages(),
      // 读取系统语言
      locale: window.locale,
      // locale: const Locale('en', 'US'),
      // 将会按照此处指定的语言翻译
      fallbackLocale: const Locale('zh', 'CN'),
      theme: ThemeData(
        useMaterial3: true,
        colorSchemeSeed: Colors.blue,
      ),
      getPages: AppPages.routes,
      initialRoute: AppPages.initial,
    );
  }
}
