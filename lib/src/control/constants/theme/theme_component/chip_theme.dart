import 'package:flutter/material.dart';
import 'package:mytodo/src/control/constants/theme/deserializer.dart';

class CustomChipTheme {
  ChipThemeData build({required ThemeDeserializer theme}) {
    return ChipThemeData(
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(theme.radius)));
  }
}
