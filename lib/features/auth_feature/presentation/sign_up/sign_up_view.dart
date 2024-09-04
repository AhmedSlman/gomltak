import 'package:go_router/go_router.dart';
import 'package:gomltak/core/utils/app_route.dart';
import 'package:gomltak/core/utils/app_string.dart';
import 'package:gomltak/core/utils/extentions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gomltak/core/widgets/const_appbar.dart';
import '../const/do_you_Have_or_dont_have.dart';
import 'sign_up_widgets/from_inputes.dart';

class SignUpView extends StatelessWidget {
  const SignUpView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              30.h.ph,
              ConstAppBar(
                onPressed: () {
                  context.pop();
                },
                title: AppString.createAccount,
                body: AppString.resetThePassword,
              ),
              37.h.ph,
              const FormInputeSignUp(),
              // 200.h.ph,
              MediaQuery.of(context).viewInsets.bottom != 0
                  ? 20.h.ph
                  : 200.h.ph,
              DoYouHaveOrDontHave(
                onTap: () {
                  // SignupCubit.get(context).close();
                  context.push(AppRouterPath.loginView);
                },
                text: AppString.haveAccount,
                textSupmit: AppString.login,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
