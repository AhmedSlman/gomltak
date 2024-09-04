part of 'forget_password_cubit.dart';

abstract class ForgetPasswordState {
  const ForgetPasswordState();
}

class ForgetPasswordInitial extends ForgetPasswordState {}

class ForgetPasswordError extends ForgetPasswordState {}

class ForgetPasswordLoding extends ForgetPasswordState {}

class ForgetPasswordSuccess extends ForgetPasswordState {}

//==================================>
//============> verification
class VerificationLoding extends ForgetPasswordState {}

class VerificationSuccess extends ForgetPasswordState {}

class VerificationError extends ForgetPasswordState {}

class ChangeVisapiltyIconState extends ForgetPasswordState {}
