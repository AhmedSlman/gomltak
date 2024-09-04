import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:gomltak/core/utils/app_colors.dart';
import 'package:gomltak/core/utils/extentions.dart';

class DoYouHaveOrDontHave extends StatelessWidget {
  const DoYouHaveOrDontHave({
    required this.onTap,
    required this.text,
    required this.textSupmit,
    super.key,
  });
  final Function()? onTap;
  final String text;
  final String textSupmit;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          text,
          style: context.textTheme.bodyMedium!
              .copyWith(color: AppColors.kDarkSilver),
        ),
        6.w.pw,
        InkWell(
          onTap: onTap,
          child: Text(
            textSupmit,
            style: context.textTheme.bodyMedium!
                .copyWith(color: AppColors.mainColor),
          ),
        ),
      ],
    );
  }
}
