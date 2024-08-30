import 'package:aislecheck/core/common/widgets/app_compat_btn.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../core/constants/images_path.dart';
import '../../../../core/constants/strings/app_colors.dart';

class CurrentSubscriptionAndTime extends StatelessWidget {
  const CurrentSubscriptionAndTime(
      {super.key, required this.membershipType, required this.timeRemaining});
  final String membershipType;
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
                    'You have $membershipType Membership',
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
