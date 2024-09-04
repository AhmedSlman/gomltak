import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:gomltak/core/utils/app_route.dart';
import 'package:gomltak/core/utils/app_string.dart';
import 'package:gomltak/core/utils/extentions.dart';
import 'package:gomltak/core/widgets/const_check_internet_conection.dart';
import 'package:gomltak/core/widgets/const_internet_desconected.dart';
import '../category/category_wigets/titel_all_category.dart';
import 'cubit/home_cubit.dart';
import 'home_widgets/grid_view_builder.dart';
import 'home_widgets/loding_shimmer_home/shimmer_offers_item.dart';
import 'home_widgets/offer_item.dart';
import 'home_widgets/see_all.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    HomeCubit cubit = HomeCubit.get(context);
    return CheckInternetConection(
        notInternetConection: const ConstInternetDesconected(),
        isInternetConection: CustomScrollView(
            controller: cubit.scrollController,
            physics: const BouncingScrollPhysics(),
            slivers: [
              SliverList(
                delegate: SliverChildListDelegate([
                  Column(
                    children: [
                      20.h.ph,
                      SizedBox(
                        height: 200.h,
                        child: BlocConsumer<HomeCubit, HomeState>(
                          listener: (context, state) {},
                          builder: (context, state) {
                            return Swiper(
                              scrollDirection: Axis.horizontal,
                              autoplay: true,
                              viewportFraction: .9,
                              indicatorLayout: PageIndicatorLayout.SCALE,
                              itemCount: cubit.listAllOffers.isEmpty
                                  ? 1
                                  : cubit.listAllOffers.length,
                              itemBuilder: (context, index) =>
                                  cubit.listAllOffers.isEmpty
                                      ? shimmerOffersItems()
                                      : offerItem(
                                          context: context,
                                          offer: cubit.listAllOffers[index],
                                        ),
                            );
                          },
                        ),
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          60.h.ph,
                          seeAll(
                            context: context,
                            onTap: () {
                              context.push(AppRouterPath.showAllCategoryView);
                            },
                            name: AppString.category,
                          ),
                          20.h.ph,
                          const TitelAllCategories(),
                          20.h.ph,
                          seeAll(
                            context: context,
                            onTap: () {
                              context.push(AppRouterPath.resentlyWidgets);
                            },
                            name: AppString.recentlyViewed,
                          ),
                          20.h.ph,
                          gridViewBuilder()
                        ],
                      ),
                    ],
                  ),
                ]),
              ),
            ]));
  }
}
