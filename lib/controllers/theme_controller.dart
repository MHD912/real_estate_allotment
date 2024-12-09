import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:get/get.dart';

class ThemeController extends GetxController {
  final SharedPreferences _preferences;
  ThemeMode _themeMode;

  ThemeController(this._preferences, this._themeMode);

  ThemeMode get themeMode => _themeMode;

  Future<void> setThemeMode(bool isDark) async {
    _themeMode = isDark ? ThemeMode.dark : ThemeMode.light;
    await _preferences.setBool('dark_mode', isDark);
    update();
  }

  static Future<ThemeController> init() async {
    ThemeMode themeMode;
    final preferences = await SharedPreferences.getInstance();
    var isDarkMode = preferences.getBool('dark_mode');
    if (isDarkMode == null || isDarkMode) {
      themeMode = ThemeMode.dark;
      await preferences.setBool('dark_mode', true);
    } else {
      themeMode = ThemeMode.light;
      await preferences.setBool('dark_mode', false);
    }
    return ThemeController(preferences, themeMode);
  }
}
