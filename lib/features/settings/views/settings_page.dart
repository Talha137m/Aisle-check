import 'package:aislecheck/core/common/widgets/admin_lis_tile.dart';
import 'package:aislecheck/core/common/widgets/global_app_bar.dart';
import 'package:aislecheck/core/constants/strings/app_colors.dart';
import 'package:aislecheck/features/settings/views/widgets/settings_detail_widgets.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});
  //....PAGE NAME
  static const pageName = '/settings_page';
  //.....CONATNT VALUES
  static const _title = 'Ads';
  static const _settigns = 'Settings';
  static const _notifyText = 'Notification Prefrences';
  static const _languageText = 'Language';
  static const _privacyText = 'Privacy Policy';
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
                _settigns,
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
                  _notifyText,
                  style: tilesTextStyle,
                ),
                trailing: Icon(
                  Icons.arrow_forward_ios_rounded,
                  color: AppColors.blackColor,
                  size: height * 0.025,
                ),
              ),
              SizedBox(
                height: height * _pointZeroOnePercent,
              ),
              CustomFilledListTile(
                leading: Text(
                  _languageText,
                  style: tilesTextStyle,
                ),
                trailing: const CustomizedDropDownMenu(),
              ),
              SizedBox(
                height: height * _pointZeroOnePercent,
              ),
              CustomFilledListTile(
                leading: Text(
                  _privacyText,
                  style: tilesTextStyle,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
