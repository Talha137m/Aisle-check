import 'package:aislecheck/core/constants/strings/app_colors.dart';
import 'package:aislecheck/features/admin_home/models/stock_model.dart';
import 'package:aislecheck/features/forecasting/views/widgets/forecasting_progress_bar.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ForeCastedItem extends StatelessWidget {
  final double progressValue;
  const ForeCastedItem(
      {super.key, required this.product, required this.progressValue});
  final AvailableStockModel product;
  //...CONSTANT VALUES
  static const _pointZeroOnePercent = 0.01;
  static const _pointZeroTwoPercent = 0.02;
  static const _pointOneTwoPercent = 0.12;
  static const _pointOneFivePercent = 0.15;
  static const _pointTwoFivePercent = 0.25;
  static const _pointNinePercent = 0.9;
  static const _borderRadius = 20.0;
  static const _imageBorderRadius = 10.0;
  static const _blurRadius = 5.0;
  static const _spreadRadius = 1.0;
  static const _shadowOffset = Offset(1.0, 1.0);
  static const _productFontSize = 16.0;
  static const _normalFontSize = 12.0;
  //...CONSTANT FLEX SIZES
  static const _flexOne = 1;
  static const _flexTwo = 2;
  static const _flexFour = 4;
  @override
  Widget build(BuildContext context) {
    final Size(:width, :height) = MediaQuery.sizeOf(context);
    return Center(
      child: Container(
        padding: EdgeInsets.all(height * _pointZeroTwoPercent),
        width: width * _pointNinePercent,
        height: height * _pointOneFivePercent,
        decoration: BoxDecoration(
          color: AppColors.whiteColor,
          boxShadow: const [
            BoxShadow(
              color: AppColors.black54Color,
              blurRadius: _blurRadius,
              spreadRadius: _spreadRadius,
              offset: _shadowOffset,
            )
          ],
          borderRadius: BorderRadius.circular(_borderRadius),
        ),
        child: Row(
          children: [
            Expanded(
              flex: _flexOne,
              child: Center(
                child: SizedBox(
                  width: width * _pointTwoFivePercent,
                  height: height * _pointOneTwoPercent,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(
                      _imageBorderRadius,
                    ),
                    child: Image.asset(
                      product.image,
                      fit: BoxFit.fill,
                    ),
                  ),
                ),
              ),
            ),
            Expanded(
              flex: _flexTwo,
              child: Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: width * _pointZeroOnePercent),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Spacer(),
                    Expanded(
                      flex: _flexFour,
                      child: Row(
                        children: [
                          Expanded(
                            child: Align(
                              alignment: Alignment.bottomLeft,
                              child: Text(
                                product.productName,
                                style: GoogleFonts.roboto(
                                  fontSize: _productFontSize,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Expanded(
                      flex: _flexFour,
                      child: Align(
                        alignment: Alignment.bottomLeft,
                        child: Text(
                          'Current Stock : ${product.currentStock}',
                          style: GoogleFonts.roboto(
                            fontSize: _normalFontSize,
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      flex: _flexFour,
                      child: Row(
                        children: [
                          Expanded(
                            child: Text(
                              'updated ${product.lastUpdated} ago',
                              style: GoogleFonts.roboto(
                                fontSize: _normalFontSize,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            ForecastingProgressBar(
              value: progressValue,
            ),
          ],
        ),
      ),
    );
  }
}
