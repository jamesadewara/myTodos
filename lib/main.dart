// import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:flutter/foundation.dart';
import 'package:mytodo/control/notifier_listener.dart';
import 'package:mytodo/control/theme/deserializer.dart';
import 'package:mytodo/control/theme/theme.dart';
import 'package:mytodo/model/bloc/authentication_bloc.dart';
import 'package:provider/provider.dart';
import 'firebase_options.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:mytodo/control/config.dart';
import 'package:mytodo/control/parsers.dart';
import 'package:mytodo/control/theme_identifier.dart';
import 'package:mytodo/control/route_generator.dart';
import 'package:mytodo/control/store/store.dart';
import 'package:redux/redux.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:responsive_framework/responsive_framework.dart';
import 'package:shared_preferences/shared_preferences.dart';

firebaseInit() async {
  await Firebase.initializeApp(
    name: appName,
    options: DefaultFirebaseOptions.currentPlatform,
  );
  const fatalError = true;
  // Non-async exceptions
  FlutterError.onError = (errorDetails) {
    if (fatalError) {
      // If you want to record a "fatal" exception
      FirebaseCrashlytics.instance.recordFlutterFatalError(errorDetails);
      // ignore: dead_code
    } else {
      // If you want to record a "non-fatal" exception
      FirebaseCrashlytics.instance.recordFlutterError(errorDetails);
    }
  };
  // Async exceptions
  PlatformDispatcher.instance.onError = (error, stack) {
    if (fatalError) {
      // If you want to record a "fatal" exception
      FirebaseCrashlytics.instance.recordError(error, stack, fatal: true);
      // ignore: dead_code
    } else {
      // If you want to record a "non-fatal" exception
      FirebaseCrashlytics.instance.recordError(error, stack);
    }
    return true;
  };
}

Store<AppState> storeInit({required SharedPreferences prefs}) {
  // Retrieve previously saved state from SharedPreferences

  final String? savedStateJson = prefs.getString('appState');
  final initialState = savedStateJson != null
      ? deserializeState(savedStateJson)
      : AppState(isIntro: true, theme: "system", language: "en");

  final store = Store<AppState>(
    rootReducer,
    initialState: initialState,
    middleware: [saveStateMiddleware],
  );

  return store;
}

MultiBlocProvider providerInit({required Widget child}) {
  return MultiBlocProvider(
      providers: [
        BlocProvider<AuthenticationBloc>(
          create: (BuildContext context) => AuthenticationBloc(),
        ),
      ],
      child: MultiProvider(providers: [
        ListenableProvider<NotifyListener>(
          create: (_) => NotifyListener(),
        ),
      ], child: child));
}

void main() async {
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);

  // await firebaseInit();

  final SharedPreferences prefs = await SharedPreferences.getInstance();
  Store<AppState> store = storeInit(prefs: prefs);

  runApp(StoreProvider(store: store, child: const MainApp()));

  // runApp(
  //     providerInit(child: StoreProvider(store: store, child: const MainApp())));
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
                locale: locale,
                localizationsDelegates: const [
                  AppLocalizations.delegate,
                  GlobalMaterialLocalizations.delegate,
                  GlobalWidgetsLocalizations.delegate,
                  GlobalCupertinoLocalizations.delegate,
                ],
                supportedLocales:
                    supportedLocales.map((locale) => locale.locale).toList(),
                routerConfig:
                    // !snapshot.hasData
                    // ?
                    // AuthRouteGenerator.generateRoute(     appState: currentAppState)
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
    // }
    // );
  }
}
