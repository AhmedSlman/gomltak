import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gomltak/core/cached/cash_helper.dart';
import 'package:gomltak/core/utils/app_colors.dart';
import 'package:gomltak/core/utils/app_string.dart';
import 'package:gomltak/core/utils/extentions.dart';
import 'icon_shop_botton.dart';

Row appBarHome(BuildContext context) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.start,
    children: [
      shopBotton(),
      14.w.pw,
      Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            AppString.welcomeBack,
            style: context.textTheme.bodySmall!
                .copyWith(color: AppColors.kIndependence),
          ),
          Text(
            CachHelper.getData('userName') != null
                ? CachHelper.getData('userName').toString()
                : AppString.guest,
            style: context.textTheme.bodyMedium!.copyWith(
              color: AppColors.kZinnwalditeBrown,
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    ],
  );
}
