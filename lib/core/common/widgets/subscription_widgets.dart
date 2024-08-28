import 'package:aislecheck/core/common/widgets/app_compat_btn.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../core/constants/images_path.dart';
import '../../../../core/constants/strings/app_colors.dart';

class CurrentSubscriptionAndTime extends StatelessWidget {
  const CurrentSubscriptionAndTime(
      {super.key, required this.membershipText, required this.timeRemaining});
  final String membershipText;
  final String timeRemaining;
  //...CONATNT VALUES
  static const _pointTwoPercent = 0.2;
  static const _imageBorderRadius = 10.0;
  static const _timeFont = 24.0;
  @override
  Widget build(BuildContext context) {
    final Size(:width, :height) = MediaQuery.sizeOf(context);
    return Stack(
      children: [
        SizedBox(
          height: height * _pointTwoPercent,
          width: width,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(
              _imageBorderRadius,
            ),
            child: Image.asset(
              AdminImages.subscription,
              fit: BoxFit.fill,
            ),
          ),
        ),
        Opacity(
          opacity: _pointTwoPercent,
          child: Container(
            height: height * _pointTwoPercent,
            width: width,
            decoration: BoxDecoration(
              color: Colors.black,
              borderRadius: BorderRadius.circular(
                _imageBorderRadius,
              ),
            ),
          ),
        ),
        SizedBox(
          height: height * _pointTwoPercent,
          width: width,
          child: Column(
            children: [
              Expanded(
                child: Align(
                  alignment: Alignment.bottomCenter,
                  child: Text(
                    membershipText,
                    style: GoogleFonts.roboto(
                      color: AppColors.whiteColor,
                    ),
                  ),
                ),
              ),
              Expanded(
                  child: Text(
                timeRemaining,
                style: GoogleFonts.roboto(
                  color: AppColors.whiteColor,
                  fontSize: _timeFont,
                  fontWeight: FontWeight.w600,
                ),
              ))
            ],
          ),
        )
      ],
    );
  }
}

class MembershipCards extends StatelessWidget {
  const MembershipCards({super.key});
  //....CONSTANT VALUES
  static const _freeTextOne = 'Enjoy free membership';
  static const _basicTextOne = 'Every thing in Free, plus:';
  static const _basicTextTwo = 'Access to forecasting';
  static const _proTextOne = 'Every thing in Basic, plus:';
  static const _proTextTwo = '3 Daily product boost';
  static const _proTextThree = '1 Store boost for a month';
  static const _upgradeBasicBtnText = 'Upgrade to Basic';
  static const _upgradeProBtnText = 'Upgrade to Pro';
  static const _freeText = 'Free';
  static const _basicText = 'Basic';
  static const _proText = 'Pro';
  static const _pointZeroTwoPercent = 0.02;
  static const _upgradeBasicBtnWidth = 0.3;
  static const _upgradeProBtnWidth = 0.27;
  static const _zeroPrice = 0.00;
  static const _ninePointNinePrice = 9.99;
  static const _nineteenPointNinePrice = 19.99;
  @override
  Widget build(BuildContext context) {
    final Size(:width, :height) = MediaQuery.sizeOf(context);
    return Column(
      children: [
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
        const MembershipCard(
          membershipType: _basicText,
          texts: [
            _basicTextOne,
            _basicTextTwo,
          ],
          price: _ninePointNinePrice,
          btnWidth: _upgradeBasicBtnWidth,
          btnText: _upgradeBasicBtnText,
        ),
        SizedBox(
          height: height * _pointZeroTwoPercent,
        ),
        const MembershipCard(
          membershipType: _proText,
          texts: [_proTextOne, _proTextTwo, _proTextThree],
          price: _nineteenPointNinePrice,
          btnWidth: _upgradeProBtnWidth,
          btnText: _upgradeProBtnText,
        ),
      ],
    );
  }
}

//.....MEMBERSHIP CARD
class MembershipCard extends StatelessWidget {
  const MembershipCard(
      {super.key,
      required this.texts,
      this.shouldBeABorder = true,
      required this.price,
      this.shouldBeAButton = true,
      this.onTap,
      this.btnWidth = 0.0,
      this.btnText = '',
      required this.membershipType});
  final List<String> texts;
  final bool shouldBeABorder, shouldBeAButton;
  final double price, btnWidth;
  final VoidCallback? onTap;
  final String btnText, membershipType;
  //.........CONSTANT VALUES
  static const _pointZeroOnePercent = 0.01;
  static const _pointZeroThreePercent = 0.03;
  static const _pointZeroFivePercent = 0.05;
  static const _pointZeroFourPercent = 0.04;
  static const _fontSize = 10.0;
  //....DECORATION
  static const _broderRadius = 20.0;
  static const _fontSizeEighteen = 18.0;
  @override
  Widget build(BuildContext context) {
    final Size(:width, :height) = MediaQuery.sizeOf(context);
    return Container(
      width: width,
      padding: EdgeInsets.symmetric(
          horizontal: width * _pointZeroFivePercent,
          vertical: height * _pointZeroThreePercent),
      decoration: BoxDecoration(
        color: AppColors.lightGreenColor,
        borderRadius: BorderRadius.circular(_broderRadius),
        border: shouldBeABorder
            ? Border.all(
                color: AppColors.greenColor,
                width: 2.0,
              )
            : null,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Expanded(
                child: Text(
                  membershipType,
                  style: GoogleFonts.roboto(
                    fontSize: _fontSizeEighteen,
                    fontWeight: FontWeight.w600,
                    color: AppColors.grayColor,
                  ),
                ),
              ),
              Expanded(
                  child: Align(
                alignment: Alignment.centerRight,
                child: shouldBeAButton
                    ? AppCompactBtn(
                        onTap: onTap,
                        btnHeight: _pointZeroFourPercent,
                        btnWidth: btnWidth,
                        btnName: btnText,
                        fontSize: _fontSize,
                        isTextBold: true,
                      )
                    : const SizedBox(),
              ))
            ],
          ),
          SizedBox(
            height: height * _pointZeroOnePercent,
          ),
          for (int i = 0; i < texts.length; i++) Text(texts[i]),
          Text(
            '\$$price/Month',
            style: GoogleFonts.roboto(
              fontWeight: FontWeight.bold,
              color: AppColors.blackColor,
            ),
          )
        ],
      ),
    );
  }
}
