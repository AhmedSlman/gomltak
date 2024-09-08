// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:gomltak/core/utils/app_colors.dart';
import 'package:gomltak/core/utils/app_route.dart';
import 'package:gomltak/core/utils/app_string.dart';

import 'package:gomltak/core/utils/extentions.dart';
import 'package:gomltak/core/widgets/const_appbar.dart';

import 'category_wigets/shimmer_sub_category.dart';
import 'cubit/category_cubit.dart';

class SubCategoryView extends StatelessWidget {
  const SubCategoryView({
    super.key,
    // required this.categoryName,
  });
  // final String categoryName;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: BlocConsumer<CategoryCubit, CategoryState>(
          listener: (context, state) {},
          builder: (context, state) {
            return CustomScrollView(
              physics: const BouncingScrollPhysics(),
              slivers: [
                SliverList(
                  delegate: SliverChildListDelegate(
                    [
                      36.h.ph,
                      ConstAppBar(
                        body: '',
                        title: CategoryCubit.get(context).categoryName == ''
                            ? AppString.subCategory
                            : CategoryCubit.get(context).categoryName,
                        onPressed: () {
                          context.pop();
                        },
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 20.w),
                        child: Column(
                          children: [
                            24.h.ph,
                            GridView.builder(
                              physics: const NeverScrollableScrollPhysics(),
                              shrinkWrap: true,
                              itemCount: CategoryCubit.get(context)
                                      .listSubCategory
                                      .isEmpty
                                  ? 10
                                  : CategoryCubit.get(context)
                                      .listSubCategory
                                      .length,
                              gridDelegate:
                                  const SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: (2),
                                 mainAxisSpacing: (6),
                                crossAxisSpacing: (18),
                                childAspectRatio: .83,
                              ),
                              itemBuilder: (context, index) {
                                return CategoryCubit.get(context)
                                        .listSubCategory
                                        .isEmpty
                                    ? shimmerCategory()
                                    : InkWell(
                                        onTap: () {
                                          context.push(
                                            AppRouterPath.prodactesByCategories,
                                            extra: CategoryCubit.get(context)
                                                .listSubCategory[index]
                                                .id,
                                            // 'nameCategory': category.title ?? '',
                                          );
                                        },
                                        child: Container(
                                          alignment: Alignment.bottomCenter,
                                          // margin: const EdgeInsets.all(10),
                                           width: 143.w    ,
                                          height: 129.h,
                                          decoration: BoxDecoration(
                                            color: AppColors.kArsenic,
                                            border: Border.all(
                                                color:
                                                    AppColors.kChineseSilver),
                                            borderRadius: BorderRadius.only(
                                                bottomRight:
                                                    Radius.circular(12.r),
                                                bottomLeft:
                                                    Radius.circular(12.r)),
                                          ),
                                          child: Column(
                                            mainAxisSize: MainAxisSize.min,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Expanded(
                                                child: CachedNetworkImage(
                                                  imageUrl:
                                                      'https://gomltak.com/Backend/${CategoryCubit.get(context).listSubCategory[index].image}',
                                                  fit: BoxFit.cover,
                                                ),
                                              ),
                                              Container(
                                                height: 37.h,
                                                width: double.infinity,
                                                alignment: Alignment.center,
                                                decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.vertical(
                                                          bottom:
                                                              Radius.circular(
                                                                  12.r)),
                                                  color:
                                                      AppColors.kChineseSilver,
                                                ),
                                                child: Text(
                                                  '${CategoryCubit.get(context).listSubCategory[index].title}',
                                                  style: context
                                                      .textTheme.bodyMedium!
                                                      .copyWith(
                                                    color: AppColors.kBlack,
                                                    overflow:
                                                        TextOverflow.ellipsis,
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      );
                              },
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                )
              ],
            );
          },
        ),
      ),
    );
  }
}
