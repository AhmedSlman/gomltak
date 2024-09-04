import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:gomltak/core/utils/app_route.dart';
import 'package:gomltak/core/utils/extentions.dart';
import 'package:gomltak/features/market_feature/presentation/home/cubit/home_cubit.dart';
import 'package:gomltak/features/market_feature/presentation/home/home_widgets/loding_shimmer_home/shimmer_title_all_category.dart';

import 'categry_item.dart';

class TitelAllCategories extends StatelessWidget {
  const TitelAllCategories({
    super.key,
  });
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeCubit, HomeState>(
      builder: (context, state) {
        return SizedBox(
          height: 60.h,
          width: context.width,
          child: ListView.separated(
            scrollDirection: Axis.horizontal,
            separatorBuilder: (context, index) => 5.w.pw,
            itemCount: HomeCubit.get(context).listAllCategory.isEmpty
                ? 4
                : HomeCubit.get(context).listAllCategory.length,
            shrinkWrap: true,
            itemBuilder: (context, index) {
              return HomeCubit.get(context).listAllCategory.isEmpty
                  ? shimmerTileAllCategory()
                  : itemSubCategry(
                      index: index,
                      image:
                          HomeCubit.get(context).listAllCategory[index].image!,
                      nameCategory: HomeCubit.get(context)
                          .listAllCategory[index]
                          .title
                          .toString(),
                      context: context,
                      onTap: () {
                        context.push(
                          AppRouterPath.subCategory,
                          extra:
                              HomeCubit.get(context).listAllCategory[index].id,
                        );
                      },
                    );
            },
          ),
        );
      },
    );
  }
}
