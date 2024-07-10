import 'package:flutter/material.dart';
import 'package:flutter_base_project/utills/custom_themes/text_theme.dart';
import 'custom_themes/app_bar_theme.dart';
import 'custom_themes/edit_text_theme.dart';
import 'custom_themes/elevated_button_theme.dart';


class TTheme {

  static Color lightBackgroundColor = const Color(0xFFF8F8F8);
  static Color darkBackgroundColor = const Color(0xFF41424C);
  static Color primaryColor = Colors.cyan;
  static Color errorTextColor = Colors.red;


  static ThemeData lightTheme = ThemeData(
    colorScheme:   ColorScheme.light(
      primary: TTheme.primaryColor,
      onPrimary: Colors.white,

      secondary: const Color(0xFFEFF3F3),
      onSecondary: Colors.black,

      error: Colors.redAccent,
      onError: Colors.white,

      secondaryContainer: Colors.white,
      onSecondaryContainer: Colors.grey,

    ),
    fontFamily: 'Poppins',
    primaryColor: primaryColor,
    appBarTheme: TAppBarTheme.lightAppBarTheme,
    elevatedButtonTheme: TElevatedButtonTheme.lightElevatedButtonTheme,
    inputDecorationTheme: TTextFieldTheme.lightTextFieldTheme,
    textTheme: TTextTheme.lightTextTheme,
    scaffoldBackgroundColor: lightBackgroundColor,


  );

  static ThemeData darkTheme = ThemeData(
    colorScheme: const ColorScheme.dark(
      primary: Colors.cyan,
      onSecondary: Colors.white,
      surface: Color(0xFF1F1929),
      onSurface: Colors.white,
      error: Colors.redAccent,
      onError: Colors.white,
      secondaryContainer: Color(0xFF5D5F6D),
      onSecondaryContainer: Colors.white70
    ),
    primaryColor: Colors.cyan,
    appBarTheme: TAppBarTheme.darkAppBarTheme,
    scaffoldBackgroundColor: darkBackgroundColor,
    elevatedButtonTheme: TElevatedButtonTheme.darkElevatedButtonTheme,
    inputDecorationTheme: TTextFieldTheme.darkTextFieldTheme,
      textTheme: TTextTheme.darkTextTheme
  );
}
