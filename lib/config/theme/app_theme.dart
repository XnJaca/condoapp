import 'package:flutter/material.dart';

class AppTheme {
  static const bool isDarkTheme = false;

  static const Color primaryLight = Color(0xff007979);
  // E95154
  static const Color primaryRed = Color(0xffE95154);
  // E7D8B9
  static const Color primaryYellow = Color(0xffE7D8B9);
  // 97B69E
  static const Color secondaryGreen = Color(0xff97B69E);
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
