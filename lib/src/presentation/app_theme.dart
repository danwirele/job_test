import 'package:flutter/material.dart';

class AppTheme {
  static final ThemeData appTheme = ThemeData(
    fontFamily: 'Roboto',
    colorScheme: const ColorScheme.light(
      primary: Color(0xFF0D72FF),
      background: Color(0xFFD8D8D8),
    ),
    textTheme: const TextTheme(
      labelMedium: TextStyle(
        fontSize: 16,
        color: Color(0xFF2C3035),
        fontFamily: 'SFProMedium',
      ),
      labelSmall: TextStyle(
        fontFamily: 'SFProMedium',
        fontWeight: FontWeight.w500,
        color: Colors.black,
        fontSize: 14,
      ),
      titleLarge: TextStyle(
        fontSize: 22.0,
        fontWeight: FontWeight.w500,
        color: Colors.black,
        fontFamily: 'SFProMedium',
      ),
      titleMedium: TextStyle(
        fontSize: 18.0,
        fontWeight: FontWeight.w500,
        color: Colors.black,
        fontFamily: 'SFProMedium',
      ),
      bodyLarge: TextStyle(
        fontSize: 30.0,
        color: Colors.black,
        fontWeight: FontWeight.w600,
        fontFamily: 'SFProSemibold',
      ),
      bodyMedium: TextStyle(
        fontFamily: 'SFProRegular',
        fontSize: 16,
        color: Colors.black,
        fontWeight: FontWeight.w400,
      ),
    ),
  );
}
