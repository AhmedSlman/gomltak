import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gomltak/core/utils/app_colors.dart';
import 'package:gomltak/core/utils/app_images.dart';

ClipRRect iconShopBotton() {
  return ClipRRect(
    borderRadius: BorderRadius.circular(100.r),
    child: Container(
      width: 40.w,
      height: 40.w,
      color: AppColors.mainColor,
      alignment: Alignment.center,
      child: SvgPicture.asset(
        AppImages.bag,
        width: 24.w,
        height: 24.w,
      ),
    ),
  );
}

Container shopBotton() {
  return Container(
    padding: EdgeInsets.all(4.w),
    decoration: BoxDecoration(
      color: AppColors.kWhite,
      borderRadius: const BorderRadius.all(Radius.circular(100)),
      boxShadow: const [
        BoxShadow(
          blurRadius: 4,
          color: AppColors.kRGPDAvatarShadow,
        ),
      ],
      border: Border.all(
        color: AppColors.mainColor,
        width: 1,
      ),
    ),
    child: ClipRRect(
      borderRadius: BorderRadius.circular(100.r),
      child: Container(
        width: 40.w,
        height: 40.w,
        alignment: Alignment.center,
        child: Image.asset(
          AppImages.profileAvatar,
          width: 40.w,
          height: 40.w,
          fit: BoxFit.fill,
        ),
      ),
    ),
  );
}
