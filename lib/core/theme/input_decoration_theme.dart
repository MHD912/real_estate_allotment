import 'package:flutter/material.dart';
import 'package:real_estate_allotment/core/theme/app_theme.dart';

final darkInputDecorationTheme = InputDecorationTheme(
  filled: true,
  fillColor: AppTheme.darkGrayColor,
  enabledBorder: OutlineInputBorder(
    borderRadius: BorderRadius.circular(15),
    borderSide: BorderSide(
      strokeAlign: BorderSide.strokeAlignOutside,
      color: AppTheme.lightGrayColor,
      width: 1,
    ),
  ),
  focusedBorder: OutlineInputBorder(
    borderRadius: BorderRadius.circular(15),
    borderSide: BorderSide(
      strokeAlign: BorderSide.strokeAlignOutside,
      color: AppTheme.greenColor,
      width: 1,
    ),
  ),
);
