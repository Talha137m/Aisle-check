import 'package:aislecheck/core/constants/strings/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class UserSideBtn extends StatelessWidget {
  final VoidCallback onTap;
  final Color btnBackgroundColor;
  final Color btnTextColor;
  final double btnWidth, btnHeight;
  final String btnName;
  final double borderRadius;
  const UserSideBtn(
      {super.key,
      required this.onTap,
      this.btnHeight = 0.07,
      this.btnWidth = 0.9,
      this.borderRadius=14,
      this.btnBackgroundColor = AppColors.greenColor,
      this.btnTextColor = AppColors.whiteColor,
      this.btnName = 'Next'});
  //font size variable
  static const double _fontSize = 14;
  @override
  Widget build(BuildContext context) {
    final Size(:width, :height) = MediaQuery.sizeOf(context);
    return InkWell(
      onTap: onTap,
      child: Container(
        height: height * btnHeight,
        width: width * btnWidth,
        decoration: BoxDecoration(
          color: btnBackgroundColor,
          borderRadius: BorderRadius.circular(borderRadius),
        ),
        child: Center(
          child: Text(
            btnName,
            style: GoogleFonts.roboto(
              fontSize: _fontSize,
              color: btnTextColor,
            ),
          ),
        ),
      ),
    );
  }
}
