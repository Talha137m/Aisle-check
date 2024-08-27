import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../core/constants/strings/app_colors.dart';

//......STOCK CONTAINERS ROW
class StockContainersRow extends StatelessWidget {
  const StockContainersRow({super.key});
  //...CONSTANT FLEX SIZES
  static const _flexOne = 1;
  @override
  Widget build(BuildContext context) {
    return const Row(
      children: [
        Expanded(
          flex: _flexOne,
          child: Center(
            child: StockContainer(
                backgroundColor: AppColors.greenColor,
                stockType: 'Total',
                units: 100),
          ),
        ),
        Expanded(
          flex: _flexOne,
          child: Center(
            child: StockContainer(
              backgroundColor: AppColors.redColor,
              stockType: 'Low',
              units: 5,
            ),
          ),
        ),
      ],
    );
  }
}

//....STOCK CONTAINER
class StockContainer extends StatelessWidget {
  const StockContainer(
      {super.key,
      required this.backgroundColor,
      required this.stockType,
      required this.units});
  final Color backgroundColor;
  final int units;
  final String stockType;
  //...CONSTANT VALUES
  static const _pointZeroTwoPercent = 0.02;
  static const _pointZeroThreePercent = 0.03;
  static const _pointOneOnePercent = 0.11;
  static const _pointFourTwoPercent = 0.42;
  static const _borderRadius = 10.0;
  //...CONSTANT FLEX SIZES
  static const _flexOne = 1;
  static const _flexTwo = 2;
  @override
  Widget build(BuildContext context) {
    final Size(:width, :height) = MediaQuery.sizeOf(context);
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: width * _pointZeroThreePercent,
        vertical: height * _pointZeroTwoPercent,
      ),
      width: width * _pointFourTwoPercent,
      height: height * _pointOneOnePercent,
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(
          _borderRadius,
        ),
      ),
      child: Column(
        children: [
          Expanded(
            flex: _flexTwo,
            child: Align(
              alignment: Alignment.centerLeft,
              child: Text(
                '$stockType Stock',
                style: GoogleFonts.roboto(
                  fontSize: 16,
                  color: AppColors.whiteColor,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          Expanded(
            flex: _flexOne,
            child: Align(
              alignment: Alignment.topLeft,
              child: Text(
                '$units unit',
                style: GoogleFonts.roboto(
                  fontSize: 13,
                  color: AppColors.whiteColor,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
