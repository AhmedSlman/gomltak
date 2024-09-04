import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:gomltak/core/utils/app_images.dart';
import 'package:gomltak/core/utils/app_string.dart';
import 'package:gomltak/core/utils/extentions.dart';
import 'package:gomltak/core/widgets/const_appbar.dart';
import 'package:gomltak/features/auth_feature/presentation/forget_password/froget_password_widgets/form_inpute_verification.dart';

import '../const/image_in_auth.dart';

class VerificationView extends StatelessWidget {
  const VerificationView({super.key});

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
                title: AppString.verification,
                body: AppString.sendTheVerification,
                onPressed: () {
                  context.pop();
                },
              ),
              37.h.ph,
              ConstImageInAuth(nameImage: AppImages.verification),
              23.h.ph,
              const FormInputeVerification(),
            ],
          ),
        ),
      ),
    );
  }
}
