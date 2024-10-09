import 'package:flutter/material.dart';
import 'package:real_estate_allotment/core/theme/app_theme.dart';

final darkOutlinedButtonThemeData = OutlinedButtonThemeData(
  style: ButtonStyle(
    backgroundColor: WidgetStatePropertyAll(
      AppTheme.darkColorScheme.surface,
    ),
    overlayColor: WidgetStateProperty.resolveWith<Color>(
      (states) {
        if (states.contains(WidgetState.pressed)) {
          return AppTheme.darkColorScheme.primary.withOpacity(0.5);
        }
        return Colors.transparent;
      },
    ),
    side: WidgetStatePropertyAll(
      BorderSide(
        color: AppTheme.darkColorScheme.onPrimaryContainer,
        strokeAlign: BorderSide.strokeAlignOutside,
        width: 1,
      ),
    ),
    shape: WidgetStatePropertyAll(
      RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(25),
      ),
    ),
  ),
);

final lightOutlinedButtonThemeData = OutlinedButtonThemeData(
  style: ButtonStyle(
    backgroundColor: WidgetStatePropertyAll(
      AppTheme.lightColorScheme.surface,
    ),
    overlayColor: WidgetStateProperty.resolveWith<Color>(
      (states) {
        if (states.contains(WidgetState.pressed)) {
          return AppTheme.lightColorScheme.primary.withOpacity(0.5);
        }
        return Colors.transparent;
      },
    ),
    side: WidgetStatePropertyAll(
      BorderSide(
        color: AppTheme.lightColorScheme.onPrimaryContainer,
        strokeAlign: BorderSide.strokeAlignOutside,
        width: 1,
      ),
    ),
    shape: WidgetStatePropertyAll(
      RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(25),
      ),
    ),
  ),
);
