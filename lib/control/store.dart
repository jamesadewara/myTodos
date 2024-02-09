import 'package:mytodo/control/actions.dart';
import 'package:redux/redux.dart';

// Define a class to represent your authSdklication state
class AppState {
  final bool? isLoading;
  final bool? isIntro;

  AppState({this.isLoading, this.isIntro});
}

// Combine reducers into a root reducer
final rootReducer = combineReducers<AppState>([
  TypedReducer<AppState, dynamic>(loadingReducer).call,
  TypedReducer<AppState, dynamic>(introReducer).call,
]);
