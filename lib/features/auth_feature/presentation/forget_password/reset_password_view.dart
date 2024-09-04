import 'package:gomltak/core/utils/app_images.dart';
import 'package:gomltak/core/utils/app_string.dart';
import 'package:gomltak/core/utils/extentions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gomltak/core/widgets/const_appbar.dart';

import '../const/image_in_auth.dart';
import 'froget_password_widgets/form_inpute.dart';

class ResetPasswordView extends StatelessWidget {
  const ResetPasswordView({super.key});

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
              body: AppString.resetThePassword,
              title: AppString.resetPassword,
              onPressed: () {
                context.goRoute.pop();
              },
            ),
            37.h.ph,
            ConstImageInAuth(nameImage: AppImages.resetPassword),
            23.h.ph,
            const FormInputeResetPassword(),
          ],
        ),
      )),
    );
  }
}
