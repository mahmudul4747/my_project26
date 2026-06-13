import 'package:flutter/material.dart';
import 'package:my_project26/core/containts/app_colors.dart';


class AppTheme {
  static ThemeData lightTheme = ThemeData(
    useMaterial3: true,
    scaffoldBackgroundColor: Colors.white,
    primaryColor: AppColors.primary,
    colorScheme: ColorScheme.fromSeed(
      seedColor: AppColors.primary,
    ),
  );
}