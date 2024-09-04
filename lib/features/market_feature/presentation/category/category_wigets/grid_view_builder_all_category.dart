import 'package:flutter/material.dart';
import 'package:gomltak/features/market_feature/presentation/home/cubit/home_cubit.dart';

import 'item_grid_view_show_all_category.dart';
import 'shimmer_sub_category.dart';

class GridVeiwCategoryItems extends StatelessWidget {
  const GridVeiwCategoryItems({super.key});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemCount: HomeCubit.get(context).listAllCategory.isEmpty
          ? 5
          : HomeCubit.get(context).listAllCategory.length,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: (2),
        // childAspectRatio: .63,
      ),
      itemBuilder: (context, index) {
        return HomeCubit.get(context).listAllCategory.isEmpty
            ? shimmerCategory()
            : itemGridViewShowAllCategory(
                context: context,
                category: HomeCubit.get(context).listAllCategory[index],
              );
      },
    );
  }
}
