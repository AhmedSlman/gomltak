import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:gomltak/core/utils/app_string.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gomltak/core/widgets/const_text_form_field.dart';

Stack formReview(
    {required void Function(double) onRatingUpdate,
    TextEditingController? controller,
    String? Function(String?)? validator}) {
  return Stack(
    children: [
      ConstTextFormField(
        validator: validator,
        controller: controller,
        hintText: AppString.yourReview,
        maxLines: 6,
        minLines: 4,
      ),
      Positioned.fill(
        bottom: 15.h,
        child: Align(
          alignment: AlignmentDirectional.bottomStart,
          child: RatingBar.builder(
            initialRating: 3,
            minRating: 1,
            direction: Axis.horizontal,
            itemSize: 20.sp,
            // allowHalfRating: true,
            itemCount: 5,
            itemPadding: const EdgeInsets.symmetric(horizontal: 4.0),
            itemBuilder: (context, _) => const Icon(
              Icons.star,
              color: Colors.amber,
              // size: 10.sp,
            ),
            onRatingUpdate: onRatingUpdate,
          ),
        ),
      ),
    ],
  );
}
