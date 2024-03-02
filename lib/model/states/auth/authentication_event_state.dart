import 'package:mytodo/model/props/user_props.dart';

abstract class AuthenticationEvent {
  const AuthenticationEvent();

  List<Object> get props => [];
}

class SignUpUserRequested extends AuthenticationEvent {
  final String email;
  final String password;

  const SignUpUserRequested(this.email, this.password);

  @override
  List<Object> get props => [email, password];
}

class SignInUserRequested extends AuthenticationEvent {
  final String email;
  final String password;

  const SignInUserRequested(this.email, this.password);

  @override
  List<Object> get props => [email, password];
}

class Authenticated extends AuthenticationEvent {
  final UserModel user;
  Authenticated({required this.user});
}

class Unauthenticated extends AuthenticationEvent {}

class SignOutRequested extends AuthenticationEvent {}
