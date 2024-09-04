import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:gomltak/core/utils/app_colors.dart';
import 'package:gomltak/core/utils/app_route.dart';
import 'package:gomltak/core/utils/app_string.dart';
import 'package:gomltak/core/utils/extentions.dart';
import 'package:gomltak/core/widgets/const_appbar.dart';
import 'package:gomltak/core/widgets/const_price_and_discound.dart';

import '../cubit/home_cubit.dart';
import 'clippath_prodact.dart';
import 'icon_shop_botton.dart';

class ResentlyWidgets extends StatelessWidget {
  const ResentlyWidgets({super.key});

  @override
  Widget build(BuildContext context) {
    HomeCubit cubit = HomeCubit.get(context);
    return Scaffold(
        body: SafeArea(
            child: CustomScrollView(
      physics: const BouncingScrollPhysics(),
      slivers: [
        SliverList(
          delegate: SliverChildListDelegate(
            [
              36.h.ph,
              ConstAppBar(
                body: '',
                title: AppString.recentlyViewed,
                onPressed: () {
                  context.pop();
                },
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 27.w),
                child: Column(
                  children: [
                    24.h.ph,
                    SizedBox(
                      width: context.width,
                      height: context.height,
                      child: GridView.builder(
                        physics: const NeverScrollableScrollPhysics(),
                        // shrinkWrap: true,
                        // reverse: true,
                        itemCount: cubit.uniqueListlistRecenclyViews.length,
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: (2),
                          childAspectRatio: .63,
                        ),
                        itemBuilder: (context, index) {
                          return SizedBox(
                            width: 160.w,
                            height: 259.h,
                            child: Column(
                              // clipBehavior: Clip.none,
                              children: [
                                InkWell(
                                  onTap: () {
                                    context.push(
                                      AppRouterPath.detailsView,
                                      extra: cubit
                                          .uniqueListlistRecenclyViews[index]
                                          .id,
                                      // extra: prodact.id?.toInt(),
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
                                                errorWidget:
                                                    (context, url, error) =>
                                                        Container(),
                                                imageUrl: cubit
                                                            .uniqueListlistRecenclyViews[
                                                                index]
                                                            .image !=
                                                        null
                                                    ? 'https://gomltak.com/Backend/${cubit.uniqueListlistRecenclyViews[index].image}'
                                                    : 'https://thumbs.dreamstime.com/b/error-rubber-stamp-word-error-inside-illustration-109026446.jpg',
                                                fit: BoxFit.cover,
                                              ),
                                            ),
                                          ),
                                        ),
                                        Align(
                                          alignment: Alignment.bottomCenter,
                                          child: ClipRRect(
                                              borderRadius:
                                                  BorderRadius.circular(100),
                                              child: iconShopBotton()),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                8.h.ph,
                                Align(
                                  alignment: Alignment.bottomCenter,
                                  child: SizedBox(
                                    width: 160.w,
                                    child: Column(
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        Text(
                                          "${cubit.uniqueListlistRecenclyViews[index].title}",
                                          overflow: TextOverflow.ellipsis,
                                          style: context.textTheme.bodySmall!
                                              .copyWith(
                                            color: AppColors.kMaastrichtBlue,
                                          ),
                                        ),
                                        2.h.ph,
                                        Row(
                                          mainAxisSize: MainAxisSize.min,
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            constPriceAndDiscound(
                                              context: context,
                                              originalPrice:
                                                  '${cubit.uniqueListlistRecenclyViews[index].originalPrice}',
                                              sellingPrice:
                                                  '${cubit.uniqueListlistRecenclyViews[index].sellingPrice}',
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
                        },
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
        )
      ],
    )));
  }
}



// ignore_for_file: public_member_api_docs, sort_constructors_first

 