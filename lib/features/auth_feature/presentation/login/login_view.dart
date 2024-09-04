import 'package:go_router/go_router.dart';
import 'package:gomltak/core/utils/app_images.dart';
import 'package:gomltak/core/utils/app_route.dart';
import 'package:gomltak/core/utils/app_string.dart';
import 'package:gomltak/core/utils/extentions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gomltak/core/widgets/const_appbar.dart';
import '../const/do_you_Have_or_dont_have.dart';
import '../const/image_in_auth.dart';
import 'login_widgets/form_inpute_login.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: GestureDetector(
          onTap: () {
            print(MediaQuery.of(context).viewInsets.bottom);
          },
          child: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Padding(
              padding: EdgeInsets.only(
                  bottom: MediaQuery.of(context).viewInsets.bottom),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisSize: MainAxisSize.max,
                children: [
                  30.h.ph,
                  ConstAppBar(
                    onPressed: () {
                      context.goRoute.pop();
                    },
                    title: AppString.loginAccount,
                    body: AppString.hello,
                  ),
                  37.h.ph,
                  ConstImageInAuth(
                    nameImage: AppImages.loginAccount,
                  ),
                  23.h.ph,
                  const FormInputeLoginAccount(),
                  MediaQuery.of(context).viewInsets.bottom != 0
                      ? 33.h.ph
                      : 134.h.ph,
                  DoYouHaveOrDontHave(
                    onTap: () {
                      context.push(AppRouterPath.signUpView);
                      // LoginCubit.get(context).close();
                    },
                    text: AppString.dontHaveveAccount,
                    textSupmit: AppString.signUp,
                  ),
                  32.h.ph,
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
