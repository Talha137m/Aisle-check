import 'package:aislecheck/core/constants/strings/app_colors.dart';
import 'package:flutter/material.dart';

abstract class AppTheme {
  static ThemeData theme() {
    return ThemeData(
      scrollbarTheme: const ScrollbarThemeData().copyWith(
        thumbColor: const WidgetStatePropertyAll(AppColors.whiteColor),
        trackColor: const WidgetStatePropertyAll(AppColors.transParentColor),
      ),
      scaffoldBackgroundColor: AppColors.whiteColor,
      textSelectionTheme:
          const TextSelectionThemeData(cursorColor: AppColors.grayColor),
      appBarTheme: const AppBarTheme(
        color: AppColors.whiteColor,
        elevation: 0,
        titleTextStyle: TextStyle(color: AppColors.blackColor, fontSize: 20),
        iconTheme: IconThemeData(color: AppColors.blackColor),
        foregroundColor: AppColors.whiteColor,
        actionsIconTheme: IconThemeData(
          color: AppColors.blackColor,
        ),
        //backgroundColor: AppColors.whiteColor
      ),
      colorScheme: ColorScheme.fromSeed(seedColor: AppColors.whiteColor),
      useMaterial3: true,
      bottomSheetTheme:
          const BottomSheetThemeData(backgroundColor: AppColors.whiteColor),
    );
  }
}
