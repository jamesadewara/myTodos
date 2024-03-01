import 'package:mytodo/control/store/actions.dart';
import 'package:mytodo/control/store/reducers.dart';
import 'package:redux/redux.dart';

class AppState {
  final bool isIntro;
  final String theme;
  final String language;

  AppState({
    required this.isIntro,
    required this.theme,
    required this.language,
  });

  factory AppState.fromJson(Map<String, dynamic> json) {
    return AppState(
      isIntro: json['isIntro'],
      theme: json['theme'],
      language: json['language'],
    );
  }
}

// Combine reducers into a root reducer
final rootReducer = combineReducers<AppState>([
  TypedReducer<AppState, ToggleIntroAction>(introReducer).call,
  TypedReducer<AppState, UpdateThemeAction>(themeReducer).call,
  TypedReducer<AppState, UpdateLanguageAction>(languageReducer).call,
]);
