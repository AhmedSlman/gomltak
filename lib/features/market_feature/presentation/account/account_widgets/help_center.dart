import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:gomltak/core/utils/app_colors.dart';
import 'package:gomltak/core/utils/extentions.dart';
import 'package:gomltak/core/widgets/const_appbar.dart';

class HelpCenterView extends StatelessWidget {
  const HelpCenterView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
            child: SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      child: Column(
        children: [
          30.h.ph,
          ConstAppBar(
              body: '',
              title: 'Help center',
              onPressed: () {
                context.pop();
              }),
          32.h.ph,
          SizedBox(
            width: 342.w,
            child: Text(
              'Lorem ipsum dolor sit amet, coteturswdz adipiscing elit?',
              style: context.textTheme.titleSmall!.copyWith(
                color: AppColors.kMaastrichtBlue,
              ),
            ),
          ),
          8.h.ph,
          SizedBox(
            width: 342.w,
            child: Text(
              'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum',
              style: context.textTheme.titleSmall!.copyWith(
                color: AppColors.kDarkSilver,
              ),
            ),
          ),
          16.h.ph,
          SizedBox(
            width: 342.w,
            child: Text(
              'Lorem ipsum dolor sit amet, coteturswdz adipiscing elit?',
              style: context.textTheme.titleSmall!.copyWith(
                color: AppColors.kMaastrichtBlue,
              ),
            ),
          ),
          8.h.ph,
          SizedBox(
            width: 342.w,
            child: Text(
              'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum',
              style: context.textTheme.titleSmall!.copyWith(
                color: AppColors.kDarkSilver,
              ),
            ),
          ),
        ],
      ),
    )));
  }
}
