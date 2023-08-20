import 'package:flutter/material.dart';

import '../constants/app_colors.dart';

ThemeData themeData = ThemeData(
  primaryColor: AppColors.kPrimaryColor,
  brightness: Brightness.light,
  colorScheme: const ColorScheme(
    background: AppColors.kScaffoldBGColor,
    brightness: Brightness.light,
    primary: AppColors.kPrimaryColor,
    onPrimary: AppColors.kOnPrimaryColor,
    secondary: AppColors.kSecondaryColor,
    onSecondary: AppColors.kOnSecondaryColor,
    error: AppColors.kErrorColor,
    onError: AppColors.kOnErrorColor,
    onBackground: AppColors.kOnBackgroundColor,
    surface: AppColors.kSurfaceColor,
    onSurface: AppColors.kOnSurfaceColor,
  ),
  scaffoldBackgroundColor: AppColors.kScaffoldBGColor,
  appBarTheme: const AppBarTheme(
      backgroundColor: AppColors.kPrimaryColor,
      shadowColor: AppColors.kErrorColor,
      foregroundColor: AppColors.kOnPrimaryColor),
);
