import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gomltak/core/cached/cash_helper.dart';
import 'package:gomltak/features/auth_feature/data/models/governorate_model/datum.dart';
import 'package:gomltak/features/auth_feature/data/repositories_impel/auth_repos_impel.dart';

part 'signup_state.dart';

class SignupCubit extends Cubit<SignupState> {
  SignupCubit(this.authRepoImpel) : super(SignupInitial());
  AuthRepoImpel authRepoImpel;
  static SignupCubit get(context) => BlocProvider.of(context);
  bool onCkickedVisibilty = true;
  IconData iconVisibilty = Icons.remove_red_eye_outlined;
  List<Datum> listAllGover = [];
  int? selectedGovernorate;

  Future<void> signUp({
    required String email,
    required String password,
    required String passwordConfirmation,
    required String userName,
    required int governorateId,
  }) async {
    emit(SignupLoding());

    authRepoImpel
        .accountRegisterion(
      email: email,
      password: password,
      passwordConfirmation: passwordConfirmation,
      userName: userName,
      governorateId: governorateId,
    )
        .then((response) {
      response.fold(
        (failure) => {emit(SignupError(failure.errMassage))},
        (success) => {
          CachHelper.saveData(key: 'token', value: success.data?.token),
          CachHelper.saveData(
              key: 'userName', value: success.data?.client?.userName),
          CachHelper.saveData(key: 'email', value: success.data?.client?.email),
          CachHelper.saveData(key: 'governorate', value: governorateId),
          emit(SignupSuccess())
        },
      );
    });
  }

  changeVisibiltyIcon() {
    onCkickedVisibilty = !onCkickedVisibilty;
    onCkickedVisibilty == true
        ? iconVisibilty = Icons.remove_red_eye_outlined
        : iconVisibilty = Icons.visibility_off_outlined;
    emit(SignupChangeVisapiltyIconState());
  }

  Future<void> getAllGover() async {
    emit(SignupGetAppGaverLoding());
    authRepoImpel.getGovernorate().then((response) {
      response.fold(
        (faliure) => emit(SignupGetAppGaverError()),
        (success) {
          listAllGover.addAll(success.data as Iterable<Datum>);
          selectedGovernorate = listAllGover[0].id;
          emit(SignupGetAppGaverSuccess());
        },
      );
    });
  }
}
