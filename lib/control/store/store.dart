import 'package:mytodo/control/store/actions.dart';
import 'package:redux/redux.dart';

class AppState {
  final bool? isIntro;
  final String? theme;
  final String? language;

  AppState({this.isIntro, this.theme, this.language});
}

// Combine reducers into a root reducer
final rootReducer = combineReducers<AppState>([
  TypedReducer<AppState, dynamic>(introReducer).call,
  TypedReducer<AppState, dynamic>(themeReducer).call,
  TypedReducer<AppState, dynamic>(languageReducer).call,
]);
