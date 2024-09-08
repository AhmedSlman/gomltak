import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:gomltak/core/utils/app_colors.dart';
import 'package:gomltak/core/utils/app_route.dart';
import 'package:gomltak/core/utils/extentions.dart';
import 'package:gomltak/core/widgets/const_price_and_discound.dart';
import 'package:gomltak/features/market_feature/data/models/all_prodacts_model/datum.dart';
import 'package:gomltak/features/market_feature/data/models/recently_view_model/resently_view_model.dart';
import 'package:gomltak/features/market_feature/presentation/home/cubit/home_cubit.dart';
import 'clippath_prodact.dart';
import 'icon_shop_botton.dart';

SizedBox prodactItem({
  required BuildContext context,
  required Datum prodact,
}) {
  return SizedBox(
    width: 160.w,
    // height: 259.h,
    child: Column(
      // clipBehavior: Clip.none,
      children: [
        InkWell(
          onTap: () {
            HomeCubit.get(context).recenclyViews(
                oneItemrecenclyViews: ResentlyViewModel(
              image: prodact.image,
              title: prodact.title,
              id: prodact.id?.toInt(),
              originalPrice: prodact.originalPrice?.toInt(),
              sellingPrice: prodact.sellingPrice?.toInt(),
            ));
            context.push(
              AppRouterPath.detailsView,
              extra: prodact.id?.toInt(),
            );
          },
          child: SizedBox(
            width: 160.w,
            height: 207.w,
            child: Stack(
              clipBehavior: Clip.none,
              children: [
                SizedBox(
                  width: 160.w,
                  height: 190.w,
                  child: ClipPath(
                    clipper: ClipItems(),
                    child: SizedBox(
                      width: 160.w,
                      height: 190.w,
                      child: CachedNetworkImage(
                        imageUrl:
                            'https://gomltak.com/Backend/${prodact.image}',
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
                Align(
                  alignment: Alignment.bottomCenter,
                  child: ClipRRect(
                      borderRadius: BorderRadius.circular(100),
                      child: InkWell(
                        child: iconShopBotton(),
                      )),
                ),
              ],
            ),
          ),
        ),
        // 8.h.ph,
        Align(
          alignment: Alignment.topCenter,
          child: SizedBox(
            width: 160.w,
            child: Row(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Text(
                    prodact.title!.toUpperCase(),
                    overflow: TextOverflow.ellipsis,
                    maxLines: 1,
                    style: context.textTheme.bodyLarge!.copyWith(
                      color: AppColors.kMaastrichtBlue,
                      fontSize:16
                    ),
                  ),
                ),
                // 2.w.pw,
                constPriceAndDiscound(
                  context: context,
                  originalPrice: '${prodact.originalPrice}',
                  sellingPrice: '${prodact.sellingPrice}',
                ),
              ],
            ),
          ),
        ),
      ],
    ),
  );
}
