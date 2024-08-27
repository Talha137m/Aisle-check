import 'package:aislecheck/core/constants/strings/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomerAppBar extends StatelessWidget implements PreferredSizeWidget {
  final Color? backgroundColor;
  final VoidCallback? leadingOnTab;
  final PreferredSizeWidget? bottom;
  const CustomerAppBar(
      {super.key, this.backgroundColor, this.leadingOnTab, this.bottom});

  static const double _fs16 = 16;
  static const _elevationValue = 0.0;
  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: backgroundColor,
      shadowColor: AppColors.whiteColor,
      foregroundColor: AppColors.whiteColor,
      surfaceTintColor: AppColors.whiteColor,
      elevation: _elevationValue,
      scrolledUnderElevation: _elevationValue,
      leading: IconButton(
        onPressed: leadingOnTab ??
            () {
              Navigator.pop(context);
            },
        icon: const Icon(Icons.arrow_back_ios),
      ),
      title: Text(
        'Ads',
        style: GoogleFonts.roboto(
            fontWeight: FontWeight.w500,
            fontSize: _fs16,
            color: AppColors.blackColor),
      ),
      centerTitle: true,
      bottom: bottom,
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
