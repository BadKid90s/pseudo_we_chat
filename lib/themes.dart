import 'package:flutter/material.dart';

// 深色模式
final ThemeData appDarkThemeData = ThemeData.dark().copyWith(
    appBarTheme: ThemeData.dark().appBarTheme.copyWith(
        color: ThemeData.dark().scaffoldBackgroundColor, elevation: 0));

// 浅色模式
final ThemeData appLightThemeData = ThemeData.light().copyWith(
    appBarTheme: ThemeData.light().appBarTheme.copyWith(
        color: ThemeData.light().scaffoldBackgroundColor, elevation: 0));
