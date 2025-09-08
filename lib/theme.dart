import 'package:flutter/material.dart';

class AppThemes {
  // Light Theme
  static final ThemeData lightTheme = ThemeData(
    brightness: Brightness.light,
    primaryColor: Colors.lightBlue,
    scaffoldBackgroundColor: Colors.white,
    fontFamily: "Inter",
    textTheme: const TextTheme(
      bodyLarge: TextStyle(
        fontSize: 19,
        color: Colors.black,
        fontWeight: FontWeight.w400,
      ),
      bodySmall: TextStyle(
        fontSize: 11,
        color: Colors.black,
      ),
      bodyMedium: TextStyle(
        fontSize: 14,
        color: Colors.black,
      ),
      displayLarge: TextStyle(
        fontSize: 52,
        color: Colors.lightBlue,
        fontWeight: FontWeight.w700,
      ),
      displayMedium: TextStyle(
        fontSize: 45,
        color: Colors.black,
      ),
      displaySmall: TextStyle(
        fontSize: 36,
        color: Colors.black,
      ),
      labelLarge: TextStyle(
        fontSize: 14,
        color: Colors.lightBlue,
      ),
      labelMedium: TextStyle(
        fontSize: 12,
        color: Colors.black,
      ),
      labelSmall: TextStyle(
        fontSize: 11,
        color: Colors.black,
      ),
    ),
    appBarTheme: const AppBarTheme(
      backgroundColor: Colors.blue,
      foregroundColor: Colors.white,
      elevation: 0,
    ),
    inputDecorationTheme: InputDecorationTheme(
      labelStyle: TextStyle(
        color: Colors.grey[500],
      ),
      filled: true,
      fillColor: Colors.grey[200],
      border: const OutlineInputBorder(
        borderRadius: BorderRadius.all(
          Radius.circular(8),
        ),
        borderSide: BorderSide.none,
      ),
    ),
  );
  // Dark Theme
  static final ThemeData darkTheme = ThemeData(
    brightness: Brightness.dark,
    primaryColor: Colors.lightBlue,
    scaffoldBackgroundColor: Colors.black,
    fontFamily: "Inter",
    textTheme: const TextTheme(
      bodyLarge: TextStyle(
        fontSize: 19,
        color: Colors.white,
      ),
      bodySmall: TextStyle(
        fontSize: 11,
        color: Colors.white,
      ),
      bodyMedium: TextStyle(
        fontSize: 14,
        color: Colors.white,
      ),
      displayLarge: TextStyle(
        fontSize: 52,
        color: Colors.lightBlue,
      ),
      displayMedium: TextStyle(
        fontSize: 45,
        color: Colors.white,
      ),
      displaySmall: TextStyle(
        fontSize: 36,
        color: Colors.white,
      ),
      labelLarge: TextStyle(
        fontSize: 14,
        color: Colors.lightBlue,
      ),
      labelMedium: TextStyle(
        fontSize: 12,
        color: Colors.white,
      ),
      labelSmall: TextStyle(
        fontSize: 11,
        color: Colors.white,
      ),
    ),
    appBarTheme: const AppBarTheme(
      backgroundColor: Colors.lightBlue,
      foregroundColor: Colors.white,
      elevation: 0,
    ),
  );
}
