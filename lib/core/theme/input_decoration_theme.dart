import 'package:flutter/material.dart';
import 'package:real_estate_allotment/core/theme/app_theme.dart';

final lightInputDecorationTheme = InputDecorationTheme(
  filled: true,
  fillColor: AppTheme.offWhiteColor,
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
  disabledBorder: OutlineInputBorder(
    borderRadius: BorderRadius.circular(15),
    borderSide: BorderSide(
      strokeAlign: BorderSide.strokeAlignOutside,
      color: AppTheme.offWhiteColor,
      width: 1,
    ),
  ),
  prefixIconColor: AppTheme.lightGrayColor,
);

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
  disabledBorder: OutlineInputBorder(
    borderRadius: BorderRadius.circular(15),
    borderSide: BorderSide(
      strokeAlign: BorderSide.strokeAlignOutside,
      color: AppTheme.darkGrayColor,
      width: 1,
    ),
  ),
  prefixIconColor: AppTheme.lightGrayColor,
);
