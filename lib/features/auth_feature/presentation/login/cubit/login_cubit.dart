import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gomltak/core/cached/cash_helper.dart';
import 'package:gomltak/features/auth_feature/data/repositories_impel/auth_repos_impel.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit(this.authRepoImpel) : super(LoginInitial());
  AuthRepoImpel authRepoImpel;
  static LoginCubit get(context) => BlocProvider.of(context);

  bool onCkickedVisibilty = true;
  IconData iconVisibilty = Icons.remove_red_eye_outlined;
  changeVisibiltyIcon() {
    onCkickedVisibilty = !onCkickedVisibilty;
    onCkickedVisibilty == true
        ? iconVisibilty = Icons.remove_red_eye_outlined
        : iconVisibilty = Icons.visibility_off_outlined;
    emit(ChangeVisapiltyIconState());
  }

  Future<void> login({required String email, required String password}) async {
    emit(LoginLoding());
    authRepoImpel
        .accountLogin(email: email, password: password)
        .then((resopnse) {
      resopnse.fold(
        (failure) => emit(LoginError()),
        (success) {
          CachHelper.saveData(key: 'token', value: success.data!.token);
          CachHelper.saveData(key: 'email', value: success.data!.client!.email);
          CachHelper.saveData(
              key: 'userName', value: success.data!.client!.userName);
          // CachHelper.saveData(key: 'name', value: success.data!.client),
          emit(LoginSuccess());
        },
      );
    });
  }
}
