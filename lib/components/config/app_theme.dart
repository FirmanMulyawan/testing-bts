import 'package:flutter/material.dart';

import 'app_style.dart';

class AppTheme {
  static final ThemeData themeLight = ThemeData(
    brightness: Brightness.light,
    floatingActionButtonTheme: const FloatingActionButtonThemeData(
      backgroundColor: AppStyle.bluePrimary,
    ),
    primaryColor: AppStyle.white,
    scaffoldBackgroundColor: AppStyle.white,
    appBarTheme: const AppBarTheme(
        elevation: 4,
        backgroundColor: AppStyle.white,
        foregroundColor: Colors.white),
    textTheme: const TextTheme(
      bodyMedium: TextStyle(color: AppStyle.bluePrimary),
      bodyLarge: TextStyle(color: AppStyle.bluePrimary),
      bodySmall: TextStyle(color: AppStyle.bluePrimary),
    ),
    listTileTheme: const ListTileThemeData(
      textColor: AppStyle.bluePrimary,
    ),
  );

  static final ThemeData themeDark = ThemeData(
    brightness: Brightness.dark,
    floatingActionButtonTheme: const FloatingActionButtonThemeData(
      backgroundColor: AppStyle.white,
    ),
    primaryColor: AppStyle.grayLight400,
    scaffoldBackgroundColor: AppStyle.bluePrimary,
    appBarTheme: const AppBarTheme(
        elevation: 0,
        backgroundColor: AppStyle.bluePrimary,
        foregroundColor: Colors.white),
    textTheme: const TextTheme(
      bodyMedium: TextStyle(color: AppStyle.white),
      bodyLarge: TextStyle(color: AppStyle.white),
      bodySmall: TextStyle(color: AppStyle.white),
    ),
    listTileTheme: const ListTileThemeData(
      textColor: AppStyle.white,
    ),
  );
}
