import 'package:aitheme/deserializer.dart';
import 'package:aitheme/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
// import 'package:firebase_core/firebase_core.dart';
// import 'firebase_options.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:mytodo/control/notifier_listener.dart';
import 'package:provider/provider.dart';
import 'package:mytodo/control/route_generator.dart';
import 'package:mytodo/control/store/store.dart';
import 'package:redux/redux.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:responsive_framework/responsive_framework.dart';

void main() async {
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);
  final store = Store<AppState>(
    rootReducer,
    initialState:
        AppState(isIntro: true, theme: "system", language: ""), // Initial state
  );

  // await Firebase.initializeApp(
  //   options: DefaultFirebaseOptions.currentPlatform,
  // );

  runApp(MultiProvider(providers: [
    ListenableProvider<NotifyListener>(
      create: (_) => NotifyListener(),
    ),
  ], child: StoreProvider(store: store, child: const MainApp())));

  // FlutterNativeSplash.remove();
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

// This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    StoreProvider.of<AppState>(context)
        .dispatch(AppState(theme: "rice_and_moimoi"));
    return StoreConnector<AppState, String>(
        converter: (store) => store.state.theme ?? "system",
        builder: (context, currentTheme) {
          return MaterialApp(
            title: "MyTodo's",
            debugShowCheckedModeBanner: false,
            themeMode: currentTheme == "system"
                ? ThemeMode.system
                : currentTheme == "light"
                    ? ThemeMode.light
                    : ThemeMode.dark,
            theme: AiThemes(name: ThemeIdentifier.daylight).currentTheme(),
            darkTheme: AiThemes(name: ThemeIdentifier.nightfall).currentTheme(),
            localizationsDelegates: AppLocalizations.localizationsDelegates,
            supportedLocales: AppLocalizations.supportedLocales,
            initialRoute: AppRoutes.intro,
            onGenerateRoute: RouteGenerator.generateRoute,
            builder: (context, child) => ResponsiveBreakpoints.builder(
              child: child!,
              breakpoints: [
                const Breakpoint(start: 0, end: 450, name: MOBILE),
                const Breakpoint(start: 451, end: 800, name: TABLET),
                const Breakpoint(start: 801, end: 1920, name: DESKTOP),
                const Breakpoint(start: 1921, end: double.infinity, name: '4K'),
              ],
            ),
          );
        });
  }
}
