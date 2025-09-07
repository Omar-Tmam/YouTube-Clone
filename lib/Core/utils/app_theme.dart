import 'package:flutter/material.dart';

class AppTheme {
  static ThemeData lightTheme = ThemeData.light().copyWith(
    textTheme: const TextTheme(
      bodyLarge: TextStyle(color: Colors.black),
      bodyMedium: TextStyle(color: Colors.black),
      bodySmall: TextStyle(color: Colors.black),
    ),
    tabBarTheme: TabBarThemeData(labelColor: Colors.black),
    iconTheme: const IconThemeData(color: Colors.black),
    scaffoldBackgroundColor: Colors.white,
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.blue,
        textStyle: TextStyle(color: Colors.white),
      ),
    ),
    iconButtonTheme: IconButtonThemeData(
      style: IconButton.styleFrom(backgroundColor: Colors.transparent, foregroundColor: Colors.black),
    ),
    primaryIconTheme: IconThemeData(color: Colors.black),
  );

  static ThemeData darkTheme = ThemeData.dark().copyWith(
    textTheme: const TextTheme(
      bodyLarge: TextStyle(color: Colors.white),
      bodyMedium: TextStyle(color: Colors.white),
      bodySmall: TextStyle(color: Colors.white),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.transparent,
        textStyle: TextStyle(color: Colors.white),
      ),
    ),
    tabBarTheme: TabBarThemeData(labelColor: Colors.white),
    iconTheme: const IconThemeData(color: Colors.white),
    scaffoldBackgroundColor: Colors.black,
    iconButtonTheme: IconButtonThemeData(
      style: IconButton.styleFrom(backgroundColor: Colors.transparent, foregroundColor: Colors.white),
    ),
    primaryIconTheme: IconThemeData(color: Colors.white),
  );
}
