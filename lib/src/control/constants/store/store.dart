import 'package:mytodo/src/control/constants/store/actions.dart';
import 'package:mytodo/src/control/constants/store/reducers.dart';
import 'package:redux/redux.dart';

class AppState {
  bool isIntro;
  String theme;
  String language;

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

  // Define a copyWith method to create a new instance with updated values
  AppState copyWith({
    bool? isIntro,
    String? theme,
    String? language,
  }) {
    return AppState(
      isIntro: isIntro ?? this.isIntro,
      theme: theme ?? this.theme,
      language: language ?? this.language,
    );
  }
}

// Combine reducers into a root reducer
final rootReducer = combineReducers<AppState>([
  TypedReducer<AppState, ToggleIntroAction>(introReducer).call,
  TypedReducer<AppState, UpdateThemeAction>(themeReducer).call,
  TypedReducer<AppState, UpdateLanguageAction>(languageReducer).call,
]);
