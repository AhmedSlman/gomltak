import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:gomltak/core/utils/app_route.dart';
import 'package:gomltak/core/utils/app_string.dart';
import 'package:gomltak/core/utils/extentions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gomltak/core/widgets/const_elevated_button.dart';
import 'package:gomltak/core/widgets/custom_snack_bar.dart';
import 'package:gomltak/features/auth_feature/presentation/forget_password/cubit/forget_password_cubit.dart';
import 'package:gomltak/features/auth_feature/presentation/sign_up/sign_up_widgets/shimmer_bottom_signup.dart';

import 'otp.dart';

class FormInputeVerification extends StatefulWidget {
  const FormInputeVerification({
    super.key,
  });

  @override
  State<FormInputeVerification> createState() => _FormInputeVerificationState();
}

class _FormInputeVerificationState extends State<FormInputeVerification> {
  final TextEditingController oneController = TextEditingController();

  final TextEditingController twoController = TextEditingController();
  final TextEditingController threeController = TextEditingController();
  final TextEditingController fourController = TextEditingController();

  @override
  void dispose() {
    oneController.dispose();
    twoController.dispose();
    threeController.dispose();
    fourController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ForgetPasswordCubit, ForgetPasswordState>(
      listener: (context, state) {
        if (state is VerificationError) {
          ScaffoldMessenger.of(context).showSnackBar(
              CustomSnackBar(content: Center(child: Text(AppString.tryAgain))));
        } else if (state is VerificationSuccess) {
          context.push(AppRouterPath.resetPasswordView);
        }
      },
      builder: (context, state) {
        ForgetPasswordCubit cubit = ForgetPasswordCubit.get(context);
        return Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                textFieldOTP(
                  first: true,
                  last: false,
                  context: context,
                  controller: oneController,
                ),
                8.w.pw,
                textFieldOTP(
                  first: false,
                  last: false,
                  context: context,
                  controller: twoController,
                ),
                8.w.pw,
                textFieldOTP(
                  first: false,
                  last: false,
                  context: context,
                  controller: threeController,
                ),
                8.w.pw,
                textFieldOTP(
                  first: false,
                  last: false,
                  context: context,
                  controller: fourController,
                ),
              ],
            ),
            33.h.ph,
            state is VerificationLoding
                ? bottomSignup()
                : ConstElevatedButton(
                    onPressed: () {
                      try {
                        cubit.chickPinCode(
                          int.parse(
                            oneController.text +
                                twoController.text +
                                threeController.text +
                                fourController.text,
                          ),
                        );
                      } catch (e) {}
                    },
                    text: AppString.submit),
          ],
        );
      },
    );
  }
}
