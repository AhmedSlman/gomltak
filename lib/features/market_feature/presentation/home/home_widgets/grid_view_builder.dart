import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../cubit/home_cubit.dart';
import 'loding_shimmer_home/shimmer_prodact_item.dart';
import 'prodact_item.dart';

BlocConsumer gridViewBuilder() {
  return BlocConsumer<HomeCubit, HomeState>(
      listener: (context, state) {},
      builder: (context, state) {
        return GridView.builder(
          physics: const NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          itemCount: HomeCubit.get(context).listAllProdact.isEmpty
              ? 5
              : HomeCubit.get(context).listAllProdact.length,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: (2),
            childAspectRatio: .75,
          ),
          itemBuilder: (context, index) {
            return HomeCubit.get(context).listAllProdact.isEmpty
                ? shimmerProdactItems()
                : prodactItem(
                    context: context,
                    prodact: HomeCubit.get(context).listAllProdact[index],
                  );
          },
        );
      });
}
