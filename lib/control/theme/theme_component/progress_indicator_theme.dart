import 'package:flutter/material.dart';
import 'package:mytodo/control/theme/deserializer.dart';

class CustomProgressIndicatorThemeData {
  ProgressIndicatorThemeData build({required ThemeDeserializer theme}) {
    return ProgressIndicatorThemeData(color: theme.primary);
  }
}
