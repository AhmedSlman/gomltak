import 'package:flutter/material.dart';

class CustomSnackBar extends SnackBar {
  const CustomSnackBar({
    super.key,
    required super.content,
    super.action,
    super.duration = const Duration(milliseconds: 600),
    double super.width = 300.0,
    ShapeBorder super.shape = const RoundedRectangleBorder(
      borderRadius: BorderRadius.all(Radius.circular(30)),
    ),
  }) : super(
          behavior: SnackBarBehavior.floating,
        );
}
