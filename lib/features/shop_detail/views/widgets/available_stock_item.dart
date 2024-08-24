import 'package:aislecheck/core/constants/strings/app_colors.dart';
import 'package:aislecheck/features/shop_detail/models/available_stock_model.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AvailableStockItem extends StatelessWidget {
  const AvailableStockItem({super.key, required this.stockItem});
  final StockModel stockItem;
  //....DECORATIONS
  static const _borderRadius = 10.0;
  //...CONSTANT VALUES
  static const _oneOnePercent = 0.005;
  static const _onePercent = 0.2;
  static const _twoPercent = 0.35;
  static const _blurRadius = 5.0;
  static const _spreadRadius = 2.0;
  static const _shadowOffset = Offset(0, 3);
  static const _spacingBetweenImageAndText = 0.005;
  static const _fontSize = 0.015;
  static const _spacingBetweenNameAndReview = 0.12;
  static const _iconSize = 0.02;
  @override
  Widget build(BuildContext context) {
    final Size(:width, :height) = MediaQuery.sizeOf(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          padding: EdgeInsets.all(
            height * _oneOnePercent,
          ),
          width: width * _twoPercent,
          height: height * _onePercent,
          decoration: BoxDecoration(
              color: AppColors.whiteColor,
              borderRadius: BorderRadius.circular(_borderRadius),
              boxShadow: const [
                BoxShadow(
                  color: Colors.black12,
                  blurRadius: _blurRadius,
                  spreadRadius: _spreadRadius,
                  offset: _shadowOffset,
                )
              ]),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(
              _borderRadius,
            ),
            child: Image.asset(
              stockItem.image,
              fit: BoxFit.fill,
            ),
          ),
        ),
        SizedBox(
          height: height * _spacingBetweenImageAndText,
        ),
        Row(
          children: [
            Text(
              stockItem.name,
              style: GoogleFonts.roboto(
                fontSize: height * _fontSize,
              ),
            ),
            SizedBox(
              width: width * _spacingBetweenNameAndReview,
            ),
            Row(
              children: [
                Icon(
                  Icons.star,
                  color: AppColors.greenColor,
                  size: height * _iconSize,
                ),
                Text(
                  stockItem.reviews,
                  style: GoogleFonts.roboto(
                    fontSize: height * _fontSize,
                  ),
                ),
              ],
            )
          ],
        ),
        Text(
          '\$${stockItem.price}',
          style: GoogleFonts.roboto(
            color: AppColors.blackColor,
            fontWeight: FontWeight.w500,
          ),
        )
      ],
    );
  }
}
