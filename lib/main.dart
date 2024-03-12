import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:mytodo/inits/app.dart';
import 'package:mytodo/inits/initializations.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:mytodo/src/control/constants/config.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
  // await firebaseInit();

  final SharedPreferences prefs = await SharedPreferences.getInstance();

  runApp(EasyLocalization(
      supportedLocales:
          supportedLocales.map((locale) => locale.locale).toList(),
      path: 'assets/translations',
      fallbackLocale: const Locale('en', 'US'),
      child: providerInit(
          child: StoreProvider(
              store: storeInit(prefs: prefs), child: const MainApp()))));

  FlutterNativeSplash.remove();
}
