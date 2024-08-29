import 'package:aislecheck/core/common/widgets/app_compat_btn.dart';
import 'package:aislecheck/core/common/widgets/global_app_bar.dart';
import 'package:aislecheck/core/constants/strings/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class IntegrateInventoryPage extends StatelessWidget {
  const IntegrateInventoryPage({super.key});
  //.....PAGE NAME
  static const pageName = '/intgerate_inventory_page';
  //....CONATNT VALUES
  static const _title = 'Ads';
  static const _heading = 'Integrate Inventory System';
  static const _subHeading = 'Integrate Inventory with :';
  static const _benefitsHeading =
      'Benefits of linking inventory with AisleCheck :';
  static const _benefitsDescription =
      '''Linking your inventory with AisleCheck ensures that your stock data is always accurate and up-to-date, boosting sales and customer trust by showing real-time product availability. It enables smarter forecasting by leveraging historical data and market trends, helping you optimize inventory levels and reduce waste.

The automation of inventory management saves time, reduces costs, and minimizes errors. With seamless integration into existing tools like QuickBooks and Square, you maintain consistent inventory tracking across platforms. AisleCheck also provides automatic alerts for low stock, preventing stockouts and lost sales, while offering valuable insights and analytics to support informed decision-making. By enhancing reliability and customer experience, AisleCheck''';
  static const _pointOnePercent = 0.1;
  static const _pointZeroTwoPercent = 0.02;
  static const _pointZeroTwoFivePercent = 0.025;
  static const _pointZeroFivePercent = 0.05;
  static const _fontSizeThirteen = 13.0;
  static const _fontSizeFiteen = 15.0;
  static const _fontSizeTwenty = 20.0;
  static const _btnRadius = 30.0;
  static const _quickBooksbtnText = 'Connect with QuickBooks';
  static const _squareInventorybtnText = 'Connect with Square Inventory';
  static const _confirmbtnText = 'Confirm';
  static const _btnHeight = 0.07;
  @override
  Widget build(BuildContext context) {
    final Size(:width, :height) = MediaQuery.sizeOf(context);
    return Scaffold(
      appBar: GlobalAppBar(titleText: _title),
      body: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          SingleChildScrollView(
            child: Padding(
              padding: EdgeInsetsDirectional.symmetric(
                horizontal: width * _pointZeroFivePercent,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: height * _pointZeroTwoFivePercent,
                  ),
                  Text(
                    _heading,
                    style: GoogleFonts.roboto(
                      fontSize: _fontSizeTwenty,
                      fontWeight: FontWeight.bold,
                      color: AppColors.blackColor,
                    ),
                  ),
                  SizedBox(
                    height: height * _pointZeroTwoPercent,
                  ),
                  Text(
                    _subHeading,
                    style: GoogleFonts.roboto(
                      fontSize: _fontSizeFiteen,
                      fontWeight: FontWeight.w600,
                      color: AppColors.blackColor,
                    ),
                  ),
                  SizedBox(
                    height: height * _pointZeroTwoPercent,
                  ),
                  AppCompactBtn(
                    onTap: () {},
                    btnHeight: _btnHeight,
                    borderRadius: _btnRadius,
                    btnName: _quickBooksbtnText,
                    isTextBold: true,
                  ),
                  SizedBox(
                    height: height * _pointZeroTwoPercent,
                  ),
                  AppCompactBtn(
                    onTap: () {},
                    btnHeight: _btnHeight,
                    borderRadius: _btnRadius,
                    btnName: _squareInventorybtnText,
                    isTextBold: true,
                  ),
                  SizedBox(
                    height: height * _pointZeroTwoFivePercent,
                  ),
                  Text(
                    _benefitsHeading,
                    style: GoogleFonts.roboto(
                      fontSize: _fontSizeFiteen,
                      fontWeight: FontWeight.w600,
                      color: AppColors.blackColor,
                    ),
                  ),
                  SizedBox(
                    height: height * _pointZeroTwoPercent,
                  ),
                  Text(
                    _benefitsDescription,
                    style: GoogleFonts.roboto(
                      fontSize: _fontSizeThirteen,
                      color: AppColors.grayColor,
                    ),
                  ),
                  SizedBox(
                    height: height * _pointOnePercent,
                  ),
                ],
              ),
            ),
          ),
          Positioned(
              bottom: height * _pointZeroTwoPercent,
              child: AppCompactBtn(
                onTap: () {},
                btnHeight: _btnHeight,
                borderRadius: _btnRadius,
                btnName: _confirmbtnText,
                isTextBold: true,
              ))
        ],
      ),
    );
  }
}
