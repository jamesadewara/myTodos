import 'package:flutter/material.dart';
import 'package:mytodo/src/control/constants/theme/deserializer.dart';

class CustomAppBarTheme {
  AppBarTheme build({required ThemeDeserializer theme}) {
    return const AppBarTheme(
      centerTitle: false,
      titleSpacing: NavigationToolbar.kMiddleSpacing,
      toolbarHeight: 56.0,
      elevation: 0,
      scrolledUnderElevation: 0,
      backgroundColor: Colors.transparent,
      surfaceTintColor: Colors.transparent,
    );
  }
}
