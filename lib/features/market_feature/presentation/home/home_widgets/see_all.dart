import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gomltak/core/utils/app_colors.dart';
import 'package:gomltak/core/utils/app_string.dart';
import 'package:gomltak/core/utils/extentions.dart';

Widget seeAll({
  required BuildContext context,
  required Function()? onTap,
  required String name,
}) {
  return Padding(
    padding: EdgeInsets.symmetric(horizontal: 8.w),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          name.toUpperCase(),
          style: context.textTheme.titleMedium!
              .copyWith(color: AppColors.kBlack, 
              fontSize:14,
              fontWeight: FontWeight.w100),
        ),
        InkWell(
            onTap: onTap,
            child: Text(
              AppString.seeall,
              style: context.textTheme.bodySmall!
                  .copyWith(color: AppColors.kMetallicSeaweed,
                  fontSize:12)
            )),
      ],
    ),
  );
}
