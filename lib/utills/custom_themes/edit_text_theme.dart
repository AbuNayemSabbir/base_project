import 'package:flutter/material.dart';
import 'package:flutter_base_project/utills/theme.dart';

class TTextFieldTheme {
  TTextFieldTheme._();

  static final lightTextFieldTheme = InputDecorationTheme(
    contentPadding: const EdgeInsets.symmetric(vertical: 8, horizontal: 8),
    filled: true,
    prefixIconColor: Colors.black,
    suffixIconColor: Colors.black,
    hintStyle: const TextStyle(color: Colors.grey),
    border: const OutlineInputBorder(),
    focusedErrorBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(8),
      borderSide:  BorderSide(width: 1, color: TTheme.errorTextColor),
    ),
    focusedBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(8),
      borderSide:  BorderSide(width: 1, color: TTheme.primaryColor),
    ),
    enabledBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(8),
      borderSide: BorderSide(
        color: Colors.grey.withOpacity(0.25),
      ),
    ),
    errorBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(8),
      borderSide:  BorderSide(width: 1, color: TTheme.errorTextColor),
    ),
    errorStyle:  TextStyle(fontWeight: FontWeight.bold, color: TTheme.errorTextColor),
  );

  static final darkTextFieldTheme = InputDecorationTheme(
    contentPadding: const EdgeInsets.symmetric(vertical: 8, horizontal: 8),
    filled: true,
    prefixIconColor: Colors.white,
    suffixIconColor: Colors.white,
    hintStyle: const TextStyle(color: Colors.grey),
    border: const OutlineInputBorder(),
    focusedErrorBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(8),
      borderSide:  BorderSide(width: 1, color: TTheme.errorTextColor),
    ),
    focusedBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(8),
      borderSide:  BorderSide(width: 1, color: TTheme.primaryColor),
    ),
    enabledBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(8),
      borderSide: BorderSide(
        color: Colors.white.withOpacity(0.25),
      ),
    ),
    errorBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(8),
      borderSide:  BorderSide(width: 1, color: TTheme.errorTextColor),
    ),
    errorStyle:  TextStyle(fontWeight: FontWeight.bold, color: TTheme.errorTextColor),
  );
}
