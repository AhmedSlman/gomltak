import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

import 'app_colors.dart';

// ignore: slash_for_doc_comments
/**
 * 
 *   static TextTheme textTheme = TextTheme(
    displayLarge: Styles.textStyle14, //96
    displayMedium: Styles.textStyle14, //60
    displaySmall: Styles.textStyle14, //48
    headlineLarge: Styles.textStyle14,
    headlineMedium: Styles.textStyle14,//34
    headlineSmall: Styles.textStyle14,//24
    titleLarge: Styles.textStyle22,//20.0
    titleMedium: Styles.textStyle18,//16.0
    titleSmall: Styles.textStyle14,//14.0
    labelLarge: Styles.textStyle14,//14.0
    labelMedium: Styles.textStyle14,
    labelSmall: Styles.textStyle14,//10.0
    bodyLarge: Styles.textStyle14,//16.0
    bodyMedium: Styles.textStyle14,//14.0
    bodySmall: Styles.textStyle26,//12.0
  );

 */

abstract class Styles {
  static TextStyle textStyle32 = GoogleFonts.poppins(
    fontSize: 32.sp,
    fontWeight: FontWeight.w400,
    color: AppColors.kWhite,
  );
  static TextStyle textStyle28 = GoogleFonts.poppins(
    fontSize: 28.sp,
    fontWeight: FontWeight.w600,
    color: AppColors.kArsenic,
  );
  static TextStyle textStyle22 = GoogleFonts.poppins(
    color: AppColors.kArsenic,
    fontSize: 22.sp,
    fontWeight: FontWeight.w600,
  );

  static TextStyle textStyle18 = GoogleFonts.poppins(
    color: AppColors.kWhite,
    fontSize: 18.sp,
    fontWeight: FontWeight.w400,
    height: 1.2,

    // height:
  );
  static TextStyle textStyle16 = GoogleFonts.poppins(
    color: AppColors.kMaastrichtBlue,
    fontSize: 16.sp,
    fontWeight: FontWeight.w500,
  );
  static TextStyle textStyle15 = GoogleFonts.poppins(
    color: AppColors.kDarkSilver,
    fontSize: 15.sp,
    fontWeight: FontWeight.w400,
  );

  static TextStyle textStyle14 = GoogleFonts.poppins(
    color: AppColors.kMaastrichtBlue,
    fontSize: 14.sp,
    fontWeight: FontWeight.w500,
  );
  static TextStyle textStyle12 = GoogleFonts.poppins(
    color: AppColors.kDarkSilver,
    fontSize: 12.sp,
    fontWeight: FontWeight.w400,
  );

  // static var textStyle24;
}
