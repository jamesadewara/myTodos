import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/services.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:mytodo/control/theme/deserializer.dart';
import 'package:mytodo/control/theme/theme.dart';
import 'package:mytodo/initializations.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:mytodo/control/config.dart';
import 'package:mytodo/control/theme_identifier.dart';
import 'package:mytodo/control/route_generator.dart';
import 'package:mytodo/control/store/store.dart';
import 'package:responsive_framework/responsive_framework.dart';
import 'package:shared_preferences/shared_preferences.dart';

// void main() async {
//   WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
//   FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);
//   await EasyLocalization.ensureInitialized();

//   // await firebaseInit();

//   final SharedPreferences prefs = await SharedPreferences.getInstance();

//   runApp(EasyLocalization(
//       supportedLocales: const [Locale('en', 'US')],
//       // supportedLocales:
//       //     supportedLocales.map((locale) => locale.locale).toList(),
//       path: 'assets/translations',
//       fallbackLocale: const Locale('en', 'US'),
//       child: providerInit(
//           child: StoreProvider(
//               store: storeInit(prefs: prefs), child: const MainApp()))));

//   FlutterNativeSplash.remove();
// }

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();

  final SharedPreferences prefs = await SharedPreferences.getInstance();

  runApp(EasyLocalization(
      supportedLocales: const [Locale('en', 'US')],
      path: 'assets/translations',
      fallbackLocale: const Locale('en', 'US'),
      child: providerInit(
          child: StoreProvider(
              store: storeInit(prefs: prefs), child: const MainApp()))));

  FlutterNativeSplash.remove();
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

// This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    Brightness currentBrightness = Theme.of(context).brightness;

    return StoreConnector<AppState, AppState>(
        converter: (store) => store.state,
        builder: (context, currentAppState) {
          Locale locale;
          if (currentAppState.language.isNotEmpty &&
              supportedLocales.any((loc) =>
                  loc.locale.languageCode == currentAppState.language)) {
            locale = supportedLocales
                .firstWhere((loc) =>
                    loc.locale.languageCode == currentAppState.language)
                .locale;
          } else {
            locale = Localizations.localeOf(context);
          }
          context.setLocale(locale);

          print(context.locale.countryCode);
          // return StreamBuilder<User?>(
          //     stream: FirebaseAuth.instance.authStateChanges(),
          //     builder: (context, snapshot) {
          return AnnotatedRegion<SystemUiOverlayStyle>(
              value: SystemUiOverlayStyle(
                  statusBarColor: Colors.transparent,
                  systemNavigationBarColor: Colors.transparent,
                  statusBarIconBrightness:
                      identifyTheme(currentAppState.theme) == ThemeMode.system
                          ? currentBrightness == Brightness.dark
                              ? Brightness.light
                              : Brightness.dark
                          : identifyTheme(currentAppState.theme) ==
                                  ThemeMode.dark
                              ? Brightness.light
                              : Brightness.dark,
                  systemNavigationBarIconBrightness:
                      identifyTheme(currentAppState.theme) == ThemeMode.system
                          ? currentBrightness == Brightness.dark
                              ? Brightness.light
                              : Brightness.dark
                          : identifyTheme(currentAppState.theme) ==
                                  ThemeMode.dark
                              ? Brightness.light
                              : Brightness.dark),
              child: MaterialApp.router(
                title: "MyTodo's",
                debugShowCheckedModeBanner: false,
                themeMode: identifyTheme(currentAppState.theme),
                theme: CustomThemes(name: ThemeIdentifier.daylight)
                    .currentTheme()
                    .copyWith(brightness: Brightness.light),
                darkTheme: CustomThemes(name: ThemeIdentifier.nightfall)
                    .currentTheme()
                    .copyWith(brightness: Brightness.dark),
                localizationsDelegates: context.localizationDelegates,
                supportedLocales: context.supportedLocales,
                locale: context.locale,
                // locale: locale,
                // localizationsDelegates: const [
                //   AppLocalizations.delegate,
                //   GlobalMaterialLocalizations.delegate,
                //   GlobalWidgetsLocalizations.delegate,
                //   GlobalCupertinoLocalizations.delegate,
                // ],
                // supportedLocales:
                //     supportedLocales.map((locale) => locale.locale).toList(),
                routerConfig:
                    // !snapshot.hasData
                    // ? AuthRouteGenerator.generateRoute(
                    // appState: currentAppState)
                    // :
                    // currentAppState.isIntro
                    // ?
                    IntroRouteGenerator.generateRoute(
                        appState: currentAppState),
                // :
                // AppRouteGenerator.generateRoute(appState: currentAppState),
                builder: (context, child) => ResponsiveBreakpoints.builder(
                  child: child!,
                  breakpoints: [
                    const Breakpoint(start: 0, end: 450, name: MOBILE),
                    const Breakpoint(start: 451, end: 800, name: TABLET),
                    const Breakpoint(start: 801, end: 1920, name: DESKTOP),
                    const Breakpoint(
                        start: 1921, end: double.infinity, name: '4K'),
                  ],
                ),
              ));
        });
    // });
  }
}
