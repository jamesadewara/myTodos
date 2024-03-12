import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:mytodo/src/control/constants/app_localization/app_locales.dart';
import 'package:mytodo/src/control/routers/props.dart';

const appName = "myTodo's";
const appSite = "myTodo's";
const appVersion = "1.0.0";

List<AppLocale> supportedLocales = [
  AppLocale(locale: const Locale('en', 'US'), name: "English"),
  AppLocale(locale: const Locale('fr', 'FR'), name: "French"),
  AppLocale(locale: const Locale('yo', 'NG'), name: "Yoruba"),
  AppLocale(locale: const Locale('ig', 'NG'), name: "Igbo"),
  AppLocale(locale: const Locale('ha', 'NG'), name: "Hausa"),
];

List<ThemeProps> themeList({required BuildContext context}) => [
      ThemeProps(
          id: "system",
          value: context.tr("appearanceSystemTitle"),
          image: "assets/images/bg/system.png"),
      ThemeProps(
          id: "light",
          value: context.tr("appearanceLightTitle"),
          image: "assets/images/bg/light.png"),
      ThemeProps(
          id: "dark",
          value: context.tr("appearanceDarkTitle"),
          image: "assets/images/bg/dark.png"),
    ];
