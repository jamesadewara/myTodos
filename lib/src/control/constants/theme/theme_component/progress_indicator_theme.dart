import 'package:flutter/material.dart';
import 'package:mytodo/src/control/constants/theme/deserializer.dart';

class CustomProgressIndicatorThemeData {
  ProgressIndicatorThemeData build({required ThemeDeserializer theme}) {
    return ProgressIndicatorThemeData(color: theme.primary);
  }
}
