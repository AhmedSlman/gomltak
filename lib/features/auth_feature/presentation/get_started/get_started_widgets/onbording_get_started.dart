import 'package:card_swiper/card_swiper.dart';
import 'package:gomltak/core/utils/app_colors.dart';
import 'package:gomltak/core/utils/extentions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gomltak/features/abstract_feature/data/models/onpording_data_and_model.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import 'clippath_widgets.dart';

Swiper onpordingInGetStarted({
  required BuildContext context,
  required SwiperController swiperController,
}) {
  return Swiper(
      controller: swiperController,
      layout: SwiperLayout.CUSTOM,
      curve: Curves.linear,
      duration: 700,
      autoplay: true,
      // scale: .7,
      autoplayDisableOnInteraction: true,
      itemWidth: 332.0.w,
      itemHeight: context.height > 1000 ? 460.h : 412.0.h,
      itemCount: getStartedImage.length,
      autoplayDelay: 3000,
      customLayoutOption: CustomLayoutOption(
        startIndex: 1,
        stateCount: 3,
      )
        ..addScale([
          .7,
          1,
          .7,
        ], Alignment.center)
        ..addRotate(
          [-35.0 / 180, 0.0, 35.0 / 180],
        )
        ..addTranslate(
          [
            Offset(-390.0.w, -30.0.h),
            Offset(0.0.w, 0.0.h),
            Offset(390.0.w, -30.0.h)
          ],
        ),
      pagination: SwiperCustomPagination(
        builder: (BuildContext context, SwiperPluginConfig config) {
          return Container(
              height: context.height > 1000 ? 500.h : 450.0.h,
              alignment: Alignment.bottomCenter,
              width: double.infinity,
              child: AnimatedSmoothIndicator(
                textDirection: TextDirection.ltr,
                effect: ExpandingDotsEffect(
                  dotHeight: 8.w,
                  dotWidth: 8.w,
                  activeDotColor: AppColors.mainColor,
                  dotColor: AppColors.kLightSilver,
                  expansionFactor: 4.1,
                ),
                activeIndex: config.activeIndex,
                count: getStartedImage.length,
              ));
        },
      ),
      itemBuilder: (context, index) {
        return ClipPath(
            clipper: ClipInGetStarted(),
            child: Image.asset(
              getStartedImage[index],
              fit: BoxFit.cover,
              alignment: Alignment.topCenter,
            ));
      });
}
