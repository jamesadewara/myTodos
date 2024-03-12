// import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:flutter/foundation.dart';
import 'package:mytodo/src/control/features/app_notification/push_notification.dart';
import 'package:mytodo/src/model/bloc/authentication_bloc.dart';
import '../firebase_options.dart';
import 'package:mytodo/src/control/constants/config.dart';
import 'package:mytodo/src/control/constants/parsers/store_parser.dart';
import 'package:mytodo/src/control/constants/store/store.dart';
import 'package:redux/redux.dart';
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
  return MultiBlocProvider(providers: [
    BlocProvider<AuthenticationBloc>(
      create: (BuildContext context) => AuthenticationBloc(),
    ),
  ], child: child);
}

void pushNotificationInit() {
  PushNotification pushNotification = PushNotification();
  pushNotification.initNotifications();
}
