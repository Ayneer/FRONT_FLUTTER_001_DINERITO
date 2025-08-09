import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter/material.dart';

class UserPreferenceService {
  Future<ThemeMode> getThemeMode() async {
    final prefs = await SharedPreferences.getInstance();
    final String? themeMode = prefs.getString('theme-mode');
    switch (themeMode) {
      case 'dark':
        return ThemeMode.dark;
      case 'light':
        return ThemeMode.light;
      default:
        return ThemeMode.system;
    }
  }

  Future<void> updateThemeMode(ThemeMode theme) async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setString(
      'theme-mode',
      theme.toString(),
    );
  }
}
