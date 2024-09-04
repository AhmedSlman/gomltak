import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gomltak/features/auth_feature/data/repositories_impel/auth_repos_impel.dart';
part 'edit_profile_state.dart';

class EditProfileCubit extends Cubit<EditProfileState> {
  EditProfileCubit(this.authRepoImpel) : super(EditProfileInitial());
  AuthRepoImpel authRepoImpel;
  static EditProfileCubit get(context) => BlocProvider.of(context);
  bool onCkickedVisibilty = true;
  IconData iconVisibilty = Icons.remove_red_eye_outlined;
  changeVisibiltyIcon() {
    onCkickedVisibilty = !onCkickedVisibilty;
    onCkickedVisibilty == true
        ? iconVisibilty = Icons.remove_red_eye_outlined
        : iconVisibilty = Icons.visibility_off_outlined;
    emit(ChangeVisapiltyIconState());
  }

  Future<void> editProfile({
    required String userName,
    required String email,
    required String oldPassword,
    required String newPassword,
    required String newPasswordConfirmation,
  }) async {
    emit(EditProfileLoding());
    authRepoImpel
        .editProfile(
      userName: userName,
      email: email,
      oldPassword: oldPassword,
      newPassword: newPassword,
      newPasswordConfirmation: newPasswordConfirmation,
    )
        .then(
      (response) {
        response.fold(
          (faliure) => emit(EditProfileError(faliure.errMassage)),
          (success) => emit(EditProfileSuccess()),
        );
      },
    );
  }
}
