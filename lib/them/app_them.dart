import 'package:flutter/material.dart';
import 'package:smart_student_app/them/app_colors.dart';

ThemeData appTheme = ThemeData(
  useMaterial3: true,

  colorScheme: ColorScheme.light(
    primary: AppColors.primary,
    secondary: AppColors.secondary,
    surface: AppColors.surface,
    background: AppColors.background,
    error: AppColors.error,
  ),

  scaffoldBackgroundColor: AppColors.background,
  fontFamily: 'Roboto',

  appBarTheme: const AppBarTheme(
    backgroundColor: AppColors.surface,
    foregroundColor: AppColors.textPrimary,
    centerTitle: true,
    elevation: 0,
  ),

  textTheme: const TextTheme(
    headlineMedium: TextStyle(
      fontSize: 24,
      fontWeight: FontWeight.w600,
      color: AppColors.textPrimary,
    ),
    bodyMedium: TextStyle(
      fontSize: 16,
      fontWeight: FontWeight.w400,
      color: AppColors.textSecondary,
    ),
  ),

  drawerTheme: const DrawerThemeData(backgroundColor: AppColors.surface),
);
