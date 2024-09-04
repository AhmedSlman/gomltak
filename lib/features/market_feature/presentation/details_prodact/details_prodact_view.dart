import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:gomltak/core/cached/cash_helper.dart';
import 'package:gomltak/core/utils/app_colors.dart';
import 'package:gomltak/core/utils/app_route.dart';
import 'package:gomltak/core/utils/app_string.dart';
import 'package:gomltak/core/utils/extentions.dart';
import 'package:gomltak/core/widgets/const_price_and_discound.dart';
import 'package:gomltak/core/widgets/custom_snack_bar.dart';
import 'package:gomltak/features/market_feature/presentation/cart/cubit/cart_cubit.dart';
import 'package:gomltak/features/market_feature/presentation/details_prodact/cubit/details_prodact_cubit.dart';
import 'package:gomltak/features/market_feature/presentation/home/home_widgets/icon_shop_botton.dart';
import 'cubit/details_prodact_state.dart';
import 'details_prodact_widgets/choose_color.dart';
import 'details_prodact_widgets/counter_widget.dart';
import 'details_prodact_widgets/details_image_widgets.dart';
import 'details_prodact_widgets/dropdown_item_size.dart';
import 'details_prodact_widgets/rating_stars.dart';
import 'details_prodact_widgets/shimmer_image_details.dart';
import 'details_prodact_widgets/tabbar_reviews_and_description.dart';

class DetailsView extends StatelessWidget {
  const DetailsView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    DetailsProdactCubit cubit = DetailsProdactCubit.get(context);
    return Scaffold(
      floatingActionButton: BlocListener<CartCubit, CartState>(
        listener: (context, state) {
          if (state is CartAddSuccess) {
            ScaffoldMessenger.of(context).showSnackBar(CustomSnackBar(
                content: Center(child: Text(state.successMassage))));
            context.pop(AppRouterPath.bottomNavigationBarView);
          }
          if (state is CartAddError) {
            ScaffoldMessenger.of(context).showSnackBar(
                CustomSnackBar(content: Center(child: Text(state.errMassage))));
          }
        },
        child: InkWell(
          onTap: () {
            if (CachHelper.getData('token') == null) {
              context.push(AppRouterPath.getStartedView);
            } else {
              if (cubit.selectedColorId != null) {
                CartCubit.get(context).addToCart(
                  productId: cubit.poducts.id!,
                  productColorId: cubit.selectedColorId!,
                  productSizeId:
                      cubit.selectedSizeId ?? cubit.poducts.sizes![0].id!,
                  quantity: cubit.numberCounter,
                );
              } else {
                ScaffoldMessenger.of(context).showSnackBar(CustomSnackBar(
                    content: Center(child: Text(AppString.chooseColor))));
              }
            }
          },
          child: Material(
            color: AppColors.mainColor,
            borderRadius: BorderRadius.circular(8.0),
            child: Padding(
                padding: const EdgeInsets.all(8.0), child: iconShopBotton()),
          ),
        ),
      ),
      body: SafeArea(
          child: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: BlocConsumer<DetailsProdactCubit, DetailsProdactState>(
          listener: (context, state) {},
          builder: (context, state) {
            return state is DetailsProdactLoding
                ? shimmerDetailsImage()
                : state is DetailsProdactSuccess
                    ? Column(
                        children: [
                          Stack(
                            children: [
                              DetaislImages(images: '${cubit.poducts.image}'),
                              Align(
                                  alignment: Alignment.topLeft,
                                  child: Row(
                                    children: [
                                      Padding(
                                        padding: EdgeInsets.symmetric(
                                            horizontal: 8.r, vertical: 18.r),
                                        child: Material(
                                            color: AppColors.kWhite
                                                .withOpacity(.5),
                                            shape: const CircleBorder(),
                                            child: const BackButton()),
                                      )
                                    ],
                                  ))
                            ],
                          ),
                          17.h.ph,
                          Container(
                            height: 140.h,
                            padding: EdgeInsets.symmetric(horizontal: 24.w),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      '${cubit.poducts.title}',
                                      style: context.textTheme.titleLarge!
                                          .copyWith(color: AppColors.mainColor),
                                      overflow: TextOverflow.clip,
                                      maxLines: 2,
                                    ),
                                    10.h.ph,
                                    // const Spacer(),
                                    constPriceAndDiscound(
                                        context: context,
                                        originalPrice:
                                            '${cubit.poducts.originalPrice}',
                                        sellingPrice:
                                            '${cubit.poducts.sellingPrice}'),
                                    22.h.ph,
                                    ratingStart(
                                        context: context,
                                        rate: cubit.poducts.avgRate?.toInt() ??
                                            1),
                                    // const Spacer(),
                                  ],
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  children: [
                                    ChooseColor(
                                      hexaColor: cubit.poducts.colors,
                                      onChanged: (selectColor) {
                                        cubit.selectedColorId = selectColor!;
                                      },
                                    ),
                                    18.h.ph,
                                    // const Spacer(),
                                    DropDownItemsSize(
                                        onChanged: (selectedSize) {
                                          cubit.selectedSizeId = int.parse(
                                              selectedSize.toString());
                                        },
                                        listSize: cubit.poducts.sizes),
                                    18.h.ph,
                                    // const Spacer(),
                                    Counter(
                                      itemCount: cubit.numberCounter,
                                      onTapMinus: () {
                                        cubit.minusItemNumber();
                                      },
                                      onTapPlus: () {
                                        cubit.plusItemNumber();
                                      },
                                    ),
                                  ],
                                )
                              ],
                            ),
                          ),
                          10.h.ph,
                          const TabBarReviewsAndDescription(),
                        ],
                      )
                    : const Center(child: Text('ERORR'));
          },
        ),
      )),
    );
  }
}
