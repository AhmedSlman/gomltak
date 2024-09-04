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
import 'package:gomltak/features/auth_feature/presentation/forget_password/cubit/forget_password_cubit.dart';
import 'package:gomltak/features/auth_feature/presentation/sign_up/sign_up_widgets/shimmer_bottom_signup.dart';

class FormInputeForgetPassword extends StatefulWidget {
  const FormInputeForgetPassword({
    super.key,
  });

  @override
  State<FormInputeForgetPassword> createState() =>
      _FormInputeForgetPasswordState();
}

class _FormInputeForgetPasswordState extends State<FormInputeForgetPassword> {
  final TextEditingController emailController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    emailController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.symmetric(horizontal: 25.0.w),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              ConstTextFormField(
                validator: Validators.validateEmail,
                controller: emailController,
                hintText: AppString.emailAddress,
                keyboardType: TextInputType.emailAddress,
              ),
              33.h.ph,
              BlocConsumer<ForgetPasswordCubit, ForgetPasswordState>(
                listener: (context, state) {
                  if (state is ForgetPasswordError) {
                    ScaffoldMessenger.of(context).showSnackBar(CustomSnackBar(
                        content: Text(AppString.tryAgain,
                            textAlign: TextAlign.center)));
                  } else if (state is ForgetPasswordSuccess) {
                    context.push(AppRouterPath.verificationView);
                  }
                },
                builder: (context, state) {
                  return state is ForgetPasswordLoding
                      ? bottomSignup()
                      : ConstElevatedButton(
                          text: AppString.submit,
                          onPressed: () {
                            if (_formKey.currentState!.validate()) {
                              ForgetPasswordCubit.get(context)
                                  .forgetPassword(email: emailController.text);
                            }
                          },
                        );
                },
              ),
            ],
          ),
        ));
  }
}
