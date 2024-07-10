import 'package:flutter/material.dart';
import 'package:flutter_base_project/utills/theme.dart';

class TElevatedButtonTheme {
  TElevatedButtonTheme._();

  static final lightElevatedButtonTheme = ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      backgroundColor: TTheme.primaryColor,
      foregroundColor: Colors.black,
      textStyle: const TextStyle(fontSize: 16),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8.0),
        side: BorderSide(color: TTheme.primaryColor.withOpacity(0.6)),
      ),
    ),
  );

  static final darkElevatedButtonTheme = ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      backgroundColor: TTheme.primaryColor,
      foregroundColor: Colors.white,
      textStyle: const TextStyle(fontSize: 16),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8.0),
        side: BorderSide(color: TTheme.primaryColor.withOpacity(0.6)),
      ),      /*          style: ElevatedButton.styleFrom(
            //backgroundColor: color,
           // foregroundColor: Colors.white,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8.0),
              side: BorderSide(color: TTheme.primaryColor[600]!),
            ),
          ),*/
    ),
  );
}
