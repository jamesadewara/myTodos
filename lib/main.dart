import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:mytodo/app.dart';
import 'package:mytodo/inits/initializations.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:mytodo/src/control/constants/config.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:url_strategy/url_strategy.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
  // await firebaseInit();
  // await servicesInit();

  final SharedPreferences prefs = await SharedPreferences.getInstance();
  setPathUrlStrategy();
  runApp(EasyLocalization(
      supportedLocales:
          supportedLocales.map((locale) => locale.locale).toList(),
      path: 'assets/translations',
      fallbackLocale: const Locale('en', 'US'),
      child: StoreProvider(
          store: storeInit(prefs: prefs),
          child: providerInit(child: const MainApp()))));

  FlutterNativeSplash.remove();
}
