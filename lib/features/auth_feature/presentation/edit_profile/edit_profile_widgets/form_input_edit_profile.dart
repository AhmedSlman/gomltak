import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:gomltak/core/cached/cash_helper.dart';
import 'package:gomltak/core/utils/app_route.dart';
import 'package:gomltak/core/utils/app_string.dart';
import 'package:gomltak/core/utils/extentions.dart';
import 'package:gomltak/core/validation/validation.dart';
import 'package:gomltak/core/widgets/const_elevated_button.dart';
import 'package:gomltak/core/widgets/const_text_form_field.dart';
import 'package:gomltak/core/widgets/custom_snack_bar.dart';
import 'package:gomltak/features/auth_feature/presentation/edit_profile/cubit/edit_profile_cubit.dart';
import 'package:gomltak/features/auth_feature/presentation/sign_up/sign_up_widgets/shimmer_bottom_signup.dart';

class FormInputeEditProfile extends StatefulWidget {
  const FormInputeEditProfile({
    super.key,
  });

  @override
  State<FormInputeEditProfile> createState() => _FormInputeEditProfileState();
}

class _FormInputeEditProfileState extends State<FormInputeEditProfile> {
  TextEditingController userNameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController oldPasswordController = TextEditingController();
  TextEditingController newPasswordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<EditProfileCubit, EditProfileState>(
      listener: (context, state) {
        if (state is EditProfileError) {
          ScaffoldMessenger.of(context).showSnackBar(CustomSnackBar(
              content: Center(
                  child: Text(state.errorMassage.toString(),
                      textAlign: TextAlign.center))));
        }
        if (state is EditProfileSuccess) {
          CachHelper.saveData(key: 'email', value: emailController.text);
          CachHelper.saveData(key: 'userName', value: userNameController.text);
          context.pushReplacement(AppRouterPath.bottomNavigationBarView);
        }
      },
      builder: (context, state) {
        return Form(
          key: _formKey,
          child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 24.w),
              child: Column(children: [
                ConstTextFormField(
                  validator: Validators.validateUsername,
                  controller: userNameController,
                  hintText: CachHelper.getData('userName').toString(),
                  suffixIcon: const Icon(Icons.edit),
                ),
                16.h.ph,
                ConstTextFormField(
                  validator: Validators.validateEmail,
                  controller: emailController,
                  hintText: CachHelper.getData('email').toString(),
                  keyboardType: TextInputType.emailAddress,
                  suffixIcon: const Icon(Icons.edit),
                ),
                16.h.ph,
                ConstTextFormField(
                  controller: oldPasswordController,
                  keyboardType: TextInputType.visiblePassword,
                  hintText: AppString.oldPassword,
                  suffixIcon: InkWell(
                      onTap: () {
                        EditProfileCubit.get(context).changeVisibiltyIcon();
                      },
                      child: const Icon(Icons.remove_red_eye_outlined)),
                ),
                16.h.ph,
                ConstTextFormField(
                  controller: newPasswordController,
                  hintText: AppString.newPassword,
                  keyboardType: TextInputType.visiblePassword,
                  suffixIcon: InkWell(
                      onTap: () {
                        EditProfileCubit.get(context).changeVisibiltyIcon();
                      },
                      child: const Icon(Icons.remove_red_eye_outlined)),
                ),
                16.h.ph,
                ConstTextFormField(
                  controller: confirmPasswordController,
                  keyboardType: TextInputType.visiblePassword,
                  hintText: AppString.confirmPassword,
                  suffixIcon: InkWell(
                      onTap: () {
                        EditProfileCubit.get(context).changeVisibiltyIcon();
                      },
                      child: const Icon(Icons.remove_red_eye_outlined)),
                ),
                32.h.ph,
                state is EditProfileLoding
                    ? bottomSignup()
                    : ConstElevatedButton(
                        onPressed: () {
                          if (_formKey.currentState!.validate()) {
                            EditProfileCubit.get(context).editProfile(
                              userName: userNameController.text,
                              email: emailController.text,
                              oldPassword: oldPasswordController.text,
                              newPassword: newPasswordController.text,
                              newPasswordConfirmation:
                                  confirmPasswordController.text,
                            );
                          }
                        },
                        text: AppString.done,
                      )
              ])),
        );
      },
    );
  }
}
