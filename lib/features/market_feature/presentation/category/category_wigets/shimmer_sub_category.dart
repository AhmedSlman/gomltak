import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gomltak/core/utils/app_colors.dart';
import 'package:shimmer/shimmer.dart';

shimmerCategory() {
  return Shimmer.fromColors(
    baseColor: Colors.grey[300]!,
    highlightColor: Colors.grey[100]!,
    child: Container(
      margin: EdgeInsets.all(10.w),
      width: 163.w,
      height: 139.h,
      decoration: BoxDecoration(
        color: AppColors.kChineseSilver,
        borderRadius: BorderRadius.all(Radius.circular(12.r)),
      ),
    ),
  );
}

shimmerSubCategory() {
  return Padding(
    padding: EdgeInsets.symmetric(horizontal: 18.w),
    child: Shimmer.fromColors(
      baseColor: Colors.grey[300]!,
      highlightColor: Colors.grey[100]!,
      child: Container(
        // margin: EdgeInsets.all(10.w),
        width: 100.w,
        height: 10.h,
        decoration: BoxDecoration(
          color: AppColors.kChineseSilver,
          borderRadius: BorderRadius.all(Radius.circular(12.r)),
        ),
      ),
    ),
  );
}
