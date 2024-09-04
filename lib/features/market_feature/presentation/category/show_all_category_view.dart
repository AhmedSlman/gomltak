// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:gomltak/core/utils/app_string.dart';

import 'package:gomltak/core/utils/extentions.dart';
import 'package:gomltak/core/widgets/const_appbar.dart';
import 'package:gomltak/features/market_feature/presentation/category/category_wigets/grid_view_builder_all_category.dart';

class ShowAllCategoryView extends StatelessWidget {
  const ShowAllCategoryView({
    Key? key,
    // required this.categoryName,
  }) : super(key: key);
  // final String categoryName;

  @override
  Widget build(BuildContext context) {
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
                    title: AppString.category,
                    onPressed: () {
                      context.pop();
                    },
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 27.w),
                    child: Column(
                      children: [
                        24.h.ph,
                        const GridVeiwCategoryItems(),
                      ],
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
