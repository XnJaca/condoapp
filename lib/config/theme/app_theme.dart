import 'package:flutter/material.dart';

class AppTheme {
  static const bool isDarkTheme = false;

  static const Color primaryLight = Color(0xff007979);
  static const Color colorIconsLight = primaryLight;

  static final ThemeData lightTheme = ThemeData.light().copyWith(
    primaryColor: primaryLight,
    appBarTheme: const AppBarTheme(
      color: primaryLight,
      elevation: 0,
    ),
    drawerTheme: const DrawerThemeData(
      elevation: 10,
    ),
    // F2EFEF
    scaffoldBackgroundColor: Color.fromARGB(255, 255, 255, 255),
  );

  static final ThemeData darkTheme = ThemeData.dark().copyWith();
}
