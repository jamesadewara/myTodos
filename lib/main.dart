import 'package:aitheme/deserializer.dart';
import 'package:aitheme/theme.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:mytodo/control/notifier_listener.dart';
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

void firebaseInit() async {
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
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

  // firebaseInit();

  final SharedPreferences prefs = await SharedPreferences.getInstance();
  Store<AppState> store = storeInit(prefs: prefs);

  runApp(StoreProvider(
      store: store,
      child: StoreProvider(store: store, child: const MainApp())));

  // runApp(providerInit(
  //     child: StoreProvider(
  //         store: store,
  //         child: StoreProvider(store: store, child: const MainApp()))));

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
              child: MaterialApp(
                title: "MyTodo's",
                debugShowCheckedModeBanner: false,
                themeMode: identifyTheme(currentAppState.theme),
                theme: AiThemes(name: ThemeIdentifier.daylight)
                    .currentTheme()
                    .copyWith(brightness: Brightness.light),
                darkTheme: AiThemes(name: ThemeIdentifier.nightfall)
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
                initialRoute:
                    // snapshot.hasData ?
                    AppRoutes.intro
                // : AuthRoutes.login,
                ,
                onGenerateRoute: RouteGenerator.generateRoute,
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
