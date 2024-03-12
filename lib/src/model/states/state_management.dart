import 'package:mytodo/src/model/props/user_props.dart';

abstract class StateManager {
  const StateManager();

  List<Object> get props => [];
}

class InitialManagerState extends StateManager {}

class MessageManagerState extends StateManager {
  final String message;

  MessageManagerState({required this.message});
}

class LoadingManagerState extends StateManager {
  final bool isLoading;

  LoadingManagerState({required this.isLoading});
}

class SuccessManagerState extends StateManager {
  final UserModel user;

  const SuccessManagerState(this.user);
  @override
  List<Object> get props => [user];
}

class FailureManagerState extends StateManager {
  final String errorMessage;

  const FailureManagerState(this.errorMessage);

  @override
  List<Object> get props => [errorMessage];
}
