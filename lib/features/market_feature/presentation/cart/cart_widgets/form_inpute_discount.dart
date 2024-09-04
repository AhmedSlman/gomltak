import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gomltak/core/utils/app_colors.dart';
import 'package:gomltak/core/utils/app_string.dart';
import 'package:gomltak/core/utils/extentions.dart';
import 'package:gomltak/core/validation/validation.dart';
import 'package:gomltak/core/widgets/const_elevated_button.dart';
import 'package:gomltak/features/market_feature/presentation/cart/cubit/cart_cubit.dart';

class FormInputeDiscount extends StatefulWidget {
  const FormInputeDiscount({
    super.key,
  });

  @override
  State<FormInputeDiscount> createState() => _FormInputeDiscountState();
}

class _FormInputeDiscountState extends State<FormInputeDiscount> {
  TextEditingController discountController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  @override
  void dispose() {
    discountController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: 230.w,
            child: TextFormField(
              validator: Validators.validateToRequired,
              controller: discountController,
              style: context.textTheme.bodyMedium!
                  .copyWith(color: AppColors.kDarkSilver),
              decoration: InputDecoration(
                hintText: AppString.couponCode,
                hintStyle: context.textTheme.bodyMedium!
                    .copyWith(color: AppColors.kDarkSilver, height: 1.47),
                filled: true,
                fillColor: AppColors.kWhite,
                contentPadding: EdgeInsetsDirectional.only(
                    top: 17.h, bottom: 13.h, start: 20.0.w, end: 20.w),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(6.r),
                  borderSide: const BorderSide(
                    width: 1,
                    color: AppColors.kArgent,
                  ),
                ),
                enabledBorder: OutlineInputBorder(
                  borderSide: const BorderSide(
                    color: AppColors.kArgent,
                  ),
                  borderRadius: BorderRadius.circular(6.0),
                ),
                errorBorder: OutlineInputBorder(
                  borderSide: const BorderSide(
                    width: 1,
                    color: AppColors.kArgent,
                  ),
                  borderRadius: BorderRadius.circular(6.0),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: const BorderSide(
                    width: 1,
                    color: AppColors.kArgent,
                  ),
                  borderRadius: BorderRadius.circular(6.0),
                ),
              ),
            ),
          ),
          8.w.pw,
          SizedBox(
              width: 90.w,
              child: ConstElevatedButton(
                text: AppString.apply,
                backgroundColor: AppColors.kAzureishWhiteCFE7E8,
                textStyle: context.textTheme.bodyMedium!
                    .copyWith(color: AppColors.mainColor),
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    CartCubit.get(context)
                        .getDiscountCart(couponNum: discountController.text);
                  }
                },
              )),
        ],
      ),
    );
  }
}
