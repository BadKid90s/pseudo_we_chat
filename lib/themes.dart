import 'package:flutter/material.dart';

// 深色模式
final ThemeData appDarkThemeData = _getThemeData(ThemeData.dark()).copyWith(
  bottomNavigationBarTheme: const BottomNavigationBarThemeData(
    selectedItemColor: Colors.green,
    unselectedItemColor: Colors.white60,
  ),
);

// 浅色模式
final ThemeData appLightThemeData = _getThemeData(ThemeData.light()).copyWith(
  bottomNavigationBarTheme: const BottomNavigationBarThemeData(
    selectedItemColor: Colors.green,
    unselectedItemColor: Colors.grey,
  ),
);

ThemeData _getThemeData(ThemeData theme) {
  return theme.copyWith(
    // 点击时的高亮效果设置为透明
    splashColor: Colors.transparent,
    // 长按时的扩散效果设置为透明
    highlightColor: Colors.transparent,
    appBarTheme: theme.appBarTheme.copyWith(
      //设置AppBar背景颜色与脚手架背景色相同
      backgroundColor: theme.scaffoldBackgroundColor,
      //设置AppBar的阴影效果为0
      elevation: 0,
      titleTextStyle: theme.textTheme.displayLarge
          ?.copyWith(fontSize: 20, fontWeight: FontWeight.w600),
    ),
  );
}
