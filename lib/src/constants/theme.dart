import 'package:flutter/material.dart';
import 'package:reservation_fields_app/src/constants/constants.dart';
import 'package:reservation_fields_app/src/constants/sizes.dart';

class FieldsAppTheme {
  static ThemeData lightTheme = ThemeData(
    colorScheme: ColorScheme.fromSwatch(
      primarySwatch: Colors.deepPurple,
    ).copyWith(
      secondary: Constants.tAppSecondaryColor,
    ),
    textTheme: const TextTheme(
      headlineMedium: TextStyle(
          fontFamily: 'Poppins', color: Colors.black87, fontSize: 20.0),
      titleSmall: TextStyle(
          fontFamily: 'Poppins',
          color: Colors.black87,
          fontSize: 14.0,
          fontWeight: FontWeight.bold),
      headlineSmall: TextStyle(
          fontFamily: 'Poppins',
          color: Colors.black87,
          fontWeight: FontWeight.bold),
    ),
    outlinedButtonTheme: OutlinedButtonThemeData(
      style: OutlinedButton.styleFrom(
        foregroundColor: Constants.tAppSecondaryColor,
        shape: const RoundedRectangleBorder(),
        side: BorderSide(color: Constants.tAppSecondaryColor),
        padding: const EdgeInsets.symmetric(vertical: tButtonHeight),
      ),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: Constants.tAppSecondaryColor,
        foregroundColor: Constants.tAppPrimaryColor,
        side: BorderSide(color: Constants.tAppSecondaryColor),
        elevation: 0,
        shape: const RoundedRectangleBorder(),
        padding: const EdgeInsets.symmetric(vertical: tButtonHeight),
      ),
    ),
    inputDecorationTheme: InputDecorationTheme(
      border: const OutlineInputBorder(),
      prefixIconColor: Constants.tAppSecondaryColor,
      floatingLabelStyle: TextStyle(color: Constants.tAppSecondaryColor),
      focusedBorder: OutlineInputBorder(
        borderSide: BorderSide(width: 2, color: Constants.tAppSecondaryColor),
      ),
    ),
  );

  static ThemeData darkTheme = ThemeData(
    colorScheme: ColorScheme.fromSwatch(
      primarySwatch: Colors.deepOrange,
      brightness: Brightness.dark,
    ).copyWith(
      secondary: Constants.tAppPrimaryColor,
    ),
    textTheme: const TextTheme(
      headlineMedium:
          TextStyle(fontFamily: 'Poppins', color: Colors.white70, fontSize: 20),
      titleSmall: TextStyle(
          fontFamily: 'Poppins',
          color: Colors.white60,
          fontSize: 14,
          fontWeight: FontWeight.bold),
      headlineSmall: TextStyle(
          fontFamily: 'Poppins',
          color: Colors.black87,
          fontWeight: FontWeight.bold),
    ),
    outlinedButtonTheme: OutlinedButtonThemeData(
      style: OutlinedButton.styleFrom(
        foregroundColor: Constants.tAppPrimaryColor,
        shape: const RoundedRectangleBorder(),
        side: BorderSide(color: Constants.tAppPrimaryColor),
        padding: const EdgeInsets.symmetric(vertical: tButtonHeight),
      ),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: Constants.tAppPrimaryColor,
        foregroundColor: Constants.tAppSecondaryColor,
        side: BorderSide(color: Constants.tAppPrimaryColor),
        elevation: 0,
        shape: const RoundedRectangleBorder(),
        padding: const EdgeInsets.symmetric(vertical: tButtonHeight),
      ),
    ),
    inputDecorationTheme: InputDecorationTheme(
      border: const OutlineInputBorder(),
      prefixIconColor: Constants.tAppPrimaryColor,
      floatingLabelStyle: TextStyle(color: Constants.tAppPrimaryColor),
      focusedBorder: OutlineInputBorder(
        borderSide: BorderSide(width: 2, color: Constants.tAppPrimaryColor),
      ),
    ),
  );
}
