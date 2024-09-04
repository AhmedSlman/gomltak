import 'package:gomltak/core/utils/app_colors.dart';
import 'package:gomltak/core/utils/extentions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

ClipRRect textFieldOTP({
  required BuildContext context,
  required bool last,
  required bool first,
  TextEditingController? controller,
}) {
  return ClipRRect(
    borderRadius: const BorderRadius.all(Radius.circular(6)),
    child: Stack(
      alignment: Alignment.center,
      children: [
        Positioned(
          bottom: 4,
          child: Container(
            width: 70.w,
            height: 55.h,
            decoration: const BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(6)),
                boxShadow: [
                  BoxShadow(
                    offset: Offset(0, 0),
                    blurRadius: 1,
                    color: AppColors.kRGPDBlack,
                  )
                ]),
          ),
        ),
        SizedBox(
          width: 70.w,
          height: 55.h,
          child: TextField(
            controller: controller,
            autofocus: true,
            onChanged: (value) {
              if (value.length == 1 && last == false) {
                FocusScope.of(context).nextFocus();
              }
              if (value.isEmpty && first == false) {
                FocusScope.of(context).previousFocus();
              }
            },
            showCursor: false,
            readOnly: false,
            textAlign: TextAlign.center,
            textAlignVertical: TextAlignVertical.center,
            style: context.textTheme.titleLarge!.copyWith(height: 1),
            keyboardType: TextInputType.number,
            maxLength: 1,
            decoration: const InputDecoration(
              counter: Offstage(
                offstage: true,
              ),
            ),
          ),
        ),
        Positioned(
          bottom: 15.h,
          child: Container(
            width: 20.w,
            height: 2,
            decoration: const BoxDecoration(
              color: AppColors.kAmericanSilver,
              borderRadius: BorderRadius.all(Radius.circular(6)),
            ),
          ),
        )
      ],
    ),
  );
}
