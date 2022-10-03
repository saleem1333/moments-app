import 'package:flutter/material.dart';

import 'app_colors.dart';

class AppTheme {
  static ThemeData theme = ThemeData(
    fontFamily: 'Tajawal',
    primaryColor: AppColors.mainColor,
    scaffoldBackgroundColor: Colors.white,
    floatingActionButtonTheme: const FloatingActionButtonThemeData().copyWith(
      backgroundColor: AppColors.mainColor,
    ),
    colorScheme: ColorScheme.fromSwatch(
      primarySwatch: MaterialColor(
        AppColors.mainColor.value,
        const {
          50: AppColors.mainColor,
          100: AppColors.mainColor,
          200: AppColors.mainColor,
          300: AppColors.mainColor,
          400: AppColors.mainColor,
          500: AppColors.mainColor,
          600: AppColors.mainColor,
          700: AppColors.mainColor,
          800: AppColors.mainColor,
          900: AppColors.mainColor,
        },
      ),
    ).copyWith(
      secondary: AppColors.grey2,
    ),
  );
}
