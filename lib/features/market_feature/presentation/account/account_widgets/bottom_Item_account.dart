import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gomltak/core/utils/app_colors.dart';
import 'package:gomltak/core/utils/extentions.dart';

InkWell bottomItemAccount({
  required BuildContext context,
  required String imageIcon,
  required String nameBottom,
  required void Function()? onTap,
}) {
  return InkWell(
    onTap: onTap,
    child: Container(
      height: 52.h,
      alignment: Alignment.center,
      padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 7.h),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12.r),
        color: AppColors.kGhostWhite,
        boxShadow: const [
          BoxShadow(
            color: Color.fromRGBO(32, 27, 57, 0.08),
            blurRadius: 12,
            offset: Offset(0, 3),
          ),
        ],
      ),
      child: Row(
        children: [
          SvgPicture.asset(
            imageIcon,
            width: 36.w,
            height: 36.h,
          ),
          12.w.pw,
          Text(
            nameBottom,
            style:
                context.textTheme.titleSmall!.copyWith(color: AppColors.kBlack),
          ),
          const Spacer(),
          const Icon(
            Icons.arrow_forward_ios_rounded,
            color: AppColors.kBlack,
          )
        ],
      ),
    ),
  );
}
