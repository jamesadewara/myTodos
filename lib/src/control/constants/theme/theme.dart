import 'package:flutter/material.dart';
import 'package:mytodo/src/control/constants/theme/deserializer.dart';
import 'package:mytodo/src/control/constants/theme/provider.dart';

class CustomThemes {
  ThemeDeserializer name;

  CustomThemes({required this.name});

  ThemeData currentTheme() {
    return ThemeProvider.getTheme(name);
  }
}
