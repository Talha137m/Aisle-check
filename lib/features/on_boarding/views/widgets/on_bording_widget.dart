import 'package:aislecheck/core/common/widgets/devider_widget.dart';
import 'package:aislecheck/core/common/widgets/user_side_btn.dart';
import 'package:aislecheck/core/constants/images_path.dart';
import 'package:aislecheck/core/constants/strings/app_colors.dart';
import 'package:aislecheck/features/on_boarding/views/widgets/painters/cloudy_background.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OnBoardingWidget extends StatelessWidget {
  final String imagePath, heading, subHeading;
  final VoidCallback nextBtnTab, skipBtnTab;
  final PageController controller;
  const OnBoardingWidget(
      {super.key,
      required this.imagePath,
      required this.controller,
      required this.heading,
      required this.nextBtnTab,
      required this.skipBtnTab,
      required this.subHeading});
  //sizeable constants values
  static const double _tenRate = 0.10;
  static const double _twentyRate = 0.20;
  static const double _sevenTeenRate = 0.17;
  static const double _nighteenRate = 0.19;
  static const double _fifteenRate = 0.15;
  static const double _oneThirdRate = 0.03;
  static const double _sixteenRate = 0.16;
  static const double _thirtyFiveRate = 0.35;
  static const double _fiftyFiveRate = 0.55;
  static const double _oneSecondRate = 0.02;
  static const double _thirteenRate = 0.13;
  static const double _fortyRate = 0.40;
  //flexible widgets contants value
  static const int _seventhFlex = 7;
  static const int _oneFlex = 1;
  @override
  Widget build(BuildContext context) {
    final Size(:width, :height) = MediaQuery.sizeOf(context);
    return Stack(
      children: [
        Align(
          alignment: const Alignment(-1, -0.75),
          child: Image.asset(
            CustmoerImages.onBoardingElipseOne,
            width: width * _twentyRate,
            height: height * _twentyRate,
          ),
        ),
        Positioned(
          top: height * _sevenTeenRate,
          left: width * _nighteenRate,
          child: CustomPaint(
            painter: CloudyBackground(),
            child: SizedBox(
              width: width * _fifteenRate,
              height: height * _oneThirdRate,
            ),
          ),
        ),
        Positioned(
          top: height * _sixteenRate,
          left: width * _thirtyFiveRate,
          child: CustomPaint(
            painter: CloudyBackground(),
            child: SizedBox(
              width: width * _tenRate,
              height: height * _oneSecondRate,
            ),
          ),
        ),
        Positioned(
          top: height * _twentyRate,
          left: width * _fiftyFiveRate,
          child: CustomPaint(
            painter: CloudyBackground(),
            child: SizedBox(
              width: width * _thirteenRate,
              height: height * _oneSecondRate,
            ),
          ),
        ),
        Align(
          alignment: const Alignment(1.1, -0.2),
          child: Image.asset(
            CustmoerImages.onBoardingElipseTwo,
            width: width * _twentyRate,
            height: height * _twentyRate,
          ),
        ),
        Center(
          child: Column(
            children: [
              const Spacer(
                flex: _seventhFlex,
              ),
              Image.asset(
                imagePath,
                width: width * 0.7,
                height: height * 0.3,
              ),
              const Spacer(
                flex: _oneFlex,
              ),
              Text(
                heading,
                style: GoogleFonts.roboto(
                  fontSize: 34,
                  fontWeight: FontWeight.w700,
                ),
              ),
              const Spacer(
                flex: _oneFlex,
              ),
              SizedBox(
                width: width * 0.9,
                child: Text(
                  subHeading,
                  style: GoogleFonts.roboto(
                    fontSize: 14,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
              const Spacer(
                flex: _oneFlex,
              ),
              SmoothPageIndicator(
                controller: controller,
                count: 3,
                effect: const WormEffect(
                    activeDotColor: AppColors.greenColor,
                    dotColor: AppColors.grayColor,
                    dotWidth: 10,
                    dotHeight: 10),
              ),
              // DotIndicator(
              //     currentItem: index,
              //     count: 3,
              //     unselectedColor: AppColors.grayColor,
              //     selectedColor: AppColors.greenColor),
              const Spacer(
                flex: _oneFlex,
              ),
              UserSideBtn(
                onTap: nextBtnTab,
              ),
              const Spacer(
                flex: _oneFlex,
              ),
              UserSideBtn(
                onTap: skipBtnTab,
                btnName: 'Skip',
                btnBackgroundColor: AppColors.whiteColor,
                btnTextColor: AppColors.blackColor,
              ),
              const DividerWidget()
            ],
          ),
        )
      ],
    );
  }
}
