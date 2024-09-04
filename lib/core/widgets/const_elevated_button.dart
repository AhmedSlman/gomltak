import 'package:gomltak/core/utils/app_colors.dart';
import 'package:gomltak/core/utils/extentions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ConstElevatedButton extends StatelessWidget {
  const ConstElevatedButton({
    required this.onPressed,
    required this.text,
    this.icon,
    this.textStyle,
    this.backgroundColor = AppColors.mainColor,
    this.iconSize = 15.0,
    this.shadow = true,
    super.key,
  });
  final void Function()? onPressed;
  final Widget? icon;
  final Color? backgroundColor;
  final TextStyle? textStyle;
  final bool? shadow;
  final String text;
  final double? iconSize;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          borderRadius: const BorderRadius.all(Radius.circular(6)),
          boxShadow: [
            BoxShadow(
              offset: const Offset(0, 2),
              blurRadius: 1,
              color: shadow == true
                  ? AppColors.kRGPDBlack
                  : AppColors.kTransparent,
            )
          ]),
      child: ElevatedButton(
        onPressed: onPressed,
        style: ButtonStyle(
          alignment: Alignment.center,
          animationDuration: const Duration(milliseconds: 500),
          fixedSize: MaterialStateProperty.all(Size(342.w, 53.h)),
          backgroundColor: MaterialStateProperty.all(backgroundColor),
        ),

        //          textDirection: context.locale.countryCode =='ar'?TextDirection.ltr:TextDirection.ltr,

        child: Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              text,
              textAlign: TextAlign.center,
              style: textStyle ?? context.textTheme.titleMedium,
            ),
            icon == null ? 0.pw : 8.w.pw,
            icon ?? 0.pw,
          ],
        ),
      ),
    );
  }
}
