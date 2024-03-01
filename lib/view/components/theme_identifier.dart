import 'package:flutter/material.dart';

ThemeMode identifyTheme(String currentTheme) {
  return currentTheme == "system"
      ? ThemeMode.system
      : currentTheme == "light"
          ? ThemeMode.light
          : ThemeMode.dark;
}
