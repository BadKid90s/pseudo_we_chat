import 'package:flutter/material.dart';
import 'package:pseudo_we_chat/pages/index/index.dart';

import 'constant/style.dart';

void main() {
  runApp(const App());
}

class App extends StatelessWidget {
  const App({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          scaffoldBackgroundColor: Style.scaffoldBackgroundColor,
          appBarTheme: const AppBarTheme(
            backgroundColor: Style.appBarBackgroundColor
          )
        ),
        home: const IndexPage());
  }
}
