import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gomltak/core/utils/app_colors.dart';
import 'package:gomltak/core/utils/app_string.dart';
import 'package:gomltak/core/utils/extentions.dart';

import 'descriptiion_details.dart';

class TabBarReviewsAndDescription extends StatefulWidget {
  const TabBarReviewsAndDescription({
    super.key,
  });

  @override
  State<TabBarReviewsAndDescription> createState() =>
      _TabBarReviewsAndDescriptionState();
}

class _TabBarReviewsAndDescriptionState
    extends State<TabBarReviewsAndDescription> with TickerProviderStateMixin {
  late TabController tabController;
  int selectedIndex = 0;

  @override
  void initState() {
    super.initState();

    tabController = TabController(
      length: 1,
      vsync: this,
      initialIndex: selectedIndex,
    );
    tabController.addListener(_handleTabSelection);
  }

  _handleTabSelection() {
    if (tabController.indexIsChanging) {
      setState(() {
        selectedIndex = tabController.index;
      });
    }
  }

  @override
  void dispose() {
    tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TabBar(
            indicatorWeight: 1.w,
            labelColor: AppColors.kMetallicSeaweed,
            labelStyle: context.textTheme.bodyMedium!.copyWith(
              color: AppColors.kBlack,
            ),
            indicatorColor: AppColors.kMetallicSeaweed,
            unselectedLabelColor: AppColors.kDarkSilver,
            indicatorSize: TabBarIndicatorSize.tab,
            controller: tabController,
            tabs: <Tab>[
              Tab(
                text: AppString.description,
              ),
              // Tab(
              //   text: AppString.reviews,
              // ),
            ]),
        Container(
          padding: EdgeInsets.symmetric(horizontal: 24.w),
          child: IndexedStack(
            index: 0,
            children: <Widget>[
              Visibility(
                maintainState: true,
                visible: selectedIndex == 0,
                child: const DescriptionDetails(),
              ),
              // Visibility(
              //     maintainState: true,
              //     visible: selectedIndex == 1,
              //     child: const ReviewsDetails()),
            ],
          ),
        )
      ],
    );
  }
}
