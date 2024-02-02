// isLoading action: Increment
enum LoadingActions { logic }

bool loadingReducer(bool state, dynamic action) {
  return action == LoadingActions.logic ? !state : state;
}
