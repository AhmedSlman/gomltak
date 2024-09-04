import 'package:card_swiper/card_swiper.dart';
import 'package:gomltak/core/utils/app_colors.dart';
import 'package:gomltak/core/utils/app_route.dart';
import 'package:gomltak/core/utils/app_string.dart';
import 'package:gomltak/core/utils/extentions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gomltak/core/widgets/const_elevated_button.dart';

import 'get_started_widgets/onbording_get_started.dart';

class GetStartedView extends StatefulWidget {
  const GetStartedView({super.key});

  @override
  State<GetStartedView> createState() => _GetStartedViewState();
}

class _GetStartedViewState extends State<GetStartedView> {
  SwiperController swiperController = SwiperController();

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    swiperController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            40.h.ph,
            onpordingInGetStarted(
              context: context,
              swiperController: swiperController,
            ),
            32.h.ph,
            Text(
              AppString.bestLooks,
              style: context.textTheme.headlineSmall,
            ),
            Text(
              AppString.shopOur,
              style: context.textTheme.labelLarge,
            ),
            33.h.ph,
            ConstElevatedButton(
              onPressed: () {
                context.goRoute.push(AppRouterPath.signUpView);
              },
              text: AppString.createAccount,
            ),
            16.h.ph,
            ConstElevatedButton(
              backgroundColor: AppColors.kAzureishWhiteCFE7E8,
              textStyle: context.textTheme.titleMedium!
                  .copyWith(color: AppColors.mainColor),
              onPressed: () {
                context.goRoute.push(AppRouterPath.loginView);
              },
              text: AppString.login,
            )
          ],
        ),
      ),
    );
  }
}

/**SizedBox(
            height: 400,
            child: PageView.builder(
                itemCount: getStartedImage.length,
                physics: const ClampingScrollPhysics(),
                allowImplicitScrolling: true,
                controller: _pageController,
                itemBuilder: (context, index) {
                  return AnimatedBuilder(
                    animation: _pageController,
                    builder: (context, child) {
                      double value = 0.0;
                      if (_pageController.position.haveDimensions) {
                        value = index.toDouble() - (_pageController.page ?? 0);
                        value = (value * .04).clamp(-1, 1);
                        print("value $value index $index");
                      }
                      return Transform.rotate(
                        angle: pi * value,
                        child: ClipPath(
                          clipper: ClipInGetStarted(),
                          child: Container(
                            height: 300,
                            width: 400,
                            color: AppColors.kBlack,
                          ),
                        ),
                      );
                    },
                  );
                }),
          ), */
