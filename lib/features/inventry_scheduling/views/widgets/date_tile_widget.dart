import 'package:aislecheck/core/constants/strings/app_colors.dart';
import 'package:aislecheck/features/inventry_scheduling/controllers/from_date_controller.dart';
import 'package:aislecheck/features/inventry_scheduling/controllers/to_date_controller.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class DateTile extends StatelessWidget {
  const DateTile({
    super.key,
  });
  static const int _fiveFlexValue = 5;
  static const int _twoFlexValue = 2;
  static const double _padding = 15;
  static const double _borderRadius = 10;
  static const double _fontSize = 13;
  @override
  Widget build(BuildContext context) {
    var fromDateState = context.watch<FromDateController>();
    var toDate = context.watch<ToDateController>();
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Expanded(
          flex: 5,
          child: GestureDetector(
            onTap: () {
              context.read<FromDateController>().getFromDate();
            },
            child: Container(
              padding: const EdgeInsets.all(_padding),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(_borderRadius),
                color: AppColors.lightGreenColor,
              ),
              child: Row(
                children: [
                  const Spacer(),
                  const Icon(Icons.date_range),
                  const Spacer(),
                  Text(
                    fromDateState.fromDate,
                    style: GoogleFonts.roboto(
                        fontSize: _fontSize, fontWeight: FontWeight.w500),
                  ),
                  const Spacer(),
                ],
              ),
            ),
          ),
        ),
        const Spacer(
          flex: _twoFlexValue,
        ),
        Expanded(
          flex: _fiveFlexValue,
          child: GestureDetector(
            onTap: () {
              context.read<ToDateController>().getTodate();
            },
            child: Container(
              padding: const EdgeInsets.all(_padding),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(_borderRadius),
                color: AppColors.lightGreenColor,
              ),
              child: Row(
                children: [
                  const Spacer(),
                  const Icon(Icons.date_range),
                  const Spacer(),
                  Text(
                    toDate.toDate,
                    style: GoogleFonts.roboto(
                        fontSize: _fontSize, fontWeight: FontWeight.w500),
                  ),
                  const Spacer(),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
