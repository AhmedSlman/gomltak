part of 'signup_cubit.dart';

abstract class SignupState {
  const SignupState();
}

class SignupInitial extends SignupState {}

class SignupError extends SignupState {
  SignupError(this.errorMassage);
  String? errorMassage;
}

class SignupSuccess extends SignupState {}

class SignupLoding extends SignupState {}

class SignupGetAppGaverLoding extends SignupState {}

class SignupGetAppGaverError extends SignupState {}

class SignupGetAppGaverSuccess extends SignupState {}

class SignupChangeVisapiltyIconState extends SignupState {}
