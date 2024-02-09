// isLoading action: Increment
import 'package:mytodo/control/store.dart';

enum LoadingActions { logic }

AppState loadingReducer(AppState state, action) {
  if (action == LoadingActions.logic) {
    return AppState(isLoading: !state.isLoading!);
  }
  return state;
}

enum IntroActions { logic }

AppState introReducer(AppState state, action) {
  if (action == IntroActions.logic) {
    return AppState(isIntro: !state.isLoading!);
  }
  return state;
}
