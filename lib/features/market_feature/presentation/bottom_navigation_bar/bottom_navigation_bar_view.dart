import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gomltak/core/utils/app_images.dart';
import 'package:gomltak/core/utils/app_string.dart';
import 'package:gomltak/core/utils/extentions.dart';
import 'package:gomltak/features/market_feature/presentation/account/account_view.dart';
import 'package:gomltak/features/market_feature/presentation/cart/cart_view.dart';
import 'package:gomltak/features/market_feature/presentation/home/home_view.dart';
import 'package:gomltak/features/market_feature/presentation/orders/orders_view.dart';

class BottomNavigationBarView extends StatefulWidget {
  const BottomNavigationBarView({super.key});

  @override
  _BottomNavigationBarViewState createState() => _BottomNavigationBarViewState();
}

class _BottomNavigationBarViewState extends State<BottomNavigationBarView> {
  int _selectedIndex = 0;

  final PageController _pageController = PageController(); // PageView controller

  static const List<Widget> _pages = <Widget>[
    HomeView(),
    CartView(),
    OrdersView(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
    _pageController.jumpToPage(index);  // تحديث الصفحة بناءً على الـ index
  }

  @override
  void dispose() {
    _pageController.dispose();  // تأكد من التخلص من controller
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const Drawer(
        child: AccountView(),
      ),
      appBar: AppBar(
        // title: Text(
        //   AppString., // يمكن تحديث العنوان بناءً على الصفحة النشطة
        // ),
       ),
      body: PageView(
        controller: _pageController,
        onPageChanged: (index) {
          setState(() {
            _selectedIndex = index;
          });
        },
        children: _pages,
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        selectedItemColor: context.theme!.primaryColor,
        items: [
          BottomNavigationBarItem(
            icon: SvgPicture.asset(AppImages.homeIconNavigationbar),
            label: AppString.home,
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset(AppImages.begIconNavigationbar),
            label: AppString.cart,
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset(AppImages.cartIconNavigationbar),
            label: AppString.orders,
          ),
        ],
      ),
    );
  }
}
