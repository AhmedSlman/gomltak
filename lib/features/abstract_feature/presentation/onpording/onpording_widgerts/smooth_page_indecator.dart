import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gomltak/core/utils/app_colors.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

SmoothPageIndicator smoothPageIndicatorInOnpording({
  required int count,
  required PageController pageController,
}) {
  return SmoothPageIndicator(
    controller: pageController,
    count: count,
    effect: ScrollingDotsEffect(
      fixedCenter: true,
      spacing: 8.0.w,
      radius: 100.0,
      dotColor: AppColors.kRGPGhostWhite,
      activeDotColor: AppColors.kGhostWhite,
      dotWidth: 10.0.w,
      dotHeight: 10.0.w,
      activeDotScale: 1.6,
    ),
  );
}
