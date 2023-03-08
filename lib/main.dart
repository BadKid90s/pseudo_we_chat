import 'package:country_picker/country_picker.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:get/get.dart';
import 'package:pseudo_we_chat/generated/l10n.dart';

import 'router.dart';
import 'themes.dart';

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
      theme: appLightThemeData,
      darkTheme: appDarkThemeData,
      getPages: AppPages.routes,
      initialRoute: AppPages.splash,
      supportedLocales: const [
        Locale('en'),
        Locale('zh')
      ],
      localizationsDelegates: const [
        S.delegate,
        CountryLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
    );
  }
}
