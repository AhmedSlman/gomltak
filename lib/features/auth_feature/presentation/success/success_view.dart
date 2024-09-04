import 'package:go_router/go_router.dart';
import 'package:gomltak/core/utils/app_colors.dart';
import 'package:gomltak/core/utils/app_images.dart';
import 'package:gomltak/core/utils/app_route.dart';
import 'package:gomltak/core/utils/app_string.dart';
import 'package:gomltak/core/utils/extentions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gomltak/core/widgets/const_elevated_button.dart';

import '../const/image_in_auth.dart';

class SuccessView extends StatelessWidget {
  const SuccessView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox.expand(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            ConstImageInAuth(nameImage: AppImages.success),
            16.h.ph,
            Text(
              AppString.success,
              style: context.textTheme.titleLarge!
                  .copyWith(color: AppColors.mainColor),
            ),
            6.h.ph,
            Text(
              AppString.thankYou,
              style: context.textTheme.bodyMedium!
                  .copyWith(color: AppColors.kDarkSilver),
              textAlign: TextAlign.center,
            ),
            33.h.ph,
            ConstElevatedButton(
                onPressed: () {
                  context
                      .pushReplacement(AppRouterPath.bottomNavigationBarView);
                },
                text: AppString.continueShopping)
          ],
        ),
      ),
    );
  }
}
