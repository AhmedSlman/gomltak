part of 'edit_profile_cubit.dart';

abstract class EditProfileState {
  const EditProfileState();
}

class EditProfileInitial extends EditProfileState {}

class EditProfileSuccess extends EditProfileState {}

class EditProfileError extends EditProfileState {
  EditProfileError(this.errorMassage);
  final String? errorMassage;
}

class EditProfileLoding extends EditProfileState {}

class ChangeVisapiltyIconState extends EditProfileState {}
