import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gomltak/core/utils/app_colors.dart';
import 'package:gomltak/core/utils/extentions.dart';
import 'package:shimmer/shimmer.dart';

shimmerDetailsImage() {
  return Shimmer.fromColors(
    baseColor: Colors.grey[300]!,
    highlightColor: Colors.grey[100]!,
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          height: 315.h,
          width: double.infinity,
          color: AppColors.kWhite,
        ),
        Container(
          height: 155.h,
          padding: EdgeInsets.symmetric(horizontal: 24.w),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                children: [
                  20.h.ph,
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8.r),
                      color: AppColors.kWhite,
                    ),
                    width: 100.w,
                    height: 20.h,
                  ),
                  const Spacer(),
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8.r),
                      color: AppColors.kWhite,
                    ),
                    width: 100.w,
                    height: 20.h,
                  ),
                  const Spacer(),
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8.r),
                      color: AppColors.kWhite,
                    ),
                    width: 100.w,
                    height: 20.h,
                  ),
                  const Spacer(),
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8.r),
                      color: AppColors.kWhite,
                    ),
                    width: 100.w,
                    height: 20.h,
                  ),
                ],
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  20.h.ph,
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8.r),
                      color: AppColors.kWhite,
                    ),
                    width: 100.w,
                    height: 20.h,
                  ),
                  const Spacer(),
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8.r),
                      color: AppColors.kWhite,
                    ),
                    width: 100.w,
                    height: 20.h,
                  ),
                  10.h.ph,
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8.r),
                      color: AppColors.kWhite,
                    ),
                    width: 100.w,
                    height: 30.h,
                  ),
                ],
              ),
            ],
          ),
        ),
        20.h.ph,
        Container(
          margin: EdgeInsets.symmetric(horizontal: 24.w),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8.r),
                  color: AppColors.kWhite,
                ),
                width: 100.w,
                height: 40.h,
              ),
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8.r),
                  color: AppColors.kWhite,
                ),
                width: 100.w,
                height: 40.h,
              ),
            ],
          ),
        ),
        20.w.pw,
        Container(
          color: AppColors.kWhite,
          width: double.infinity.w,
          height: 1.h,
        ),
        15.h.ph,
        Container(
          margin: EdgeInsets.symmetric(horizontal: 24.w),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8.r),
            color: AppColors.kWhite,
          ),
          width: 300.w,
          height: 20.h,
        ),
        15.h.ph,
        Container(
          margin: EdgeInsets.symmetric(horizontal: 24.w),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8.r),
            color: AppColors.kWhite,
          ),
          width: 290.w,
          height: 20.h,
        ),
        15.h.ph,
        Container(
          margin: EdgeInsets.symmetric(horizontal: 24.w),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8.r),
            color: AppColors.kWhite,
          ),
          width: 260.w,
          height: 20.h,
        ),
      ],
    ),
  );
}
