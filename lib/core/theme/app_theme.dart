import 'package:flutter/material.dart';
import 'package:real_estate_allotment/core/theme/input_decoration_theme.dart';
import 'package:real_estate_allotment/core/theme/outlined_button_theme.dart';
import 'package:real_estate_allotment/core/theme/text_button_theme.dart';

class AppTheme {
  static const Color whiteColor = Color(0xFFFFFFFF);
  static const Color offWhiteColor = Color(0xFFF2F0EF);
  static const Color greenColor = Color(0xFF388E3C);
  static const Color redColor = Color(0xFFCC3328);
  static const Color lightGrayColor = Color(0xFF5B5B5B);
  static const Color grayColor = Color(0xFF202020);
  static const Color darkGrayColor = Color(0xFF161616);
  static const Color blackColor = Color(0xFF000000);
  static const Color transparent = Color(0x00000000);

  static final ThemeData _theme = ThemeData(
    fontFamily: "NotoSansArabic",
    fontFamilyFallback: const <String>["OpenSans"],
    useMaterial3: true,
  );

  static final ColorScheme lightColorScheme = ColorScheme.fromSeed(
    seedColor: whiteColor,
    brightness: Brightness.light,
  ).copyWith(
    surface: offWhiteColor,
    onSurface: blackColor,
    surfaceContainer: whiteColor,
    primary: greenColor,
    onPrimary: whiteColor,
    secondary: greenColor,
    onSecondary: whiteColor,
    primaryContainer: whiteColor,
    onPrimaryContainer: blackColor,
  );
  static final ThemeData lightTheme = _theme.copyWith(
    brightness: Brightness.light,
    scaffoldBackgroundColor: offWhiteColor,
    colorScheme: lightColorScheme,
    outlinedButtonTheme: lightOutlinedButtonThemeData,
  );

  static final ColorScheme darkColorScheme = ColorScheme.fromSeed(
    seedColor: blackColor,
    brightness: Brightness.dark,
  ).copyWith(
    surface: blackColor,
    onSurface: whiteColor,
    surfaceContainer: grayColor,
    primary: greenColor,
    onPrimary: whiteColor,
    secondary: greenColor,
    onSecondary: whiteColor,
    primaryContainer: blackColor,
    onPrimaryContainer: whiteColor,
    secondaryContainer: darkGrayColor,
    onSecondaryContainer: whiteColor,
    outline: lightGrayColor,
  );

  static final ThemeData darkTheme = _theme.copyWith(
    brightness: Brightness.dark,
    scaffoldBackgroundColor: blackColor,
    colorScheme: darkColorScheme,
    textTheme: TextTheme(),
    outlinedButtonTheme: darkOutlinedButtonThemeData,
    textButtonTheme: darkTextButtonThemeData,
    inputDecorationTheme: darkInputDecorationTheme,
  );
}
