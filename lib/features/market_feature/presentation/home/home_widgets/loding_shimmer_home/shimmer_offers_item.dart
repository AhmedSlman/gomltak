import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gomltak/core/utils/app_colors.dart';
import 'package:gomltak/core/utils/extentions.dart';
import 'package:shimmer/shimmer.dart';

shimmerOffersItems() {
  return Shimmer.fromColors(
    baseColor: Colors.grey[300]!,
    highlightColor: Colors.grey[100]!,
    child: Container(
      padding: EdgeInsets.symmetric(horizontal: 15.w),
      margin: EdgeInsets.symmetric(horizontal: 5.w),
      height: 200.h,
      width: 342.w,
      child: Column(
        // clipBehavior: Clip.none,
        children: [
          Container(
            padding: EdgeInsets.symmetric(vertical: 5.h),
            width: 342.w,
            height: 178.h,
            decoration: BoxDecoration(
                color: AppColors.kWhite,
                borderRadius: BorderRadius.circular(15.r)),
          ),
          5.h.ph,
          Container(
            width: double.infinity,
            height: 16.h,
            decoration: BoxDecoration(
                color: AppColors.kWhite,
                borderRadius: BorderRadius.circular(15.r)),
          ),
        ],
      ),
    ),
  );
}
