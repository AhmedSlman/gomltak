import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:gomltak/core/service_locator/services_locator.dart';
import 'package:gomltak/core/utils/app_route.dart';
import 'package:gomltak/core/utils/app_string.dart';
import 'package:gomltak/core/utils/extentions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gomltak/core/validation/validation.dart';
import 'package:gomltak/core/widgets/const_appbar.dart';
import 'package:gomltak/core/widgets/const_elevated_button.dart';
import 'package:gomltak/core/widgets/const_text_form_field.dart';
import 'package:gomltak/features/auth_feature/data/repositories_impel/auth_repos_impel.dart';
import 'package:gomltak/features/auth_feature/presentation/checkout/cubit/checkout_cubit.dart';
import 'package:gomltak/features/auth_feature/presentation/sign_up/sign_up_widgets/shimmer_bottom_signup.dart';
import 'package:gomltak/features/market_feature/presentation/cart/cubit/cart_cubit.dart';

class CheckoutView extends StatefulWidget {
  const CheckoutView({super.key});

  @override
  State<CheckoutView> createState() => _CheckoutViewState();
}

class _CheckoutViewState extends State<CheckoutView> {
  TextEditingController firstNameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();
  TextEditingController companyNameController = TextEditingController();
  TextEditingController countryRegionController = TextEditingController();
  TextEditingController townCityController = TextEditingController();
  TextEditingController streetAddressController = TextEditingController();
  TextEditingController stateCountryController = TextEditingController();
  TextEditingController postCodeZipController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController emailAddressController = TextEditingController();
  TextEditingController notesAboutController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    firstNameController.dispose();
    lastNameController.dispose();
    companyNameController.dispose();
    countryRegionController.dispose();
    townCityController.dispose();
    streetAddressController.dispose();
    stateCountryController.dispose();
    postCodeZipController.dispose();
    phoneController.dispose();
    emailAddressController.dispose();
    notesAboutController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CheckoutCubit(sl.get<AuthRepoImpel>()),
      child: Scaffold(
        body: SafeArea(
          child: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: BlocConsumer<CheckoutCubit, CheckoutState>(
              listener: (context, state) {
                if (state is CheckoutOrderSuccess) {
                  context.pushReplacement(AppRouterPath.successView);
                  CartCubit.get(context).listItemsCart.clear();
                  CartCubit.get(context).totlaPriceAdnDiscount = 0;
                  CartCubit.get(context).shipping = 0;
                  CartCubit.get(context).totlaPrice = 0;
                  CartCubit.get(context).subTotalPrice = 0;
                }
              },
              builder: (context, state) {
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    30.h.ph,
                    ConstAppBar(
                      onPressed: () {
                        context.goRoute.pop();
                      },
                      title: AppString.checkout,
                      body: '',
                    ),
                    32.h.ph,
                    Form(
                      key: _formKey,
                      child: Padding(
                        padding: EdgeInsets.symmetric(horizontal: 24.w),
                        child: Column(
                          children: [
                            ConstTextFormField(
                              hintText: AppString.firstName,
                              controller: firstNameController,
                              validator: Validators.validateToRequired,
                            ),
                            16.h.ph,
                            ConstTextFormField(
                              hintText: AppString.lastName,
                              validator: Validators.validateToRequired,
                              controller: lastNameController,
                            ),
                            16.h.ph,
                            ConstTextFormField(
                              hintText: AppString.companyName,
                              validator: Validators.validateToRequired,
                              controller: companyNameController,
                            ),
                            16.h.ph,
                            ConstTextFormField(
                              hintText: AppString.countryRegion,
                              validator: Validators.validateToRequired,
                              controller: countryRegionController,
                            ),
                            16.h.ph,
                            ConstTextFormField(
                              hintText: AppString.streetAddress,
                              validator: Validators.validateToRequired,
                              controller: streetAddressController,
                            ),
                            16.h.ph,
                            ConstTextFormField(
                              hintText: AppString.townCity,
                              validator: Validators.validateToRequired,
                              controller: townCityController,
                            ),
                            16.h.ph,
                            ConstTextFormField(
                              hintText: AppString.stateCountry,
                              validator: Validators.validateToRequired,
                              controller: stateCountryController,
                            ),
                            16.h.ph,
                            ConstTextFormField(
                              hintText: AppString.postCodeZip,
                              validator: Validators.validateToRequired,
                              controller: postCodeZipController,
                            ),
                            16.h.ph,
                            ConstTextFormField(
                              keyboardType: TextInputType.phone,
                              hintText: AppString.phone,
                              validator: Validators.validateToRequired,
                              controller: phoneController,
                            ),
                            16.h.ph,
                            ConstTextFormField(
                              hintText: AppString.emailAddress,
                              validator: Validators.validateEmail,
                              controller: emailAddressController,
                              keyboardType: TextInputType.emailAddress,
                            ),
                            16.h.ph,
                            ConstTextFormField(
                              validator: Validators.validateToRequired,
                              controller: notesAboutController,
                              minLines: 4,
                              maxLines: 5,
                              hintText: AppString.notesAboutYourOrder,
                            ),
                            32.h.ph,
                            state is CheckoutOrderLoding
                                ? bottomSignup()
                                : ConstElevatedButton(
                                    text: AppString.checkout,
                                    onPressed: () {
                                      if (_formKey.currentState!.validate()) {
                                        CheckoutCubit.get(context)
                                            .checkOutOrder(
                                          firstName: firstNameController.text,
                                          lastName: lastNameController.text,
                                          companyName:
                                              companyNameController.text,
                                          countryRagion:
                                              countryRegionController.text,
                                          streetAddress:
                                              streetAddressController.text,
                                          townCity: townCityController.text,
                                          postCode: postCodeZipController.text,
                                          governorateId: 1,
                                          phoneNumber: phoneController.text,
                                          emailAddress:
                                              emailAddressController.text,
                                          notesAbout: notesAboutController.text,
                                        );
                                      }
                                    },
                                  ),
                            34.h.ph,
                          ],
                        ),
                      ),
                    )
                  ],
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
