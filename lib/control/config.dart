import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:mytodo/control/app_locales.dart';
import 'package:mytodo/control/props.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

const appName = "myTodo's";
const appVersion = "1.0.0";

const profileImg =
    "https://adewarajames.pythonanywhere.com/media/thumbnail/img/portfolios/IMG_20221015_140027_135_transcpr.jpg";

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
          value: AppLocalizations.of(context)!.appearanceSystemTitle,
          image: "assets/images/bg/system.png"),
      ThemeProps(
          id: "light",
          value: AppLocalizations.of(context)!.appearanceLightTitle,
          image: "assets/images/bg/light.png"),
      ThemeProps(
          id: "dark",
          value: AppLocalizations.of(context)!.appearanceDarkTitle,
          image: "assets/images/bg/dark.png"),
    ];
