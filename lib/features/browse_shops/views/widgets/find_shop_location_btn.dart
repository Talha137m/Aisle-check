import 'package:aislecheck/core/constants/strings/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class FindShopLocationBtn extends StatelessWidget {
  const FindShopLocationBtn({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(3),
      decoration: BoxDecoration(
        color: AppColors.greenColor,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          const Icon(
            Icons.location_on,
            size: 14,
            color: AppColors.whiteColor,
          ),
          Text(
            'Shop location',
            style: GoogleFonts.roboto(fontSize: 8, fontWeight: FontWeight.w400),
          ),
          const CircleAvatar(
            radius: 15,
            backgroundColor: AppColors.whiteColor,
            child: Center(
              child: Icon(
                Icons.arrow_circle_right,
                size: 15,
                color: AppColors.greenColor,
              ),
            ),
          ),
        ],
      ),
    );
  }
}