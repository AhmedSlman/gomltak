import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_phoenix/flutter_phoenix.dart';
import 'package:go_router/go_router.dart';
import 'package:gomltak/core/utils/app_colors.dart';
import 'package:gomltak/core/utils/app_route.dart';
import 'package:gomltak/core/utils/app_string.dart';
import 'package:gomltak/core/utils/extentions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gomltak/core/validation/validation.dart';
import 'package:gomltak/core/widgets/const_elevated_button.dart';
import 'package:gomltak/core/widgets/const_text_form_field.dart';
import 'package:gomltak/core/widgets/custom_snack_bar.dart';
import 'package:gomltak/features/auth_feature/data/models/governorate_model/datum.dart';
import 'package:gomltak/features/auth_feature/presentation/sign_up/cubit/signup_cubit.dart';

import 'shimmer_bottom_signup.dart';

class FormInputeSignUp extends StatefulWidget {
  const FormInputeSignUp({
    super.key,
  });

  @override
  State<FormInputeSignUp> createState() => _FormInputeSignUpState();
}

class _FormInputeSignUpState extends State<FormInputeSignUp> {
  final TextEditingController userNameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController passwordConfirmController =
      TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    userNameController.dispose();
    emailController.dispose();
    passwordController.dispose();
    passwordConfirmController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 24.w),
      child: BlocConsumer<SignupCubit, SignupState>(
        listener: (context, state) {
          if (state is SignupError) {
            ScaffoldMessenger.of(context).showSnackBar(CustomSnackBar(
                content: Text(state.errorMassage.toString(),
                    textAlign: TextAlign.center)));
          }
          if (state is SignupSuccess) {
            context.pushReplacement(AppRouterPath.bottomNavigationBarView);
            Phoenix.rebirth(context);
            // BottomnavigationbarCubit.get(context).changeBottomNavBar(0);
          }
        },
        builder: (context, state) {
          SignupCubit cubit = SignupCubit.get(context);
          return Form(
            key: _formKey,
            child: Column(
              children: [
                ConstTextFormField(
                  controller: userNameController,
                  validator: Validators.validateUsername,
                  hintText: AppString.name,
                ),
                16.h.ph,
                ConstTextFormField(
                  controller: emailController,
                  validator: Validators.validateEmail,
                  hintText: AppString.emailAddress,
                  keyboardType: TextInputType.emailAddress,
                ),
                16.h.ph,
                state is SignupGetAppGaverLoding
                    ? Center(
                        child: bottomSignup(),
                      )
                    : DropDownItemsGover(
                        onChanged: (p0) {
                          SignupCubit.get(context).selectedGovernorate =
                              int.parse(p0.toString());
                        },
                        listGover: SignupCubit.get(context).listAllGover,
                      ),
                16.h.ph,
                ConstTextFormField(
                  controller: passwordController,
                  validator: Validators.validatePassword,
                  hintText: AppString.newPassword,
                  obscureText: cubit.onCkickedVisibilty,
                  suffixIcon: InkWell(
                    onTap: () {
                      cubit.changeVisibiltyIcon();
                    },
                    child: Icon(cubit.iconVisibilty),
                  ),
                ),
                16.h.ph,
                ConstTextFormField(
                  controller: passwordConfirmController,
                  validator: Validators.validatePassword,
                  hintText: AppString.confirmPassword,
                  obscureText: cubit.onCkickedVisibilty,
                  suffixIcon: InkWell(
                    onTap: () {
                      cubit.changeVisibiltyIcon();
                    },
                    child: Icon(cubit.iconVisibilty),
                  ),
                ),
                32.h.ph,
                state is SignupLoding
                    ? bottomSignup()
                    : ConstElevatedButton(
                        text: AppString.createAccount,
                        onPressed: () {
                          if (_formKey.currentState!.validate()) {
                            cubit.signUp(
                              governorateId:
                                  SignupCubit.get(context).selectedGovernorate!,
                              email: emailController.text,
                              password: passwordController.text,
                              passwordConfirmation:
                                  passwordConfirmController.text,
                              userName: userNameController.text,
                            );
                          }
                        },
                      )
              ],
            ),
          );
        },
      ),
    );
  }
}

class DropDownItemsGover extends StatefulWidget {
  const DropDownItemsGover({
    this.listGover,
    required this.onChanged,
    super.key,
  });
  final List<Datum>? listGover;
  final void Function(String?)? onChanged;
  @override
  State<DropDownItemsGover> createState() => _DropDownItemsGoverState();
}

class _DropDownItemsGoverState extends State<DropDownItemsGover> {
  String? selectedValue;
  @override
  Widget build(BuildContext context) {
    try {
      return Row(
        children: [
          Text(
            AppString.governorate,
          ),
          12.w.pw,
          Container(
            width: 200.w,
            height: 36.h,
            padding: EdgeInsets.symmetric(horizontal: 8.w),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(4.r)),
              color: AppColors.kRGPDarkSkyBlue,
            ),
            child: DropdownButtonHideUnderline(
              child: DropdownButton(
                  focusColor: AppColors.kTransparent,
                  // dropdownColor: AppColors.kTransparent,
                  iconSize: 20.sp,
                  icon: const Icon(
                    Icons.keyboard_arrow_down_sharp,
                    color: AppColors.kMetallicSeaweed,
                  ),
                  value: selectedValue ?? widget.listGover![0].name,
                  style: const TextStyle(color: AppColors.kBlack),
                  items: widget.listGover
                      ?.map((gover) => DropdownMenuItem(
                            value: gover.name,
                            child: Text(
                              '${gover.name}',
                              style: context.textTheme.bodyMedium!.copyWith(
                                  fontWeight: FontWeight.w400,
                                  color: AppColors.kMetallicSeaweed),
                            ),
                          ))
                      .toList(),
                  onChanged: (selected) {
                    widget.listGover?.forEach((element) {
                      if (selected == element.name) {
                        widget.onChanged!(element.id.toString());
                      }
                    });
                    setState(() {
                      selectedValue = selected;
                    });
                  }),
            ),
          ),
        ],
      );
    } catch (e) {
      print(e);
    }
    return Container();
  }
}
