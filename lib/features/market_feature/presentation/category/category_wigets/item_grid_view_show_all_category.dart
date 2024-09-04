import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:gomltak/core/utils/app_colors.dart';
import 'package:gomltak/core/utils/app_route.dart';
import 'package:gomltak/core/utils/extentions.dart';
import 'package:gomltak/features/market_feature/data/models/all_category_model/category.dart';

InkWell itemGridViewShowAllCategory({
  required BuildContext context,
  required Category category,
}) {
  return InkWell(
    onTap: () {
      context.push(AppRouterPath.subCategory, extra: category.id);
    },
    child: Container(
      alignment: Alignment.bottomCenter,
      margin: const EdgeInsets.all(10),
      width: 163.w,
      height: 139.h,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: NetworkImage(
            'https://gomltak.com/Backend/${category.image}',
          ),
          fit: BoxFit.cover,
        ),
        color: AppColors.kChineseSilver,
        borderRadius: BorderRadius.all(Radius.circular(12.r)),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            height: 37.h,
            width: double.infinity,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              borderRadius:
                  BorderRadius.vertical(bottom: Radius.circular(12.r)),
              color: AppColors.kWhite,
            ),
            child: Text(
              '${category.title}',
              style: context.textTheme.titleSmall!.copyWith(
                // color: AppColors.kWhite,
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ),
        ],
      ),
    ),
  );
}
