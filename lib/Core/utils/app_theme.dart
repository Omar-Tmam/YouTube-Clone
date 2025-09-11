import 'package:flutter/material.dart';

class AppTheme {
  static ThemeData darkMode = ThemeData.dark().copyWith(
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ButtonStyle(
          iconColor: WidgetStateProperty.all(Colors.white),
        ),
      ),
      iconTheme: IconThemeData(color: Colors.white),
      iconButtonTheme: IconButtonThemeData(
        style: ButtonStyle(
          iconColor: WidgetStateProperty.all(Colors.white),
        ),
      ),
      textTheme: TextTheme(
          bodySmall: TextStyle(color: Colors.grey),
          bodyMedium: TextStyle(color: Colors.white),
          bodyLarge: TextStyle(color: Colors.white)),
      appBarTheme: AppBarTheme(
          iconTheme: IconThemeData(color: Colors.white), color: Colors.black));

  static ThemeData lightMode = ThemeData.light().copyWith(
      scaffoldBackgroundColor: Colors.white,
      elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
              iconColor: Colors.black, backgroundColor: Colors.grey[200])),
      appBarTheme: AppBarTheme(color: Colors.black),
      textTheme: TextTheme(
          bodySmall: TextStyle(color: Colors.grey),
          bodyMedium: TextStyle(color: Colors.black),
          bodyLarge: TextStyle(color: Colors.black)));
}
