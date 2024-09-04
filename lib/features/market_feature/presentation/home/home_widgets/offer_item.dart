import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:gomltak/core/cached/cash_helper.dart';
import 'package:gomltak/core/utils/app_colors.dart';
import 'package:gomltak/core/utils/app_string.dart';
import 'package:gomltak/core/utils/extentions.dart';
import 'package:gomltak/features/market_feature/data/models/offers_model/offer.dart';

Container offerItem({
  required BuildContext context,
  Offer? offer,
}) {
  return Container(
    // padding: EdgeInsets.symmetric(horizontal: 15.w),
    margin: EdgeInsets.symmetric(horizontal: 10.w),
    height: 280.h,
    width: 342.w,
    clipBehavior: Clip.hardEdge,
    decoration: const BoxDecoration(
        color: AppColors.kCulturedF4F4F4,
        borderRadius: BorderRadius.all(Radius.circular(10))),
    child: Column(
      children: [
        Expanded(
          child: Stack(
            clipBehavior: Clip.hardEdge,
            fit: StackFit.loose,
            alignment: Alignment.bottomCenter,
            children: [
              SizedBox(
                // padding: EdgeInsets.symmetric(vertical: 20.h),
                height: 200.h,

                child: CachedNetworkImage(
                  imageUrl: 'https://gomltak.com/Backend/${offer?.image}',
                  fit: BoxFit.cover,
                ),
              ),
              Material(
                color: Colors.black54,
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 8.0, vertical: 3),
                  child: Text(
                    offer?.description ?? '',
                    style: context.textTheme.bodySmall!.copyWith(
                      color: AppColors.kWhite,
                      overflow: TextOverflow.ellipsis,
                    ),
                    maxLines: 2,
                    textAlign: TextAlign.start,
                  ),
                ),
              ),
            ],
          ),
        ),
        Material(
          color: AppColors.mainColor,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 3),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  offer?.title ?? '',
                  style: context.textTheme.bodySmall!.copyWith(
                    color: AppColors.kWhite,
                    fontWeight: FontWeight.w700,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      AppString.shopNow,
                      style: context.textTheme.bodySmall!.copyWith(
                        color: AppColors.kWhite,
                      ),
                      overflow: TextOverflow.ellipsis,
                    ),
                    8.w.pw,
                    Icon(
                      CachHelper.getData('lang') == 'ar'
                          ? FontAwesomeIcons.arrowLeftLong
                          : FontAwesomeIcons.arrowRightLong,
                      size: 16.sp,
                      color: AppColors.kWhite,
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ],
    ),
  );
}
