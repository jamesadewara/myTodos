import 'package:mytodo/control/actions.dart';
import 'package:redux/redux.dart';

// Define a class to represent your authSdklication state
class AppState {
  final bool? isLoading;
  final bool? isIntro;
  final String? theme;

  AppState({this.isLoading, this.isIntro, this.theme});
}

// Combine reducers into a root reducer
final rootReducer = combineReducers<AppState>([
  TypedReducer<AppState, dynamic>(loadingReducer).call,
  TypedReducer<AppState, dynamic>(introReducer).call,
  TypedReducer<AppState, dynamic>(themeReducer).call,
]);
