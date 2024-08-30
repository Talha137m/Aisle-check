import 'dart:developer';

import 'package:aislecheck/core/constants/enumration/enumrations.dart';
import 'package:aislecheck/core/constants/strings/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ForecastingHearder extends StatelessWidget {
  const ForecastingHearder({super.key});
  static const _title = 'Overview';
  static const double _fontSize = 18;
  static const double _dropDownWidth = 100;
  static const double _dropDownHeight = 40;
  static const double _dropDownPadding = 10;
  static const double _borderRadius = 30;
  static const double _borderWidth = 1;
  static const double _iconSize = 20;
  static const int _elevation = 16;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          _title,
          style: GoogleFonts.roboto(
              fontSize: _fontSize, fontWeight: FontWeight.w600),
        ),
        Container(
          width: _dropDownWidth,
          height: _dropDownHeight,
          padding: const EdgeInsets.symmetric(horizontal: _dropDownPadding),
          decoration: BoxDecoration(
            color: AppColors.transParentColor,
            borderRadius: BorderRadius.circular(_borderRadius),
            border: Border.all(width: _borderWidth, color: AppColors.grayColor),
          ),
          child: FittedBox(
            child: DropdownButton<String>(
              value: ForecastingFilter.weekly.name,
              style: const TextStyle(
                  color: AppColors.blackColor,
                  fontWeight: FontWeight.bold,
                  fontSize: _fontSize),
              underline: const SizedBox.shrink(),
              iconSize: _iconSize,
              elevation: _elevation,
              icon: const Icon(Icons.check, color: AppColors.grayColor),
              items: <String>[
                ForecastingFilter.weekly.name,
                ForecastingFilter.monthly.name,
                ForecastingFilter.daily.name
              ].map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(
                    value,
                    style: GoogleFonts.roboto(
                        fontSize: _fontSize, fontWeight: FontWeight.w400),
                  ),
                );
              }).toList(),
              onChanged: (value) {
                log(value.toString());
              },
            ),
          ),
        )
      ],
    );
  }
}
