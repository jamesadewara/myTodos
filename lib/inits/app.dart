import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/services.dart';
import 'package:mytodo/src/control/constants/app_localization/app_localization_delegates.dart';
import 'package:mytodo/src/control/constants/theme/deserializer.dart';
import 'package:mytodo/src/control/constants/theme/theme.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:mytodo/src/control/constants/config.dart';
import 'package:mytodo/src/control/constants/theme/theme_identifier.dart';
import 'package:mytodo/src/control/routers/route_generator.dart';
import 'package:mytodo/src/control/constants/store/store.dart';
import 'package:responsive_framework/responsive_framework.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

class MainApp extends StatelessWidget {
  const MainApp({super.key});

// This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    Brightness currentBrightness = Theme.of(context).brightness;
    // context.deleteSaveLocale();
    // context.setLocale(const Locale("en", "US"));

    return StoreConnector<AppState, AppState>(
        converter: (store) => store.state,
        builder: (context, currentAppState) {
          // Locale locale;
          // if (currentAppState.language.isNotEmpty &&
          //     supportedLocales.any((loc) =>
          //         loc.locale.languageCode == currentAppState.language)) {
          //   locale = supportedLocales
          //       .firstWhere((loc) =>
          //           loc.locale.languageCode == currentAppState.language)
          //       .locale;
          // } else {
          //   locale = Localizations.localeOf(context);
          // }
          // context.setLocale(locale);

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
                title: appName,
                debugShowCheckedModeBanner: false,
                themeMode: identifyTheme(currentAppState.theme),
                theme: CustomThemes(name: ThemeIdentifier.daylight)
                    .currentTheme()
                    .copyWith(brightness: Brightness.light),
                darkTheme: CustomThemes(name: ThemeIdentifier.nightfall)
                    .currentTheme()
                    .copyWith(brightness: Brightness.dark),
                localizationsDelegates: context.localizationDelegates,
                // localizationsDelegates: const <LocalizationsDelegate<Object>>[
                //   CustomAppLocalizationsDelegate(),
                //   GlobalWidgetsLocalizations.delegate,
                //   GlobalMaterialLocalizations.delegate,
                //   GlobalWidgetsLocalizations.delegate,
                // ],
                supportedLocales: context.supportedLocales,
                locale: context.locale,
                routerConfig:
                    // !snapshot.hasData
                    // ? AuthRouteGenerator.generateRoute(
                    // appState: currentAppState)
                    // :
                    currentAppState.isIntro
                        ? IntroRouteGenerator.generateRoute(
                            appState: currentAppState)
                        : AppRouteGenerator.generateRoute(
                            appState: currentAppState),
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
