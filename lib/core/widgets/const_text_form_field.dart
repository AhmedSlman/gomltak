// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:gomltak/core/utils/extentions.dart';

import '../utils/app_colors.dart';

class ConstTextFormField extends StatelessWidget {
  const ConstTextFormField({
    super.key,
    required this.hintText,
    this.validator,
    this.controller,
    this.suffixIcon,
    this.keyboardType,
    this.obscureText = false,
    this.maxLines = 1,
    this.minLines = 1,
  });
  final String hintText;
  final String? Function(String?)? validator;
  final TextEditingController? controller;
  final Widget? suffixIcon;
  final TextInputType? keyboardType;
  final bool obscureText;
  final int? maxLines;
  final int? minLines;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(boxShadow: [
        BoxShadow(
          offset: Offset(0, 2),
          blurRadius: 1,
          color: AppColors.kRGPDBlack,
        )
      ]),
      child: TextFormField(
        maxLines: maxLines,
        minLines: minLines,
        style: context.textTheme.labelLarge,
        controller: controller,
        validator: validator,
        keyboardType: keyboardType,
        obscureText: obscureText,
        decoration: InputDecoration(
          suffixIcon: suffixIcon,
          hintText: hintText,
        ),
      ),
    );
  }
}
