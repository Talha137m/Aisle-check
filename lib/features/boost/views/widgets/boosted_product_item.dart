import 'package:aislecheck/core/constants/strings/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class BoostedProductItem extends StatelessWidget {
  final String imgPath, productName, productPrice;
  const BoostedProductItem(
      {super.key,
      required this.imgPath,
      required this.productName,
      required this.productPrice});
  static const _iamgeFlex = 3;
  static const double _paddingValue = 5;
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          flex: _iamgeFlex,
          child: Card(
            color: AppColors.whiteColor,
            child: Padding(
              padding: const EdgeInsets.all(_paddingValue),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Image.asset(
                  imgPath,
                  fit: BoxFit.fill,
                ),
              ),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: _paddingValue),
          child: Text(
            productName,
            style:
                GoogleFonts.roboto(fontWeight: FontWeight.w500, fontSize: 13),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: _paddingValue),
          child: Text(
            productPrice,
            style:
                GoogleFonts.roboto(fontWeight: FontWeight.w700, fontSize: 17),
          ),
        ),
      ],
    );
  }
}
