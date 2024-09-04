import 'package:flutter/material.dart';

class CustomSnackBar extends SnackBar {
  const CustomSnackBar({
    Key? key,
    required Widget content,
    SnackBarAction? action,
    Duration duration = const Duration(milliseconds: 600),
    double width = 300.0,
    ShapeBorder shape = const RoundedRectangleBorder(
      borderRadius: BorderRadius.all(Radius.circular(30)),
    ),
  }) : super(
          key: key,
          content: content,
          action: action,
          behavior: SnackBarBehavior.floating,
          duration: duration,
          width: width,
          shape: shape,
        );
}
