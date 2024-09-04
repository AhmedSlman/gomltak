import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:gomltak/core/cached/cash_helper.dart';
import 'package:gomltak/core/utils/extentions.dart';

import '../utils/app_colors.dart';

class ConstAppBar extends StatelessWidget {
  const ConstAppBar({
    required this.body,
    required this.title,
    required this.onPressed,
    this.padding,
    super.key,
  });
  final String title, body;
  final void Function()? onPressed;
  final double? padding;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: context.width,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: padding ?? 27.w),
        child: Stack(
          children: [
            Align(
              alignment: AlignmentDirectional.centerStart,
              child: IconButton(
                  onPressed: onPressed,
                  icon: Icon(
                    CachHelper.getData('lang').toString() == 'ar'
                        ? FontAwesomeIcons.arrowRightLong
                        : FontAwesomeIcons.arrowLeftLong,
                  )),
            ),
            Align(
              alignment: Alignment.center,
              child: SizedBox(
                width: 273.w,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    8.h.ph,
                    title == ''
                        ? const SizedBox()
                        : Text(
                            title,
                            style: context.textTheme.titleLarge,
                            textAlign: TextAlign.center,
                          ),
                    body == ''
                        ? const SizedBox()
                        : Text(
                            body,
                            style: context.textTheme.bodyMedium!
                                .copyWith(color: AppColors.kDarkSilver),
                            textAlign: TextAlign.center,
                          ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
