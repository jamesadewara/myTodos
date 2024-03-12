import 'dart:convert';
import 'package:mytodo/src/control/constants/store/store.dart'; // Make sure this import is correct
import 'package:redux/redux.dart';
import 'package:shared_preferences/shared_preferences.dart';

// Define a function to serialize state to JSON
String serializeState(AppState state) {
  final Map<String, dynamic> jsonMap = {
    'isIntro': state.isIntro,
    'theme': state.theme,
    'language': state.language,
  };
  return jsonEncode(jsonMap);
}

// Define a function to deserialize JSON back into state
AppState deserializeState(String jsonString) {
  final Map<String, dynamic> json = jsonDecode(jsonString);
  return AppState.fromJson(json);
}

// Define a middleware to save state to SharedPreferences whenever it changes
void saveStateMiddleware(
    Store<AppState> store, action, NextDispatcher next) async {
  next(action);
  final SharedPreferences prefs = await SharedPreferences.getInstance();
  final String serializedState = serializeState(store.state);
  prefs.setString('appState', serializedState);
}
