import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gomltak/core/utils/app_colors.dart';
import 'package:gomltak/core/utils/app_images.dart';
import 'package:gomltak/core/utils/extentions.dart';
import 'package:gomltak/features/market_feature/presentation/details_prodact/cubit/details_prodact_cubit.dart';
import 'form_inpute_review.dart';
import 'rating_stars.dart';

class ReviewsDetails extends StatelessWidget {
  const ReviewsDetails({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        8.h.ph,
        SizedBox(
          height: DetailsProdactCubit.get(context).poducts.reviews!.isEmpty
              ? 0
              : 300.h,
          child: ListView.builder(
              physics: const BouncingScrollPhysics(),
              itemCount:
                  DetailsProdactCubit.get(context).poducts.reviews!.length,
              itemBuilder: (context, index) => Container(
                    margin: EdgeInsets.only(
                      top: 5.h,
                    ),
                    padding: EdgeInsets.all(
                      5.h,
                    ),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8.r),
                        border: Border.all(color: AppColors.kAmericanSilver)),
                    child: Column(
                      children: [
                        Row(
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.circular(100.r),
                              child: SizedBox(
                                width: 48.w,
                                height: 48.w,
                                child: Image.asset(AppImages.profileAvatar),
                              ),
                            ),
                            16.w.pw,
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                    '${DetailsProdactCubit.get(context).poducts.reviews?[index].name}'),
                                // Text('1/20/2023'),
                              ],
                            ),
                            const Spacer(),
                            ratingStart(
                                context: context,
                                rate: DetailsProdactCubit.get(context)
                                        .poducts
                                        .reviews?[index]
                                        .rate!
                                        .toInt() ??
                                    1)
                          ],
                        ),
                        Container(
                          width: 300.w,
                          decoration: BoxDecoration(
                              color: AppColors.kSaffron,
                              borderRadius: BorderRadius.circular(8.r)),
                          margin: EdgeInsets.symmetric(vertical: 5.h),
                          padding: EdgeInsets.all(10.w),
                          alignment: AlignmentDirectional.centerStart,
                          child: Text(
                            '${DetailsProdactCubit.get(context).poducts.reviews?[index].review}',
                            style: context.textTheme.bodySmall!.copyWith(
                              color: AppColors.kWhite,
                            ),
                            maxLines: 2,
                          ),
                        ),
                      ],
                    ),
                  )),
        ),
        24.h.ph,
        Container(
          padding: EdgeInsets.all(16.w),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8.r),
            border: Border.all(
              width: 1,
              color: AppColors.kCulturedD858585,
            ),
          ),
          child: const FormInputReview(),
        )
      ],
    );
  }
}
