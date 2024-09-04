import 'package:flutter/material.dart';
import 'package:gomltak/core/utils/app_images.dart';
import 'package:gomltak/core/utils/app_string.dart';
import 'package:gomltak/core/utils/extentions.dart';
import 'package:gomltak/features/market_feature/presentation/account/account_view.dart';
import 'package:gomltak/features/market_feature/presentation/bottom_navigation_bar/bottom_navigation_bar_widgets/icon_buttom_navigation_bar.dart';
import 'package:gomltak/features/market_feature/presentation/cart/cart_view.dart';
import 'package:gomltak/features/market_feature/presentation/home/home_view.dart';
import 'package:gomltak/features/market_feature/presentation/orders/orders_view.dart';

class BottomNavigationBarView extends StatelessWidget {
  const BottomNavigationBarView({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
          drawer: const AccountView(),
          appBar: AppBar(
            title: TabBar(
                indicatorColor: context.theme!.primaryColor,
                padding: EdgeInsets.zero,
                indicatorSize: TabBarIndicatorSize.tab,
                labelColor: context.theme!.primaryColor,
                tabs: [
                  TabItem(
                    label: AppString.home,
                    imageActiveIconSvg: AppImages.homeIconNavigationbar,
                  ),
                  TabItem(
                    label: AppString.cart,
                    imageActiveIconSvg: AppImages.begIconNavigationbar,
                  ),
                  TabItem(
                    label: AppString.orders,
                    imageActiveIconSvg: AppImages.cartIconNavigationbar,
                  ),
                ]),
          ),
          body: const SafeArea(
              child: TabBarView(
            children: [
              HomeView(),
              CartView(),
              OrdersView(),
            ],
          ))),
    );
  }
}
