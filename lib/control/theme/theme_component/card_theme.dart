import 'package:flutter/material.dart';
import 'package:mytodo/control/theme/deserializer.dart';

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
