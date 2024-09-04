import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:gomltak/core/utils/app_route.dart';
import 'package:gomltak/core/utils/app_string.dart';
import 'package:gomltak/core/utils/extentions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gomltak/core/validation/validation.dart';
import 'package:gomltak/core/widgets/const_elevated_button.dart';
import 'package:gomltak/core/widgets/const_text_form_field.dart';
import 'package:gomltak/core/widgets/custom_snack_bar.dart';
import 'package:gomltak/features/auth_feature/presentation/sign_up/sign_up_widgets/shimmer_bottom_signup.dart';

import '../cubit/forget_password_cubit.dart';

class FormInputeResetPassword extends StatefulWidget {
  const FormInputeResetPassword({
    super.key,
  });

  @override
  State<FormInputeResetPassword> createState() =>
      _FormInputeResetPasswordState();
}

class _FormInputeResetPasswordState extends State<FormInputeResetPassword> {
  TextEditingController newPasswordConttroler = TextEditingController();
  TextEditingController newPasswordConformationConttroler =
      TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ForgetPasswordCubit, ForgetPasswordState>(
      listener: (context, state) {
        if (state is ForgetPasswordError) {
          ScaffoldMessenger.of(context).showSnackBar(CustomSnackBar(
              content: Text(AppString.tryAgain, textAlign: TextAlign.center)));
        } else if (state is ForgetPasswordSuccess) {
          context.pushReplacement(AppRouterPath.loginView);
        }
      },
      builder: (context, state) {
        return Form(
          key: _formKey,
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 24.w),
            child: Column(
              children: [
                ConstTextFormField(
                  validator: Validators.validatePassword,
                  obscureText:
                      ForgetPasswordCubit.get(context).onCkickedVisibilty,
                  hintText: AppString.newPassword,
                  controller: newPasswordConttroler,
                  suffixIcon: InkWell(
                    onTap: () {
                      ForgetPasswordCubit.get(context).changeVisibiltyIcon();
                    },
                    child: Icon(ForgetPasswordCubit.get(context).iconVisibilty),
                  ),
                ),
                16.h.ph,
                ConstTextFormField(
                  validator: Validators.validatePassword,
                  obscureText:
                      ForgetPasswordCubit.get(context).onCkickedVisibilty,
                  hintText: AppString.confirmPassword,
                  controller: newPasswordConformationConttroler,
                  suffixIcon: InkWell(
                    onTap: () {
                      ForgetPasswordCubit.get(context).changeVisibiltyIcon();
                    },
                    child: Icon(ForgetPasswordCubit.get(context).iconVisibilty),
                  ),
                ),
                32.h.ph,
                state is ForgetPasswordLoding
                    ? bottomSignup()
                    : ConstElevatedButton(
                        text: AppString.resetPassword,
                        onPressed: () {
                          if (_formKey.currentState!.validate()) {
                            ForgetPasswordCubit.get(context).changePassword(
                                newPassword: newPasswordConttroler.text,
                                newPasswordConfirmation:
                                    newPasswordConformationConttroler.text);
                          }
                        },
                      ),
              ],
            ),
          ),
        );
      },
    );
  }
}
