import 'package:flutter/material.dart';

class AppTheme{
  static const Color primaryColor = Color(0xff2b54a8);
  static const Color formColor = Color(0xffe7eaf6);
  static const Color onPrimaryColor = Color(0xffffffff);
  static const Color white = Color(0xffffffff);
  static const Color black = Color(0xff000000);
  static const Color blue = Color(0xFF2196F3);
  static const Color redAccent = Color(0xFFD51212);
  static const Color darkError = Color(0xFFFF4848);
  static const Color secondaryColor = Color(0xFF9E9E9E);
  static const Color surfaceVariant = Color(0xFFECECEC);
  static const Color onSurfaceVariant = Color(0xFFC8C2CE);
  static const Color darkSurfaceVariant = Color(0xFF48444E);
  static const Color darkSecondaryColor = Color(0xFF676370);
  static const Color ternaryColor =  Color(0xFFEC2486);



  static const TextStyle bodySmall = TextStyle(
    fontWeight: FontWeight.normal,
    color: black,
    fontFamily: 'Almarai',
    fontSize: 14,
  );
  static const TextStyle bodyMedium = TextStyle(
    fontWeight: FontWeight.normal,
    fontFamily: 'Almarai',
    color: black,
    fontSize: 16,
  );
  static const TextStyle button = TextStyle(
    fontWeight: FontWeight.normal,
    color: white,
    fontFamily: 'Almarai',
    fontSize: 16,
  );
  static const TextStyle titleSmall = TextStyle(
    fontWeight: FontWeight.normal,
    fontSize: 18,
    fontFamily: 'Almarai',
    color: black,
  );
  static const TextStyle titleMedium = TextStyle(
    fontWeight: FontWeight.normal,
    fontSize: 25,
    fontFamily: 'Almarai',
    color: black,
  );
  static const TextStyle titleBlackBGMedium = TextStyle(
    fontWeight: FontWeight.normal,
    fontFamily: 'Almarai',
    fontSize: 25,
    color: white,
  );

  static const TextStyle darkBodySmall = TextStyle(
    fontWeight: FontWeight.normal,
    color: white,
    fontFamily: 'Almarai',
    fontSize: 14,
  );
  static const TextStyle darkBodyMedium = TextStyle(
    fontWeight: FontWeight.normal,
    fontFamily: 'Almarai',
    color: white,
    fontSize: 16,
  );
  static const TextStyle darkTitleSmall = TextStyle(
    fontWeight: FontWeight.normal,
    fontSize: 18,
    fontFamily: 'Almarai',
    color: white,
  );
  static const TextStyle darkTitleMedium = TextStyle(
    fontWeight: FontWeight.normal,
    fontFamily: 'Almarai',
    fontSize: 25,
    color: white,
  );

  static final ElevatedButtonThemeData elevatedButtonStyle = ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      backgroundColor: primaryColor,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      textStyle: button,
    ),
  );

  // Light Theme
  static ThemeData lightTheme = ThemeData.light().copyWith(
    primaryColor: primaryColor,
    primaryColorDark: white,
    colorScheme: ColorScheme(
      brightness: Brightness.light,
      primary: primaryColor,
      onPrimary: onPrimaryColor,
      secondary: secondaryColor,
      onSecondary: white,
      error: redAccent,
      onError: white,
      background: white,
      onBackground: black,
      surface: surfaceVariant,
      onSurface: onSurfaceVariant,
    ),
    textTheme: TextTheme(
      bodySmall: bodySmall,
      bodyMedium: bodyMedium,
      displaySmall: button,
      displayMedium: titleBlackBGMedium,
      titleSmall: titleSmall,
      titleMedium: titleMedium,
    ),

    elevatedButtonTheme: elevatedButtonStyle,
    scaffoldBackgroundColor:surfaceVariant,
    // Add more light theme properties as needed
  );

  // Dark Theme
  static ThemeData darkTheme = ThemeData.dark().copyWith(
    primaryColor: primaryColor,
    primaryColorDark: darkSecondaryColor,
    colorScheme: ColorScheme(
      brightness: Brightness.dark,
      primary: primaryColor,
      onPrimary: onPrimaryColor,
      secondary: darkSecondaryColor,
      onSecondary: white,
      error: darkError,
      onError: white,
      background: black,
      onBackground: white,
      surface: darkSurfaceVariant,
      onSurface: onSurfaceVariant,
    ),
    textTheme: TextTheme(
      bodySmall: darkBodySmall,
      bodyMedium: darkBodyMedium,
      displaySmall: button,
      displayMedium: titleBlackBGMedium,
      titleSmall: darkTitleSmall,
      titleMedium: darkTitleMedium,
    ),
    elevatedButtonTheme: elevatedButtonStyle,
    scaffoldBackgroundColor: darkSurfaceVariant,
    // Add more dark theme properties as needed
  );


}