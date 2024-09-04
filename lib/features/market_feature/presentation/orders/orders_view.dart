import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gomltak/core/cached/cash_helper.dart';
import 'package:gomltak/core/service_locator/services_locator.dart';
import 'package:gomltak/core/utils/app_string.dart';
import 'package:gomltak/core/utils/extentions.dart';
import 'package:gomltak/features/market_feature/data/repositories_impel/my_orders_repo_impel.dart';
import 'package:gomltak/features/market_feature/presentation/home/home_widgets/loding_shimmer_home/shimmer_offers_item.dart';
import 'package:gomltak/features/market_feature/presentation/orders/cubit/my_orders_cubit.dart';
import 'package:gomltak/features/market_feature/presentation/orders/order_widgets/order_items.dart';

class OrdersView extends StatelessWidget {
  const OrdersView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (context) =>
            MyOrdersCubit(sl.get<MyOrdersRepoImpel>())..fetchAllOrders(),
        child:
            CustomScrollView(physics: const BouncingScrollPhysics(), slivers: [
          SliverList(
            delegate: SliverChildListDelegate([
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 27.w),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      30.h.ph,
                      Text(
                        AppString.orders,
                        style: context.textTheme.titleLarge,
                        textAlign: TextAlign.center,
                      ),
                      18.h.ph,
                      CachHelper.getData('token') == null
                          ? SizedBox(
                              child: Text(
                                AppString.pleaseLoginFirst,
                                style: context.textTheme.labelLarge,
                              ),
                            )
                          : BlocBuilder<MyOrdersCubit, MyOrdersState>(
                              builder: (context, state) {
                                return (state is MyOrdersSuccess &&
                                        MyOrdersCubit.get(context)
                                            .lsitMyOrders
                                            .isEmpty)
                                    ? SizedBox(
                                        child: Text(
                                          AppString.noPreviousRequests,
                                          style: context.textTheme.labelLarge,
                                        ),
                                      )
                                    : ListView.separated(
                                        physics:
                                            const NeverScrollableScrollPhysics(),
                                        separatorBuilder: (context, index) =>
                                            24.h.ph,
                                        itemCount: MyOrdersCubit.get(context)
                                                .lsitMyOrders
                                                .isEmpty
                                            ? 3
                                            : MyOrdersCubit.get(context)
                                                .lsitMyOrders
                                                .length,
                                        shrinkWrap: true,
                                        itemBuilder: (context, index) {
                                          return MyOrdersCubit.get(context)
                                                  .lsitMyOrders
                                                  .isEmpty
                                              ? shimmerOffersItems()
                                              : OrderItem(
                                                  product:
                                                      MyOrdersCubit.get(context)
                                                          .lsitMyOrders[index],
                                                );
                                        },
                                      );
                              },
                            )
                    ]),
              ),
            ]),
          ),
        ]));
  }
}
