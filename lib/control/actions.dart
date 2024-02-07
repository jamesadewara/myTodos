// isLoading action: Increment
import 'package:mytodo/control/store.dart';

enum LoadingActions { logic }

AppState loadingReducer(AppState state, action) {
  if (action == LoadingActions.logic) {
    return AppState(!state.isLoading);
  }
  return state;
}
