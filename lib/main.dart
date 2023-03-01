import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'router.dart';

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
      theme: ThemeData(
        useMaterial3: true,
        colorSchemeSeed: Colors.blue,
      ),
      getPages: AppPages.routes,
      initialRoute: AppPages.initial,
    );
  }
}
