import 'package:gomltak/core/utils/app_images.dart';
import 'package:gomltak/core/utils/app_string.dart';
import 'package:gomltak/core/utils/extentions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gomltak/core/widgets/const_appbar.dart';

import '../const/image_in_auth.dart';
import 'froget_password_widgets/from_inpute_froget_password.dart';

class ForgetPasswordView extends StatelessWidget {
  const ForgetPasswordView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(
            children: [
              30.h.ph,
              ConstAppBar(
                onPressed: () {
                  context.goRoute.pop();
                },
                body: AppString.enterYourEmail,
                title: AppString.forgotPassword,
              ),
              37.h.ph,
              ConstImageInAuth(
                nameImage: AppImages.forgetPassword,
              ),
              23.h.ph,
              const FormInputeForgetPassword()
            ],
          ),
        ),
      ),
    );
  }
}
