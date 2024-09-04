import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gomltak/core/utils/extentions.dart';

class TabItem extends StatelessWidget {
  final String imageActiveIconSvg;
  final String label;
  const TabItem(
      {super.key, required this.imageActiveIconSvg, required this.label});

  @override
  Widget build(BuildContext context) {
    return Tab(
      icon: SvgPicture.asset(
        imageActiveIconSvg,
        width: 24.w,
        height: 24.w,
        color: context.theme!.primaryColor,
      ),
    );
  }
}
