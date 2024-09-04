import 'package:flutter/material.dart';
import 'package:gomltak/core/utils/app_string.dart';
import 'package:gomltak/core/utils/extentions.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gomltak/core/widgets/const_appbar.dart';
import 'edit_profile_widgets/form_input_edit_profile.dart';

class EditProfileView extends StatefulWidget {
  const EditProfileView({super.key});

  @override
  State<EditProfileView> createState() => _EditProfileViewState();
}

class _EditProfileViewState extends State<EditProfileView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              30.h.ph,
              ConstAppBar(
                onPressed: () {
                  context.goRoute.pop();
                },
                title: AppString.editProfile,
                body: '',
              ),
              60.h.ph,
              const FormInputeEditProfile()
            ],
          ),
        ),
      ),
    );
  }
}
