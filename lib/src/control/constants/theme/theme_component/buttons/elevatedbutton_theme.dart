import 'package:flutter/material.dart';
import 'package:mytodo/src/control/constants/theme/deserializer.dart';

class CustomElevatedButtonThemeData {
  ElevatedButtonThemeData build({required ThemeDeserializer theme}) {
    return ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
            elevation: theme.elevation,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(theme.radius))));
  }
}
