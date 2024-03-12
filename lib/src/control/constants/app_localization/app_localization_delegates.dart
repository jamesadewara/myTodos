import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:mytodo/src/control/constants/app_localization/app_localization.dart';

class CustomAppLocalizationsDelegate
    extends LocalizationsDelegate<MaterialLocalizations> {
  const CustomAppLocalizationsDelegate();
  @override
  bool isSupported(Locale locale) {
    return locale == const Locale('yo', 'NG');
  }

  @override
  Future<CustomAppLocalizations> load(Locale locale) {
    assert(locale == const Locale('yo', 'NG'));
    return SynchronousFuture<CustomAppLocalizations>(CustomAppLocalizations());
  }

  @override
  bool shouldReload(CustomAppLocalizationsDelegate old) => false;
}
