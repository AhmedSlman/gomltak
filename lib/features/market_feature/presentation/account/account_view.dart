import 'package:flutter/material.dart';
import 'package:flutter_phoenix/flutter_phoenix.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:gomltak/core/cached/cash_helper.dart';
import 'package:gomltak/core/utils/app_colors.dart';
import 'package:gomltak/core/utils/app_images.dart';
import 'package:gomltak/core/utils/app_route.dart';
import 'package:gomltak/core/utils/app_string.dart';
import 'package:gomltak/core/utils/extentions.dart';
import 'package:gomltak/core/widgets/custom_snack_bar.dart';

import 'account_widgets/bottom_Item_account.dart';

class AccountView extends StatelessWidget {
  const AccountView({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: CustomScrollView(physics: const BouncingScrollPhysics(), slivers: [
        SliverList(
          delegate: SliverChildListDelegate([
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 8.w),
              child: Column(
                children: [
                  50.h.ph,
                  SizedBox(
                    width: 100.w,
                    height: 100.w,
                    child: Image.asset('assets/image/avatarPageAccounts.png'),
                  ),
                  8.h.ph,
                  Text('${CachHelper.getData('userName') ?? AppString.guest}',
                      style: context.textTheme.titleMedium!
                          .copyWith(color: AppColors.kMaastrichtBlue)),
                  Text('${CachHelper.getData('email') ?? ''}',
                      style: context.textTheme.bodyMedium!
                          .copyWith(color: AppColors.kDarkSilver)),
                  32.h.ph,
                  CachHelper.getData('userName') != null
                      ? bottomItemAccount(
                          onTap: () {
                            context.push(AppRouterPath.editProfileView);
                          },
                          context: context,
                          imageIcon: AppImages.editProfile,
                          nameBottom: AppString.editProfile,
                        )
                      : const SizedBox(),
                  16.h.ph,
                  bottomItemAccount(
                    onTap: () {
                      context.push(AppRouterPath.helpCenterView);
                    },
                    context: context,
                    imageIcon: AppImages.helpCenter,
                    nameBottom: AppString.helpCenter,
                  ),
                  16.h.ph,
                  bottomItemAccount(
                    onTap: () {
                      context.push(AppRouterPath.inviteFriends,
                          extra: 'https://gomltak.com/');
                    },
                    context: context,
                    imageIcon: AppImages.inviteFriends,
                    nameBottom: AppString.inviteFriends,
                  ),
                  16.h.ph,
                  bottomItemAccount(
                    onTap: () {
                      context.push(AppRouterPath.privcePolicyView);
                    },
                    context: context,
                    imageIcon: AppImages.privacyPolicy,
                    nameBottom: AppString.privacyPolicy,
                  ),
                  16.h.ph,
                  CachHelper.getData('userName') != null
                      ? bottomItemAccount(
                          onTap: () {
                            if (CachHelper.getData('token') != null) {
                              Phoenix.rebirth(context);
                              CachHelper.deletData('token');
                              CachHelper.deletData('email');
                              CachHelper.deletData('userName');
                            } else {
                              ScaffoldMessenger.of(context)
                                  .showSnackBar(CustomSnackBar(
                                      content: Center(
                                child: Text(AppString.pleaseLoginFirst),
                              )));
                            }
                          },
                          context: context,
                          imageIcon: AppImages.logout,
                          nameBottom: AppString.logout,
                        )
                      : const SizedBox(),
                ],
              ),
            ),
          ]),
        ),
      ]),
    );
  }
}
