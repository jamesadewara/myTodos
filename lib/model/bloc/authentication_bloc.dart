import 'package:bloc/bloc.dart';
import 'package:mytodo/model/apis/firebase/services/auth/authentication.dart';
import 'package:mytodo/model/states/auth/authentication_event_state.dart';
import 'package:mytodo/model/states/state_management.dart';
import 'package:mytodo/model/props/user_props.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AuthenticationBloc extends Bloc<AuthenticationEvent, StateManager> {
  final AuthService authService = AuthService();

  AuthenticationBloc() : super(InitialManagerState()) {
    on<AuthenticationEvent>((event, emit) {});

    on<SignUpUserRequested>((event, emit) async {
      emit(LoadingManagerState(isLoading: true));
      try {
        final UserModel? user =
            await authService.signUpUser(event.email, event.password);
        if (user != null) {
          emit(SuccessManagerState(user));
        } else {
          emit(const FailureManagerState('create user failed'));
        }
      } catch (e) {
        print(e.toString());
      }
      emit(LoadingManagerState(isLoading: false));
    });

    on<SignOutRequested>((event, emit) async {
      emit(LoadingManagerState(isLoading: true));
      try {
        authService.signOutUser();
      } catch (e) {
        print('error');
        print(e.toString());
      }
      emit(LoadingManagerState(isLoading: false));
    });
  }
}
