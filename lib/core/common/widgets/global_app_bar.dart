import 'package:aislecheck/config/navigation/routes.dart';
import 'package:aislecheck/core/constants/strings/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class GlobalAppBar extends AppBar {
  final Color? color;
  final VoidCallback? leadingOnTab;
  final Widget? bottomWidget;
  static const double _fs16 = 18;
  static const _elevationValue = 0.0;
  final String titleText;
  GlobalAppBar(
      {super.key,
      this.color,
      this.leadingOnTab,
      this.bottomWidget,
      required this.titleText})
      : super(
          backgroundColor: color,
          shadowColor: AppColors.whiteColor,
          foregroundColor: AppColors.whiteColor,
          surfaceTintColor: AppColors.whiteColor,
          elevation: _elevationValue,
          scrolledUnderElevation: _elevationValue,
          leading: IconButton(
            onPressed: leadingOnTab ?? _onTab,
            icon: const Icon(Icons.arrow_back_ios),
          ),
          title: Text(
            titleText,
            style: GoogleFonts.roboto(
                fontWeight: FontWeight.w500,
                fontSize: _fs16,
                color: AppColors.blackColor),
          ),
          centerTitle: true,
          bottom: switch (bottomWidget) {
            null => null,
            _ => AppBar(
                automaticallyImplyLeading: false,
                flexibleSpace: Center(
                  child: bottomWidget,
                ),
              ),
          },
        );
  static void _onTab() {
    Navigator.of(NavigationState.navigatorKey.currentState!.context).pop();
  }
}
