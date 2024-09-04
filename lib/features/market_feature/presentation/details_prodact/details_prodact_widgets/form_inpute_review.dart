import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gomltak/core/cached/cash_helper.dart';
import 'package:gomltak/core/utils/app_colors.dart';
import 'package:gomltak/core/utils/app_string.dart';
import 'package:gomltak/core/utils/extentions.dart';
import 'package:gomltak/core/validation/validation.dart';
import 'package:gomltak/core/widgets/const_elevated_button.dart';
import 'package:gomltak/core/widgets/const_text_form_field.dart';
import 'package:gomltak/features/market_feature/presentation/details_prodact/cubit/details_prodact_cubit.dart';

import '../cubit/details_prodact_state.dart';
import 'form_reviw.dart';

class FormInputReview extends StatefulWidget {
  const FormInputReview({
    super.key,
  });

  @override
  State<FormInputReview> createState() => _FormInputReviewState();
}

class _FormInputReviewState extends State<FormInputReview> {
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController reviewController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  String rate = '3';
  String token = '';
  @override
  void initState() {
    token = CachHelper.getData('token').toString();
    super.initState();
  }

  @override
  void dispose() {
    nameController.dispose();
    emailController.dispose();
    reviewController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DetailsProdactCubit, DetailsProdactState>(
      builder: (context, state) {
        return Form(
          key: _formKey,
          child: Column(
            children: [
              Text(
                'Your email address will not be published. Required fields are marked *',
                style: context.textTheme.bodySmall,
              ),
              16.h.ph,
              ConstTextFormField(
                validator: Validators.validateUsername,
                hintText: AppString.name,
                controller: nameController,
              ),
              16.h.ph,
              ConstTextFormField(
                validator: Validators.validateEmail,
                hintText: AppString.emailAddress,
                controller: emailController,
              ),
              16.h.ph,
              formReview(
                // validator: Validators.validateEmail,
                controller: reviewController,
                onRatingUpdate: (rate) {
                  this.rate = rate.toInt().toString();
                },
              ),
              16.h.ph,
              ConstElevatedButton(
                text: AppString.submit,
                textStyle: context.textTheme.titleMedium!.copyWith(
                    color: AppColors.mainColor, fontWeight: FontWeight.w600),
                backgroundColor: AppColors.kAzureishWhiteCFE7E8,
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    DetailsProdactCubit.get(context).addReviewToProdact(
                      token: token,
                      review: reviewController.text,
                      rate: rate,
                      productId: DetailsProdactCubit.get(context).poducts.id!,
                    );
                  }
                },
              )
            ],
          ),
        );
      },
    );
  }
}
