import 'package:aislecheck/features/account_management/views/widgets/account_tiles.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../core/constants/strings/app_colors.dart';

class AccountManagement extends StatelessWidget {
  const AccountManagement({super.key});
  //.....PAGE NAME
  static const pageName = '/account_management';
  //.....CONATNT VALUES
  static const _pageHeading = 'Account Management';
  static const _pointZeroTwoPercent = 0.02;
  static const _pointZeroTwoFivePercent = 0.025;
  static const _pointZeroFivePercent = 0.05;
  static const _fontSize = 20.0;
  @override
  Widget build(BuildContext context) {
    final Size(:width, :height) = MediaQuery.sizeOf(context);
    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: width * _pointZeroFivePercent,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: height * _pointZeroTwoPercent,
            ),
            Text(
              _pageHeading,
              style: GoogleFonts.roboto(
                fontWeight: FontWeight.w600,
                fontSize: _fontSize,
                color: AppColors.blackColor,
              ),
            ),
            SizedBox(
              height: height * _pointZeroTwoFivePercent,
            ),
            //.....MANAGEMNET TILES
            const ManagementTiles(),

            SizedBox(
              height: height * _pointZeroTwoFivePercent,
            ),
          ],
        ),
      ),
    );
  }
}
