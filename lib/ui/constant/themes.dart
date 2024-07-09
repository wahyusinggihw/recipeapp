import 'package:flutter/material.dart';
import 'package:recipe_app/gen/fonts.gen.dart';
import 'package:recipe_app/ui/constant/constant.dart';

isDarkMode(BuildContext context) {
  return Theme.of(context).brightness == Brightness.dark;
}

final lightTheme = ThemeData(
    brightness: Brightness.light,
    primaryColor: primaryColor,
    fontFamily: FontFamily.avenirNextLTPro,
    scaffoldBackgroundColor: Colors.white,
    textTheme: const TextTheme(
      bodyLarge: TextStyle(),
      bodyMedium: TextStyle(),
    ).apply(
      bodyColor: blackColor,
      displayColor: blackColor,
    ),
    iconTheme: const IconThemeData(color: primaryColor),
    textSelectionTheme: const TextSelectionThemeData(
      cursorColor: primaryColor,
    ),
    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
      selectedItemColor: primaryColor,
      unselectedItemColor: Colors.grey,
      selectedIconTheme: IconThemeData(color: primaryColor),
      unselectedIconTheme: IconThemeData(color: Colors.grey),
    ),
    colorScheme: const ColorScheme.light()
        .copyWith(
          primary: primaryColor,
          onPrimary: primaryColor,
        )
        .copyWith(
          primary: primaryColor,
          secondary: secondaryColor,
          brightness: Brightness.light,
        ));
