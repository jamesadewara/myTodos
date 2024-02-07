import 'package:mytodo/control/actions.dart';
import 'package:redux/redux.dart';

// Define a class to represent your authSdklication state
class AppState {
  final bool isLoading;

  AppState(this.isLoading);
}

// Combine reducers into a root reducer
final rootReducer = combineReducers<AppState>([
  TypedReducer<AppState, dynamic>(loadingReducer).call,
]);
