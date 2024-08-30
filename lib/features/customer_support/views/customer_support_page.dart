import 'package:aislecheck/core/common/widgets/admin_lis_tile.dart';
import 'package:aislecheck/core/common/widgets/global_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../core/constants/strings/app_colors.dart';

class CustomerSupportPage extends StatelessWidget {
  const CustomerSupportPage({super.key});
  //.....PAGE NAME
  static const pageName = '/customer_support_page';
  //.....CONATNT VALUES
  static const _title = 'Ads';
  static const _customerSupport = 'Customer support';
  static const _faqsText = 'FAQs';
  static const _supportText = 'Support Ticket';
  static const _emailText = 'Email';
  static const _pointZeroOnePercent = 0.01;
  static const _pointZeroTwoFivePercent = 0.025;
  static const _pointZeroFivePercent = 0.05;
  static const _fontSizeFourteen = 14.0;
  static const _fontSizeTwenty = 20.0;
  @override
  Widget build(BuildContext context) {
    final Size(:width, :height) = MediaQuery.sizeOf(context);
    final tilesTextStyle = GoogleFonts.roboto(
      color: AppColors.blackColor,
      fontSize: _fontSizeFourteen,
      fontWeight: FontWeight.w500,
    );
    return Scaffold(
      appBar: GlobalAppBar(titleText: _title),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: width * _pointZeroFivePercent,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: height * _pointZeroTwoFivePercent,
              ),
              Text(
                _customerSupport,
                style: GoogleFonts.roboto(
                  fontWeight: FontWeight.w600,
                  fontSize: _fontSizeTwenty,
                  color: AppColors.blackColor,
                ),
              ),
              SizedBox(
                height: height * _pointZeroTwoFivePercent,
              ),
              CustomFilledListTile(
                leading: Text(
                  _faqsText,
                  style: tilesTextStyle,
                ),
                trailing: Icon(
                  Icons.arrow_forward_ios_rounded,
                  color: AppColors.blackColor,
                  size: height * _pointZeroTwoFivePercent,
                ),
              ),
              SizedBox(
                height: height * _pointZeroOnePercent,
              ),
              CustomFilledListTile(
                leading: Text(
                  _supportText,
                  style: tilesTextStyle,
                ),
                trailing: Icon(
                  Icons.arrow_forward_ios_rounded,
                  color: AppColors.blackColor,
                  size: height * _pointZeroTwoFivePercent,
                ),
              ),
              SizedBox(
                height: height * _pointZeroOnePercent,
              ),
              CustomFilledListTile(
                leading: Text(
                  _emailText,
                  style: tilesTextStyle,
                ),
                trailing: Icon(
                  Icons.arrow_forward_ios_rounded,
                  color: AppColors.blackColor,
                  size: height * _pointZeroTwoFivePercent,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
