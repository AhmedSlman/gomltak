import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gomltak/core/utils/app_colors.dart';
// import 'package:gomltak/core/utils/extentions.dart';

Row ratingStart({required BuildContext context, required int rate}) {
  return Row(crossAxisAlignment: CrossAxisAlignment.center, children: [
    ...List.generate(
      rate,
      (index) => Padding(
        padding: const EdgeInsets.all(1.0),
        child: Icon(
          Icons.star_rate_rounded,
          size: 30.sp,
          color: AppColors.kSaffron,
        ),
      ),
    ),
    ...List.generate(
      5 - rate,
      (index) => Padding(
        padding: const EdgeInsets.all(1.0),
        child: Icon(
          Icons.star_rate_rounded,
          size: 30.sp,
          color: AppColors.kLightSilver,
        ),
      ),
    )
  ]);
}
