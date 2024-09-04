part of 'login_cubit.dart';

abstract class LoginState {
  const LoginState();
}

class LoginInitial extends LoginState {}

class LoginError extends LoginState {}

class LoginLoding extends LoginState {}

class LoginSuccess extends LoginState {}

class ChangeVisapiltyIconState extends LoginState {}
