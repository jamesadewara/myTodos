import 'package:flutter/material.dart';

class RouteParams {
  final String id;
  final String path;

  RouteParams({required this.id, required this.path});
}

class ThemeProps {
  final String id;
  final String value;
  final String image;

  ThemeProps({required this.id, required this.value, required this.image});
}

class NavBtnProps {
  final String id;

  final IconData icon;
  final IconData selectedIcon;
  final String label;
  final String route;

  NavBtnProps({
    required this.id,
    required this.icon,
    required this.selectedIcon,
    required this.label,
    required this.route,
  });
}

class SettingsTitleRouteProps {
  final String title;
  final List<SettingsRouteProps> children;

  SettingsTitleRouteProps({
    required this.title,
    required this.children,
  });
}

class SettingsRouteProps {
  final String id;
  final IconData icon;
  final IconData trailingIcon;
  final String title;
  final String? subtitle;
  final VoidCallback? goRoute;

  SettingsRouteProps(
      {this.id = "",
      required this.icon,
      required this.title,
      required this.subtitle,
      required this.goRoute,
      required this.trailingIcon});
}

class TaskProps {
  final String id;
  final String name;
  final String description;

  TaskProps({this.id = "", required this.name, required this.description});
}
