import 'dart:ui';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gomltak/core/utils/app_colors.dart';
import 'package:gomltak/core/utils/extentions.dart';

Widget itemSubCategry({
  required BuildContext context,
  required Function()? onTap,
  required String nameCategory,
  required String image,
  int? index,
}) {
  return Padding(
    padding: EdgeInsets.symmetric(horizontal: 6.w),
    child: InkWell(
      onTap: onTap,
      child: Material(
        elevation: 5,
        child: Container(
          width: 150.w,
          height: 60.h,
          decoration: BoxDecoration(
            image: DecorationImage(
                image: CachedNetworkImageProvider(
                    'https://gomltak.com/Backend/$image'),
                fit: BoxFit.cover),
            border: Border.all(),
            borderRadius: BorderRadius.circular(8),
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 1.7, sigmaY: 1.7),
              child: Container(
                color: Colors.white.withOpacity(0.2),
                child: Center(
                  child: Text(
                    nameCategory.toUpperCase(),
                    style:
                        context.textTheme.bodyLarge!.copyWith(shadows: const [
                      Shadow(
                        // BottomLeft
                        offset: Offset(-1.5, -1.5),
                        color: AppColors.kWhite,
                      ),
                      Shadow(
                        // BottomRight
                        offset: Offset(1.5, -1.5),
                        color: AppColors.kWhite,
                      ),
                      Shadow(
                        // TopRight
                        offset: Offset(1.5, 1.5),
                        color: AppColors.kWhite,
                      ),
                      Shadow(
                        // TopLeft
                        offset: Offset(-1.5, 1.5),
                        color: AppColors.kWhite,
                      ),
                    ], fontWeight: FontWeight.w900, color: AppColors.kBlack),
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    ),
  );
}
