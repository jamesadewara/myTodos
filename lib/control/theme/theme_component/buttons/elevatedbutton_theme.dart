import 'package:flutter/material.dart';
import 'package:mytodo/control/theme/deserializer.dart';

class CustomElevatedButtonThemeData {
  ElevatedButtonThemeData build({required ThemeDeserializer theme}) {
    return ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
            elevation: theme.elevation,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(theme.radius))));
  }
}
