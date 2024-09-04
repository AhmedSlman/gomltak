import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:gomltak/core/utils/app_colors.dart';
import 'package:gomltak/core/utils/app_route.dart';
import 'package:gomltak/core/utils/app_string.dart';
import 'package:gomltak/core/utils/extentions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gomltak/core/validation/validation.dart';
import 'package:gomltak/core/widgets/const_elevated_button.dart';
import 'package:gomltak/core/widgets/const_text_form_field.dart';
import 'package:gomltak/core/widgets/custom_snack_bar.dart';
import 'package:gomltak/features/auth_feature/presentation/login/cubit/login_cubit.dart';
import 'package:gomltak/features/auth_feature/presentation/sign_up/sign_up_widgets/shimmer_bottom_signup.dart';

class FormInputeLoginAccount extends StatefulWidget {
  const FormInputeLoginAccount({
    super.key,
  });

  @override
  State<FormInputeLoginAccount> createState() => _FormInputeLoginAccountState();
}

class _FormInputeLoginAccountState extends State<FormInputeLoginAccount> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    emailController.dispose();
    passordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<LoginCubit, LoginState>(listener: (context, state) {
      if (state is LoginError) {
        ScaffoldMessenger.of(context).showSnackBar(CustomSnackBar(
            content: Center(
                child: Text(AppString.tryAgain, textAlign: TextAlign.center))));
      } else if (state is LoginSuccess) {
        context.pushReplacement(AppRouterPath.bottomNavigationBarView);
      }
    }, builder: (context, state) {
      return Form(
        key: _formKey,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 25.0.w),
          child: Column(
            children: [
              ConstTextFormField(
                keyboardType: TextInputType.emailAddress,
                hintText: AppString.emailAddress,
                validator: Validators.validateEmail,
                controller: emailController,
              ),
              20.h.ph,
              ConstTextFormField(
                controller: passordController,
                validator: Validators.validatePassword,
                hintText: AppString.password,
                obscureText: LoginCubit.get(context).onCkickedVisibilty,
                suffixIcon: InkWell(
                  onTap: () {
                    LoginCubit.get(context).changeVisibiltyIcon();
                  },
                  child: Icon(LoginCubit.get(context).iconVisibilty),
                ),
              ),
              20.h.ph,
              Align(
                alignment: AlignmentDirectional.centerEnd,
                child: InkWell(
                  onTap: () {
                    context.push(AppRouterPath.forgetPasswordView);
                  },
                  child: Text(
                    AppString.forgotPassword,
                    style: context.textTheme.labelLarge!.copyWith(
                      color: AppColors.kArsenic,
                    ),
                  ),
                ),
              ),
              20.h.ph,
              state is LoginLoding
                  ? bottomSignup()
                  : ConstElevatedButton(
                      text: AppString.login,
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          LoginCubit.get(context).login(
                            email: emailController.text,
                            password: passordController.text,
                          );
                        }
                      },
                    ),
            ],
          ),
        ),
      );
    });
  }
}
