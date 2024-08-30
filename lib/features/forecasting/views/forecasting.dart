import 'package:aislecheck/core/constants/dummy_data.dart';
import 'package:aislecheck/core/constants/strings/app_colors.dart';
import 'package:aislecheck/features/forecasting/views/widgets/forecasted_products_widget.dart';
import 'package:aislecheck/features/forecasting/views/widgets/forecasting_header.dart';
import 'package:aislecheck/features/forecasting/views/widgets/stats_selection.dart';

import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Forecasting extends StatelessWidget {
  const Forecasting({super.key});
  static const double _horizontalPaddingValue = 10;
  static const double _spaceBetween = 0.03;
  static const double _pointTwoSpace = 0.02;
  static const double _threeFiveValue = 0.35;
  static const double _minValue = 0;
  static const double _maxHorizontalValue = 7;
  static const double _maxVerticalValue = 100;
  static const String _forecastedProductsHeading = 'Forecasted products';
  @override
  Widget build(BuildContext context) {
    final Size(:width, :height) = MediaQuery.sizeOf(context);
    return SingleChildScrollView(
      child: Padding(
        padding:
            const EdgeInsets.symmetric(horizontal: _horizontalPaddingValue),
        child: Column(
          children: [
            SizedBox(
              height: height * _spaceBetween,
            ),
            const ForecastingHearder(),
            SizedBox(
              height: height * _spaceBetween,
            ),
            SizedBox(
              width: width,
              height: height * _threeFiveValue,
              child: LineChart(
                LineChartData(
                  gridData: const FlGridData(
                    show: true,
                    drawVerticalLine: true,
                  ),
                  titlesData: FlTitlesData(
                    leftTitles: AxisTitles(
                      sideTitles: SideTitles(
                          reservedSize: 30,
                          showTitles: true,
                          getTitlesWidget: _leftTitleWidgets),
                    ),
                    topTitles: const AxisTitles(
                      sideTitles: SideTitles(showTitles: false),
                    ),
                    rightTitles: const AxisTitles(
                      sideTitles: SideTitles(showTitles: false),
                    ),
                    bottomTitles: AxisTitles(
                      sideTitles: SideTitles(
                          showTitles: true,
                          getTitlesWidget: _bottomTitleWidgets),
                    ),
                  ),
                  borderData: FlBorderData(
                    show: true,
                    border: Border.all(color: AppColors.transParentColor),
                  ),
                  minX: _minValue,
                  maxX: _maxHorizontalValue,
                  minY: _minValue,
                  maxY: _maxVerticalValue,
                  lineBarsData: [
                    LineChartBarData(
                      spots: AppDummyData.topForecastingModel
                          .map(
                            (e) => FlSpot(e.whichDay, e.value),
                          )
                          .toList(),
                      isCurved: true,
                      color: Colors.green,
                      barWidth: 3,
                      belowBarData: BarAreaData(
                        show: true,
                        color: Colors.green.withOpacity(0.1),
                      ),
                      dotData: const FlDotData(show: true),
                    ),
                    LineChartBarData(
                      spots: AppDummyData.lowerForecastingModel
                          .map(
                            (e) => FlSpot(e.whichDay, e.value),
                          )
                          .toList(),
                      isCurved: true,
                      color: AppColors.grayColor,
                      barWidth: 1,
                      belowBarData: BarAreaData(
                        show: true,
                        color: Colors.grey.withOpacity(0.1),
                      ),
                      dotData: const FlDotData(show: false),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: height * _pointTwoSpace,
            ),
            const StatsSelection(),
            SizedBox(
              height: height * _pointTwoSpace,
            ),
            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                _forecastedProductsHeading,
                style: GoogleFonts.roboto(
                    fontSize: 16, fontWeight: FontWeight.w500),
              ),
            ),
            SizedBox(
              height: height * _pointTwoSpace,
            ),
            const ForecastedProductsWidget(
              products: AppDummyData.availableStockItems,
            ),
            SizedBox(
              height: height * _pointTwoSpace,
            ),
          ],
        ),
      ),
    );
  }

  //.........create the lefttile widget
  Widget _leftTitleWidgets(double value, TitleMeta meta) {
    TextStyle style = GoogleFonts.roboto(
      fontSize: 12,
      fontWeight: FontWeight.w400,
    );
    String text;
    switch (value.toInt()) {
      case 0:
        text = '0';
        break;
      case 10:
        text = '10';
        break;
      case 20:
        text = '20';
        break;
      case 30:
        text = '30';
      case 40:
        text = '40';
      case 50:
        text = '50';
      case 60:
        text = '60';
      case 70:
        text = '70';
      case 80:
        text = '80';
      case 90:
        text = '90';
      case 100:
        text = '100';
      default:
        return const SizedBox.shrink();
    }

    return Text(text, style: style, textAlign: TextAlign.center);
  }

  //....create the bottom title widget
  Widget _bottomTitleWidgets(double value, TitleMeta meta) {
    TextStyle style =
        GoogleFonts.roboto(fontSize: 12, fontWeight: FontWeight.w400);
    Widget text;
    switch (value.toInt()) {
      case 0:
        text = Text('MON', style: style);
        break;
      case 1:
        text = Text('TUE', style: style);
        break;
      case 2:
        text = Text('WED', style: style);
        break;
      case 3:
        text = Text('THU', style: style);
        break;
      case 4:
        text = Text('FRI', style: style);
        break;
      case 5:
        text = Text('SAT', style: style);
        break;
      case 6:
        text = Text('SUN', style: style);
        break;

      default:
        text = Text('', style: style);
        break;
    }

    return SideTitleWidget(
      axisSide: meta.axisSide,
      child: text,
    );
  }
}
