import 'package:flutter/material.dart';
import 'package:real_estate_allotment/core/theme/app_theme.dart';

final darkTextButtonThemeData = TextButtonThemeData(
  style: ButtonStyle(
    overlayColor: WidgetStateProperty.resolveWith<Color>(
      (states) {
        if (states.contains(WidgetState.pressed)) {
          return AppTheme.whiteColor.withOpacity(0.2);
        }
        return Colors.transparent;
      },
    ),
    shape: WidgetStatePropertyAll(
      RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
        side: BorderSide(
          strokeAlign: BorderSide.strokeAlignOutside,
          color: AppTheme.lightGrayColor,
          width: 1,
        ),
      ),
    ),
  ),
);

final lightTextButtonThemeData = TextButtonThemeData(
  style: ButtonStyle(
    overlayColor: WidgetStateProperty.resolveWith<Color>(
      (states) {
        if (states.contains(WidgetState.pressed)) {
          return AppTheme.whiteColor.withOpacity(0.2);
        }
        return Colors.transparent;
      },
    ),
    shape: WidgetStatePropertyAll(
      RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
        side: BorderSide(
          strokeAlign: BorderSide.strokeAlignOutside,
          color: AppTheme.lightGrayColor,
          width: 1,
        ),
      ),
    ),
  ),
);
