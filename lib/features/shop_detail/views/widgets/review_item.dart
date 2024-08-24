import 'package:aislecheck/features/shop_detail/models/review_model.dart';
import 'package:custom_rating_bar/custom_rating_bar.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../core/constants/strings/app_colors.dart';

class ReviewItem extends StatelessWidget {
  const ReviewItem({super.key, required this.review});
  final ReviewModel review;
  //....CONSTANT VALUES
  static const _borderRadius = 20.0;
  static const _imageRadius = 0.045;
  static const _contentPadding = 0.02;
  static const _containerWidth = 0.9;
  static const _onePercent = 0.1;
  static const _starsSize = 0.02;
  static const _spacing = 0.02;
  //... CONSTANT FLEX
  static const _flex1 = 1;
  static const _flex2 = 2;
  static const _flex3 = 3;
  @override
  Widget build(BuildContext context) {
    final Size(:width, :height) = MediaQuery.sizeOf(context);
    return Center(
      child: Container(
        padding: EdgeInsets.all(height * _contentPadding),
        width: width * _containerWidth,
        decoration: BoxDecoration(
          border: Border.all(color: AppColors.grayColor),
          borderRadius: BorderRadius.circular(_borderRadius),
        ),
        child: Column(
          children: [
            SizedBox(
              height: height * _onePercent,
              child: Row(
                children: [
                  Expanded(
                      flex: _flex2,
                      child: CircleAvatar(
                        radius: height * _imageRadius,
                        backgroundImage: AssetImage(
                          review.image,
                        ),
                      )),
                  Expanded(
                      flex: _flex3,
                      child: Column(
                        children: [
                          Expanded(
                            flex: 1,
                            child: Align(
                              alignment: Alignment.bottomLeft,
                              child: Text(
                                review.name,
                                style: GoogleFonts.roboto(
                                  fontSize: height * 0.025,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                          Expanded(
                              flex: _flex1,
                              child: Align(
                                alignment: Alignment.topLeft,
                                child: FittedBox(
                                  child: Text(
                                    review.date,
                                  ),
                                ),
                              )),
                        ],
                      )),
                  Expanded(
                      flex: _flex2,
                      child: RatingBar.readOnly(
                        alignment: const Alignment(1.0, -0.5),
                        size: height * _starsSize,
                        filledIcon: Icons.star,
                        emptyColor: AppColors.greenColor,
                        emptyIcon: Icons.star_border,
                        filledColor: AppColors.greenColor,
                        direction: Axis.horizontal,
                        initialRating: review.totalStars,
                      )),
                ],
              ),
            ),
            SizedBox(
              height: height * _spacing,
            ),
            Text(
              review.reviewText,
            )
          ],
        ),
      ),
    );
  }
}
