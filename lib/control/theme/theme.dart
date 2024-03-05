import 'package:flutter/material.dart';
import 'package:mytodo/control/theme/deserializer.dart';
import 'package:mytodo/control/theme/provider.dart';

class CustomThemes {
  ThemeDeserializer name;

  CustomThemes({required this.name});

  ThemeData currentTheme() {
    return ThemeProvider.getTheme(name);
  }
}
