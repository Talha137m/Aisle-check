import 'package:aislecheck/features/shops_geo_location/views/shops_location.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../core/constants/strings/app_colors.dart';

class ShowLocationOnMapButton extends StatelessWidget {
  const ShowLocationOnMapButton({super.key});
  //...CONSTANTS VALUES
  static const _btnWidth = 0.35;
  static const _btnHeight = 0.05;
  static const _borderRadius = 5.0;
  @override
  Widget build(BuildContext context) {
    final Size(:width, :height) = MediaQuery.sizeOf(context);
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, ShopsGeoLocation.name);
      },
      child: Container(
        width: width * _btnWidth,
        height: height * _btnHeight,
        decoration: BoxDecoration(
          color: AppColors.greenColor,
          borderRadius: BorderRadius.circular(
            _borderRadius,
          ),
        ),
        child: Row(
          children: [
            SizedBox(
              width: width * 0.03,
            ),
            Icon(
              Icons.location_on_outlined,
              color: AppColors.whiteColor,
              size: height * 0.03,
            ),
            SizedBox(
              width: width * 0.03,
            ),
            Text(
              'Tap to View',
              style: GoogleFonts.roboto(
                  color: AppColors.whiteColor, fontSize: height * 0.015),
            )
          ],
        ),
      ),
    );
  }
}
