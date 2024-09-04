import 'package:flutter/material.dart';
import '../utils/app_colors.dart';
import 'const_themes.dart';

ThemeData themeData() => ThemeData(
      scaffoldBackgroundColor: AppColors.kLightSilverE6EAF4,
      primaryColor: AppColors.kBlack,
      cardColor: AppColors.kZinnwalditeBrown,
      appBarTheme:
          const AppBarTheme(backgroundColor: AppColors.kLightSilverE6EAF4),
      textTheme: AppThemes.textTheme,
      inputDecorationTheme: AppThemes.inputDecorationTheme,
      elevatedButtonTheme: AppThemes.elevatedButtonTheme,
    );
