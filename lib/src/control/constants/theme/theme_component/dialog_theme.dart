import 'package:flutter/material.dart';
import 'package:mytodo/src/control/constants/theme/deserializer.dart';

class CustomDialogTheme {
  DialogTheme build({required ThemeDeserializer theme}) {
    return DialogTheme(
        elevation: theme.elevation.toDouble(),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(theme.radius.toDouble()),
        ),
        alignment: Alignment.center,
        actionsPadding: EdgeInsets.all(theme.sm.toDouble()));
  }
}
