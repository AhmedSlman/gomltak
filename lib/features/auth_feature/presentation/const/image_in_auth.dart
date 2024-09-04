import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ConstImageInAuth extends StatelessWidget {
  const ConstImageInAuth({
    required this.nameImage,
    super.key,
  });

  final String nameImage;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 230.h,
      width: 230.w,
      child: Image.asset(nameImage),
    );
  }
}
