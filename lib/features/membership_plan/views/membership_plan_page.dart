import 'package:aislecheck/core/common/widgets/app_compat_btn.dart';
import 'package:aislecheck/core/common/widgets/global_app_bar.dart';
import 'package:aislecheck/core/constants/strings/app_colors.dart';
import 'package:aislecheck/features/ad_payment/views/ad_payment_page.dart';
import 'package:aislecheck/features/cancellation_survey/views/cancellation_survey_page.dart';
import 'package:aislecheck/features/membership_plan/views/widgets/subscription_detail_widgets.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MemberShipPlanPage extends StatelessWidget {
  const MemberShipPlanPage({super.key});
  //......PAGE NAME
  static const pageName = '/subscription_plan_page';
  //CONSTANT VALUES
  static const _title = 'Ads';
  static const _heading = 'Membership Plans';
  static const _freeText = 'Free';
  static const _proText = 'Pro';
  static const _upgradeText = 'Upgrade Your Experience';
  // static const _upgradeBasicBtnText = 'Upgrade to Basic';
  static const _upgradeProBtnText = 'Upgrade to Pro';
  static const _cnfrmBtnText = 'Cancel Membership';
  static const _descpText =
      'Access premium features to enhance your shopping experience';
  static const _freeTextOne = 'Enjoy free membership';
  static const _proTextOne = 'Every thing in Basic, plus:';
  static const _proTextTwo = '3 Daily product boost';
  static const _proTextThree = '1 Store boost for a week';
  static const _pointZeroOnePercent = 0.01;
  static const _pointZeroTwoPercent = 0.02;
  static const _pointZeroThreePercent = 0.03;
  static const _pointZeroTwoFivePercent = 0.025;
  static const _pointZeroFivePercent = 0.05;

  static const _headingFontSize = 20.0;
  static const _descpFontSize = 14.0;
  static const _planFontSize = 15.0;
  static const _cnfrmBtnHeight = 0.07;
  static const _cnfrmBorderRadius = 30.0;
  static const _upgradeProBtnWidth = 0.27;
  static const _zeroPrice = 0.00;
  static const _nineteenPointNinePrice = 19.99;
  @override
  Widget build(BuildContext context) {
    final Size(:width, :height) = MediaQuery.sizeOf(context);
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
                height: height * _pointZeroTwoPercent,
              ),
              Text(
                _heading,
                style: GoogleFonts.roboto(
                  fontSize: _headingFontSize,
                  fontWeight: FontWeight.w600,
                  color: AppColors.blackColor,
                ),
              ),
              SizedBox(
                height: height * _pointZeroTwoPercent,
              ),

              //................ SUBSCRIPTION IMAGE
              const CurrentSubscriptionAndTime(
                membershipType: 'free',
                timeRemaining: '20 : 24 : 20 : 00',
              ),

              SizedBox(
                height: height * _pointZeroThreePercent,
              ),

              Text(
                _upgradeText,
                style: GoogleFonts.roboto(
                  fontSize: _headingFontSize,
                  fontWeight: FontWeight.w600,
                  color: AppColors.blackColor,
                ),
              ),

              SizedBox(
                height: height * _pointZeroOnePercent,
              ),

              Text(
                _descpText,
                style: GoogleFonts.roboto(
                  fontSize: _descpFontSize,
                  color: AppColors.grayColor,
                ),
              ),
              SizedBox(
                height: height * _pointZeroTwoFivePercent,
              ),

              Text(
                _heading,
                style: GoogleFonts.roboto(
                  fontSize: _planFontSize,
                  fontWeight: FontWeight.w600,
                  color: AppColors.blackColor,
                ),
              ),

              SizedBox(
                height: height * _pointZeroTwoPercent,
              ),

              const MembershipCard(
                membershipType: _freeText,
                texts: [_freeTextOne],
                price: _zeroPrice,
                shouldBeABorder: false,
                shouldBeAButton: false,
              ),
              SizedBox(
                height: height * _pointZeroTwoPercent,
              ),
              MembershipCard(
                onTap: () {
                  Navigator.pushNamed(context, AdPaymentPage.pageName);
                },
                membershipType: _proText,
                texts: const [_proTextOne, _proTextTwo, _proTextThree],
                price: _nineteenPointNinePrice,
                btnWidth: _upgradeProBtnWidth,
                btnText: _upgradeProBtnText,
              ),
              SizedBox(
                height: height * _pointZeroFivePercent,
              ),
              AppCompactBtn(
                btnBackgroundColor: AppColors.redColor,
                onTap: () {
                  Navigator.pushNamed(context, CancellationSurveyPage.pageName);
                },
                btnHeight: _cnfrmBtnHeight,
                borderRadius: _cnfrmBorderRadius,
                btnName: _cnfrmBtnText,
                isTextBold: true,
              ),
              SizedBox(
                height: height * _pointZeroTwoFivePercent,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
