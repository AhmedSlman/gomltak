import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gomltak/core/utils/app_colors.dart';
import 'package:gomltak/core/utils/extentions.dart';

ConstrainedBox constPriceAndDiscound({
  required BuildContext context,
  String? originalPrice,
  String? sellingPrice,
}) {
  return ConstrainedBox(
    constraints: BoxConstraints(maxWidth: 120.w, minWidth: 50.w),
    child: Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          sellingPrice ?? '',
          style: context.textTheme.bodyLarge!.copyWith(
            color: AppColors.kArsenic,
            overflow: TextOverflow.ellipsis,
          ),
          textAlign: TextAlign.end,
        ),
        2.w.pw,
        Text(
          originalPrice ?? '',
          style: context.textTheme.bodySmall!.copyWith(
              color: AppColors.kDarkSilver,
              decoration: TextDecoration.lineThrough,
              overflow: TextOverflow.ellipsis),
          textAlign: TextAlign.start,
        ),
      ],
    ),
  );
}
