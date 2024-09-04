import 'package:gomltak/core/cached/cash_helper.dart';
import 'package:gomltak/core/utils/app_colors.dart';
import 'package:gomltak/core/utils/app_route.dart';
import 'package:gomltak/core/utils/app_string.dart';
import 'package:gomltak/core/utils/extentions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:gomltak/core/widgets/const_elevated_button.dart';
import 'package:gomltak/features/abstract_feature/presentation/onpording/onpording_widgerts/smooth_page_indecator.dart';

import '../../../data/models/onpording_data_and_model.dart';

Align activeBottonAndSmooth({
  required BuildContext context,
  required PageController pageController,
}) {
  return Align(
    alignment: Alignment.bottomCenter,
    child: Container(
      height: 154.h,
      width: context.width,
      decoration: BoxDecoration(
        color: AppColors.kRGPDwhite,
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(40.r),
        ),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          20.h.ph,
          smoothPageIndicatorInOnpording(
            count: onpording.length,
            pageController: pageController,
          ),
          25.h.ph,
          ConstElevatedButton(
            icon: Icon(
              CachHelper.getData('lang').toString() == 'ar'
                  ? FontAwesomeIcons.arrowLeftLong
                  : FontAwesomeIcons.arrowRightLong,
              color: AppColors.mainColor,
              size: 16.sp,
            ),
            textStyle: TextStyle(
              color: AppColors.mainColor,
              fontSize: 14.sp,
              fontWeight: FontWeight.w400,
              height: 0,
            ),
            shadow: true,
            text: AppString.continu,
            backgroundColor: AppColors.kAzureishWhiteCFE7E8,
            onPressed: () {
              if (pageController.page!.toInt() == onpording.length - 1) {
                CachHelper.saveData(key: "onPordingIsDone", value: true);
                context.goRoute
                    .pushReplacement(AppRouterPath.bottomNavigationBarView);
              } else {
                pageController.nextPage(
                  duration: const Duration(milliseconds: 500),
                  curve: Curves.linear,
                );
              }
            },
          )
        ],
      ),
    ),
  );
}
