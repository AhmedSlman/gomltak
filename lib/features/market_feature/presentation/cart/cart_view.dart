// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:gomltak/core/cached/cash_helper.dart';
import 'package:gomltak/core/utils/app_colors.dart';
import 'package:gomltak/core/utils/app_route.dart';
import 'package:gomltak/core/utils/app_string.dart';
import 'package:gomltak/core/utils/extentions.dart';
import 'package:gomltak/core/widgets/const_elevated_button.dart';
import 'package:gomltak/core/widgets/custom_snack_bar.dart';
import 'package:gomltak/features/market_feature/presentation/cart/cubit/cart_cubit.dart';

import 'cart_widgets/form_inpute_discount.dart';
import 'cart_widgets/item_cart.dart';
import 'cart_widgets/shimmer_cart.dart';

class CartView extends StatelessWidget {
  const CartView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<CartCubit, CartState>(
      listener: (context, state) {},
      builder: (context, state) {
        return state is CartLoding
            ? shimmerCart()
            : CustomScrollView(
                physics: const BouncingScrollPhysics(),
                slivers: [
                    SliverList(
                      delegate: SliverChildListDelegate([
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 27.w),
                          child: Column(
                            children: [
                              30.h.ph,
                              Text(
                                AppString.cart,
                                style: context.textTheme.titleLarge,
                                textAlign: TextAlign.center,
                              ),
                              32.h.ph,
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    '${AppString.totalItems}(${CartCubit.get(context).listItemsCart.length})',
                                    style:
                                        context.textTheme.bodyMedium!.copyWith(
                                      color: AppColors.kDarkSilver,
                                    ),
                                  ),
                                  InkWell(
                                    onTap: () {
                                      CartCubit.get(context)
                                          .deleteAllProdactToCart();
                                    },
                                    child: Text(
                                      AppString.emptyCart,
                                      style: context.textTheme.bodyMedium!
                                          .copyWith(
                                        color: AppColors.kKUCrimson,
                                      ),
                                    ),
                                  )
                                ],
                              ),
                              18.h.ph,
                              ListView.separated(
                                physics: const NeverScrollableScrollPhysics(),
                                shrinkWrap: true,
                                separatorBuilder: (context, index) => 24.h.ph,
                                itemCount:
                                    CartCubit.get(context).listItemsCart.length,
                                itemBuilder: (context, index) {
                                  return ItemsInCart(
                                    index: index,
                                    listItemsCart:
                                        CartCubit.get(context).listItemsCart,
                                  );
                                },
                              ),
                              34.h.ph,
                              CachHelper.getData('token') == null
                                  ? const SizedBox()
                                  : CartCubit.get(context).listItemsCart.isEmpty
                                      ? const SizedBox()
                                      : const FormInputeDiscount(),
                              31.h.ph,
                              Column(
                                children: [
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        AppString.subtotal,
                                        style: context.textTheme.bodyMedium!
                                            .copyWith(
                                                color: AppColors.kDarkSilver),
                                      ),
                                      Text(
                                        '${CartCubit.get(context).subTotalPrice}',
                                        style: context.textTheme.bodyMedium!
                                            .copyWith(
                                                color: AppColors.kDarkSilver),
                                      ),
                                    ],
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        AppString.shipping,
                                        style: context.textTheme.bodyMedium!
                                            .copyWith(
                                                color: AppColors.kDarkSilver),
                                      ),
                                      8.h.ph,
                                      Text(
                                        '${CartCubit.get(context).shipping == 0 ? AppString.free : CartCubit.get(context).shipping}',
                                        style: context.textTheme.bodyMedium!
                                            .copyWith(
                                                color: AppColors.kDarkSilver),
                                      ),
                                    ],
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        AppString.total,
                                        style: context.textTheme.bodyMedium!
                                            .copyWith(
                                                color: AppColors.kDarkSilver),
                                      ),
                                      8.h.ph,
                                      Text(
                                        '${CartCubit.get(context).totlaPriceAdnDiscount == 0 ? CartCubit.get(context).totlaPrice : CartCubit.get(context).totlaPriceAdnDiscount}',
                                        style: context.textTheme.bodyMedium!
                                            .copyWith(
                                                color: AppColors.kDarkSilver),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                              20.h.ph,
                              Container(
                                width: context.width,
                                padding: EdgeInsets.symmetric(horizontal: 5.w),
                                height: 40.h,
                                decoration: BoxDecoration(
                                  color: AppColors.kAzureishWhiteCFE7E8,
                                  borderRadius: BorderRadius.circular(8.r),
                                ),
                                child: Row(children: [
                                  Text(AppString.cashOnDelivery,
                                      style: context.textTheme.bodyLarge),
                                  const Spacer(),
                                  Checkbox(
                                    value: true,
                                    onChanged: (value) {},
                                    activeColor: AppColors.mainColor,
                                  )
                                ]),
                              ),
                              20.h.ph,
                              ConstElevatedButton(
                                onPressed: () {
                                  if (CachHelper.getData("token") == null) {
                                    context.pushReplacement(
                                      AppRouterPath.getStartedView,
                                    );
                                  } else if (CartCubit.get(context)
                                      .listItemsCart
                                      .isNotEmpty) {
                                    context.push(
                                      AppRouterPath.checkoutView,
                                    );
                                  } else if (CartCubit.get(context)
                                      .listItemsCart
                                      .isEmpty) {
                                    ScaffoldMessenger.of(context).showSnackBar(
                                        CustomSnackBar(
                                            content: Center(
                                                child: Text(AppString.emptyCart,
                                                    textAlign:
                                                        TextAlign.center))));
                                  }
                                },
                                text: AppString.checkout,
                              ),
                              42.h.ph,
                            ],
                          ),
                        ),
                      ]),
                    ),
                  ]);
      },
    );
  }
}
