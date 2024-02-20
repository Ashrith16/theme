import 'package:flutter/material.dart';

class AppThemes {
  static const Color primaryColor = Color(0xFF673AB7);
  static const Color secondaryColor = Color(0xFFFF9800);
  static const Color tertiaryColor = Color(0xFF2196F3);
  static const Color quaternaryColor = Color(0xFFE91E63);
  static const Color quinaryColor = Color(0xFF4CAF50);
  static const Color violetColor = Color(0xFF6A1B9A);

  static const Color buttonTextColor = Colors.white;
  static final Color lightBackgroundColor = Colors.white;
  static final Color darkBackgroundColor = Colors.grey[900]!;

  static final Color lightTextColor = Colors.black;
  static final Color darkTextColor = Colors.white;

  static final ThemeData lightTheme = ThemeData(
    brightness: Brightness.light,
    primaryColor: primaryColor,
    scaffoldBackgroundColor: lightBackgroundColor,
    textTheme: TextTheme(
      bodyText1: TextStyle(color: lightTextColor),
      bodyText2: TextStyle(color: lightTextColor),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        primary: primaryColor,
        onPrimary: tertiaryColor,
        padding: EdgeInsets.symmetric(horizontal: 40, vertical: 10),
        textStyle: TextStyle(
          fontSize: 20,
          fontStyle: FontStyle.italic,
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        elevation: 5,
        shadowColor: Colors.black38,
      ),
    ),
    appBarTheme: AppBarTheme(
      color: secondaryColor,
    ),
    outlinedButtonTheme: OutlinedButtonThemeData(
      style: OutlinedButton.styleFrom(
        primary: primaryColor,
        padding: EdgeInsets.symmetric(horizontal: 40, vertical: 10),
        textStyle: TextStyle(
          fontSize: 20,
          fontStyle: FontStyle.italic,
          color: primaryColor,
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        side: BorderSide(color: primaryColor),
      ),
    ),
    floatingActionButtonTheme: FloatingActionButtonThemeData(
      backgroundColor: quaternaryColor,
      foregroundColor: lightTextColor,
      elevation: 5,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
    ),
  );

  static final ThemeData darkTheme = lightTheme.copyWith(
    brightness: Brightness.dark,
    primaryColor: primaryColor,
    scaffoldBackgroundColor: darkBackgroundColor,
    textTheme: TextTheme(
      bodyText1: TextStyle(color: darkTextColor),
      bodyText2: TextStyle(color: darkTextColor),
    ),
    appBarTheme: AppBarTheme(
      color: violetColor,
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        primary: primaryColor,
        onPrimary: quinaryColor,
        padding: EdgeInsets.symmetric(horizontal: 40, vertical: 10),
        textStyle: TextStyle(
          fontSize: 20,
          fontStyle: FontStyle.italic,
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        elevation: 5,
        shadowColor: Colors.black38,
      ),
    ),
    floatingActionButtonTheme: FloatingActionButtonThemeData(
      backgroundColor: primaryColor,
      foregroundColor: lightTextColor,
      elevation: 5,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
    ),
  );
}
