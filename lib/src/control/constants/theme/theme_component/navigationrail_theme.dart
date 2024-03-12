import 'package:flutter/material.dart';
import 'package:mytodo/src/control/constants/theme/deserializer.dart';

class CustomNavigationRailThemeData {
  NavigationRailThemeData build({required ThemeDeserializer theme}) {
    return NavigationRailThemeData(
      elevation: theme.elevation.toDouble(),
      groupAlignment: 0.0,
      labelType: NavigationRailLabelType.selected,
      useIndicator: true,
      indicatorShape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(theme.radius.toDouble()),
      ),
      minWidth: theme.xl.toDouble(),
      minExtendedWidth: theme.xl.toDouble(),
    );
  }
}
