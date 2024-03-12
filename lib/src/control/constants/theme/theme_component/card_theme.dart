import 'package:flutter/material.dart';
import 'package:mytodo/src/control/constants/theme/deserializer.dart';

class CustomCardTheme {
  CardTheme build({required ThemeDeserializer theme}) {
    return CardTheme(
      elevation: theme.elevation,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(theme.radius),
      ),
    );
  }
}
