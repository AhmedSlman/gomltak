import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../utils/app_colors.dart';
import '../utils/text_style.dart';

/// | NAME       | SIZE |  WEIGHT |  SPACING |             |
/// |------------|------|---------|----------|-------------|
/// | headline1  | 96.0 | light   | -1.5     |             |
/// | headline2  | 60.0 | light   | -0.5     |             |
/// | headline3  | 48.0 | regular |  0.0     |             |
/// | headline4  | 34.0 | regular |  0.25    |             |
/// | headline5  | 24.0 | regular |  0.0     |             |
/// | headline6  | 20.0 | medium  |  0.15    |             |
/// | subtitle1  | 16.0 | regular |  0.15    |             |
/// | subtitle2  | 14.0 | medium  |  0.1     |             |
/// | body1      | 16.0 | regular |  0.5     | (bodyText1) |
/// | body2      | 14.0 | regular |  0.25    | (bodyText2) |
/// | button     | 14.0 | medium  |  1.25    |             |
/// | caption    | 12.0 | regular |  0.4     |             |
/// | overline   | 10.0 | regular |  1.5     |             |

// displayLarge: Styles.textStyle14, //96
// displayMedium: Styles.textStyle14, //60
// displaySmall: Styles.textStyle14, //48
// headlineLarge: Styles.textStyle14,
// labelMedium: Styles.textStyle14,
// bodyLarge: Styles.textStyle16,//16.0

class AppThemes {
  static TextTheme textTheme = TextTheme(
    headlineMedium: Styles.textStyle24, //34
    headlineSmall: Styles.textStyle22, //24
    titleLarge: Styles.textStyle16, //20.0
    titleMedium: Styles.textStyle12, //16.0======>18
    titleSmall: Styles.textStyle11, //14.0
    labelLarge: Styles.textStyle10, //14.0======>15
    bodyMedium: Styles.textStyle9, //14.0
    bodySmall: Styles.textStyle8, //12.0
    labelSmall: Styles.textStyle10, //10.0
  );

  static InputDecorationTheme inputDecorationTheme = InputDecorationTheme(
    hintStyle:
        Styles.textStyle10.copyWith(color: AppColors.kDarkSilver, height: 1.47),
    filled: true,
    fillColor: AppColors.kAntiFlashWhite,
    contentPadding: EdgeInsetsDirectional.only(
        top: 17.h, bottom: 13.h, start: 20.0.w, end: 20.w),
    border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(6.r),
      borderSide: const BorderSide(
        width: 1,
        color: AppColors.kAntiFlashWhite,
      ),
    ),
    enabledBorder: OutlineInputBorder(
      borderSide: const BorderSide(
        color: AppColors.kTransparent,
      ),
      borderRadius: BorderRadius.circular(6.0),
    ),
    errorBorder: OutlineInputBorder(
      borderSide: const BorderSide(
        width: 1,
        color: AppColors.kTransparent,
      ),
      borderRadius: BorderRadius.circular(6.0),
    ),
    focusedBorder: OutlineInputBorder(
      borderSide: const BorderSide(
        width: 1,
        color: AppColors.kTransparent,
      ),
      borderRadius: BorderRadius.circular(6.0),
    ),
  );

  static ElevatedButtonThemeData elevatedButtonTheme = ElevatedButtonThemeData(
    style: ButtonStyle(
      textStyle:
          MaterialStateProperty.all(Styles.textStyle12.copyWith(height: 5.4)),
      alignment: Alignment.center,
      padding:
          MaterialStateProperty.all(EdgeInsets.symmetric(horizontal: 10.h)),
      backgroundColor: MaterialStateProperty.all(AppColors.mainColor),
    ),
  );
}
