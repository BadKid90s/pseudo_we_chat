import 'package:flutter/material.dart';

// 深色模式
final ThemeData appDarkThemeData =
    _buildDarkThemeData(_buildCommonThemeData(ThemeData.dark()));

// 浅色模式
final ThemeData appLightThemeData =
    _buildLightThemeData(_buildCommonThemeData(ThemeData.light()));

ThemeData _buildCommonThemeData(ThemeData theme) {
  return theme.copyWith(
    // 点击时的高亮效果设置为透明
    splashColor: Colors.transparent,
    // 长按时的扩散效果设置为透明
    highlightColor: Colors.transparent,
    appBarTheme: theme.appBarTheme.copyWith(
      //设置AppBar的阴影效果为0
      elevation: 0,
      titleTextStyle: theme.textTheme.displayLarge
          ?.copyWith(fontSize: 20, fontWeight: FontWeight.w600),
    ),
  );
}

ThemeData _buildDarkThemeData(ThemeData theme) {
  return theme.copyWith(
    appBarTheme: theme.appBarTheme.copyWith(
      backgroundColor: Colors.black,
      foregroundColor: Colors.grey,
    ),
    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
      selectedItemColor: Colors.green,
      unselectedItemColor: Colors.white60,
    ),
  );
}

ThemeData _buildLightThemeData(ThemeData theme) {
  return theme.copyWith(
    appBarTheme: theme.appBarTheme.copyWith(
        backgroundColor: Colors.grey.shade200, foregroundColor: Colors.grey),
    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
      selectedItemColor: Colors.green,
      unselectedItemColor: Colors.black45,
    ),
  );
}
