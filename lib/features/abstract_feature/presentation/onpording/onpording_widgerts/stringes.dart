import 'package:gomltak/core/utils/app_colors.dart';
import 'package:gomltak/core/utils/extentions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../data/models/onpording_data_and_model.dart';

Positioned stringesInOnpording({
  required int index,
  required BuildContext context,
}) {
  return Positioned.fill(
      child: Align(
    alignment: AlignmentDirectional.bottomStart,
    child: Container(
      padding: EdgeInsets.only(bottom: 188.h, left: 24.w, right: 24.w),
      width: 280.w,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            onpording[index].title,
            style: context.textTheme.headlineMedium,
          ),
          Text(
            onpording[index].body,
            style: context.textTheme.bodyMedium!.copyWith(
              color: AppColors.kGainsboro,
            ),
          ),
        ],
      ),
    ),
  ));
}
