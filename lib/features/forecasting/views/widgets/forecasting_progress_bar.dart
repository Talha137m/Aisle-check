import 'package:aislecheck/core/constants/strings/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ForecastingProgressBar extends StatelessWidget {
  final double value;
  const ForecastingProgressBar({super.key, required this.value});
  static const double _progressValue = 60;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Stack(
        alignment: Alignment.center,
        children: [
          Container(
            width: _progressValue,
            height: _progressValue,
            decoration: const BoxDecoration(shape: BoxShape.circle),
            child: CircularProgressIndicator(
              value: switch (value > 1) {
                true => null,
                false => value / 1.0
              }, // 50% progress
              strokeWidth: 5.0, // Thickness of the progress line
              valueColor: AlwaysStoppedAnimation<Color>(
                switch (value > 0.5) {
                  true => AppColors.greenColor,
                  false => AppColors.redColor
                },
              ), // Progress color
              backgroundColor:
                  Colors.grey.shade300, // Background color of the circle
            ),
          ),
          Text(
            "${value * 100.toInt()}%",
            style: GoogleFonts.roboto(
              fontSize: 14,
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    );
  }
}
