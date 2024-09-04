import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gomltak/features/auth_feature/data/repositories_impel/auth_repos_impel.dart';

part 'forget_password_state.dart';

class ForgetPasswordCubit extends Cubit<ForgetPasswordState> {
  ForgetPasswordCubit(this.authRepoImpel) : super(ForgetPasswordInitial());
  AuthRepoImpel authRepoImpel;
  static ForgetPasswordCubit get(context) => BlocProvider.of(context);
  int? pinCode = 0;
  int? ispinCodeSuccess;
  bool onCkickedVisibilty = true;
  IconData iconVisibilty = Icons.remove_red_eye_outlined;
  changeVisibiltyIcon() {
    onCkickedVisibilty = !onCkickedVisibilty;
    onCkickedVisibilty == true
        ? iconVisibilty = Icons.remove_red_eye_outlined
        : iconVisibilty = Icons.visibility_off_outlined;
    emit(ChangeVisapiltyIconState());
  }

  void forgetPassword({required String email}) async {
    emit(ForgetPasswordLoding());
    authRepoImpel.accountForgetPassword(email: email).then((response) {
      response.fold(
        (faliure) => emit(ForgetPasswordError()),
        (success) => emit(ForgetPasswordSuccess()),
      );
    });
  }

  void changePassword({
    required String newPassword,
    required String newPasswordConfirmation,
  }) {
    emit(ForgetPasswordLoding());

    authRepoImpel
        .resetPassword(
      pinCode: pinCode!,
      password: newPassword,
      passwordConfirmation: newPasswordConfirmation,
    )
        .then((response) {
      response.fold(
        (faliure) => emit(ForgetPasswordError()),
        (success) => emit(ForgetPasswordSuccess()),
      );
    });
  }

  Future<void> chickPinCode(int pinCode) async {
    emit(VerificationLoding());
    if (pinCode == this.pinCode) {
      ispinCodeSuccess = pinCode;
      emit(VerificationSuccess());
    } else {
      emit(VerificationError());
    }
  }
}
