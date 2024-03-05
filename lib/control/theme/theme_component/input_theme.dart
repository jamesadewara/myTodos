import 'package:flutter/material.dart';
import 'package:mytodo/control/theme/deserializer.dart';

class CustomInputDecorationTheme {
  InputDecorationTheme build({required ThemeDeserializer theme}) {
    return InputDecorationTheme(
      fillColor: theme.surface,
      enabledBorder: OutlineInputBorder(
        borderSide: BorderSide(color: theme.accent),
        borderRadius: BorderRadius.circular(theme.radius + 2),
      ),
      focusedBorder: OutlineInputBorder(
        borderSide: BorderSide.none,
        borderRadius: BorderRadius.circular(theme.radius),
      ),
      filled: true,
    );
  }
}
