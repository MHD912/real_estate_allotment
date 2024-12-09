import 'package:flutter/material.dart';
import 'package:real_estate_allotment/core/theme/app_theme.dart';

final lightTextButtonThemeData = TextButtonThemeData(
  style: ButtonStyle(
    backgroundColor: WidgetStatePropertyAll(
      AppTheme.lightColorScheme.primary,
    ),
    overlayColor: WidgetStateProperty.resolveWith<Color>(
      (states) {
        if (states.contains(WidgetState.pressed)) {
          return AppTheme.whiteColor.withOpacity(0.2);
        }
        return AppTheme.transparent;
      },
    ),
    shape: WidgetStatePropertyAll(
      RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
        side: BorderSide(
          strokeAlign: BorderSide.strokeAlignOutside,
          color: AppTheme.darkColorScheme.outline,
          width: 1,
        ),
      ),
    ),
  ),
);

final darkTextButtonThemeData = TextButtonThemeData(
  style: ButtonStyle(
    backgroundColor: WidgetStatePropertyAll(
      AppTheme.darkColorScheme.primary,
    ),
    overlayColor: WidgetStateProperty.resolveWith<Color>(
      (states) {
        if (states.contains(WidgetState.pressed)) {
          return AppTheme.whiteColor.withOpacity(0.2);
        }
        return AppTheme.transparent;
      },
    ),
    shape: WidgetStatePropertyAll(
      RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
        side: BorderSide(
          strokeAlign: BorderSide.strokeAlignOutside,
          color: AppTheme.darkColorScheme.outline,
          width: 1,
        ),
      ),
    ),
  ),
);
