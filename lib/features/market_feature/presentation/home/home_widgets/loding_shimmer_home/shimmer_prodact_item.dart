import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gomltak/core/utils/app_colors.dart';
import 'package:gomltak/core/utils/extentions.dart';
import 'package:gomltak/features/market_feature/presentation/home/home_widgets/clippath_prodact.dart';
import 'package:shimmer/shimmer.dart';

// baseColor: Colors.grey[300]!,
// highlightColor: Colors.grey[100]!,

shimmerProdactItems() {
  return Shimmer.fromColors(
      baseColor: Colors.grey[300]!,
      highlightColor: Colors.grey[100]!,
      child: SizedBox(
        width: 160.w,
        height: 259.h,
        child: Column(
          children: [
            SizedBox(
              width: 160.w,
              height: 207.w,
              child: Stack(
                children: [
                  ClipPath(
                    clipper: ClipItems(),
                    child: Container(
                      width: 160.w,
                      height: 190.w,
                      decoration: BoxDecoration(
                          color: AppColors.kWhite,
                          borderRadius: BorderRadius.circular(15.r)),
                    ),
                  ),
                  8.h.ph,
                  Align(
                      alignment: Alignment.bottomCenter,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(100),
                        child: Container(
                          width: 40.w,
                          height: 40.w,
                          color: AppColors.kWhite,
                        ),
                      )),
                ],
              ),
            ),
            Column(
              children: [
                8.h.ph,
                Container(
                  width: 150.w,
                  height: 15.h,
                  decoration: BoxDecoration(
                      color: AppColors.kWhite,
                      borderRadius: BorderRadius.circular(15.r)),
                ),
                8.h.ph,
                Container(
                  width: 150.w,
                  height: 15.h,
                  decoration: BoxDecoration(
                      color: AppColors.kWhite,
                      borderRadius: BorderRadius.circular(15.r)),
                ),
              ],
            )
          ],
        ),
      ));
}
