import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gomltak/core/utils/app_colors.dart';
import 'package:gomltak/core/utils/extentions.dart';
import 'package:shimmer/shimmer.dart';

shimmerCart() {
  return Shimmer.fromColors(
    baseColor: Colors.grey[300]!,
    highlightColor: Colors.grey[100]!,
    child: Padding(
      padding: EdgeInsets.symmetric(horizontal: 24.w),
      child: Column(
        children: [
          double.infinity.pw,
          50.h.ph,
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30.r),
                  color: AppColors.kWhite,
                ),
                height: 20.h,
                width: 70.w,
              ),
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30.r),
                  color: AppColors.kWhite,
                ),
                height: 20.h,
                width: 70.w,
              ),
            ],
          ),
          25.h.ph,
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30.r),
                  color: AppColors.kWhite,
                ),
                height: 20.h,
                width: 70.w,
              ),
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30.r),
                  color: AppColors.kWhite,
                ),
                height: 20.h,
                width: 70.w,
              ),
            ],
          ),
          25.h.ph,
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30.r),
                  color: AppColors.kWhite,
                ),
                height: 20.h,
                width: 70.w,
              ),
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30.r),
                  color: AppColors.kWhite,
                ),
                height: 20.h,
                width: 70.w,
              ),
            ],
          ),
          25.h.ph,
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30.r),
                  color: AppColors.kWhite,
                ),
                height: 20.h,
                width: 70.w,
              ),
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30.r),
                  color: AppColors.kWhite,
                ),
                height: 20.h,
                width: 70.w,
              ),
            ],
          ),
          25.h.ph,
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30.r),
                  color: AppColors.kWhite,
                ),
                height: 20.h,
                width: 70.w,
              ),
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30.r),
                  color: AppColors.kWhite,
                ),
                height: 20.h,
                width: 70.w,
              ),
            ],
          ),
          70.h.ph,
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(30.r),
              color: AppColors.kWhite,
            ),
            height: 50.h,
            width: 340.w,
          ),
        ],
      ),
    ),
  );
}
