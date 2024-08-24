import 'package:aislecheck/features/shop_detail/models/review_model.dart';
import 'package:aislecheck/features/shop_detail/views/widgets/review_item.dart';
import 'package:flutter/material.dart';

class ReviewsList extends StatelessWidget {
  const ReviewsList({super.key, required this.reviews});
  final List<ReviewModel> reviews;
  //...CONSTANTS VALUES
  static const _zeroPointZeroTwoPercent = 0.02;
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: reviews.length,
      itemBuilder: (context, index) => Padding(
        padding: EdgeInsets.only(
          top: MediaQuery.sizeOf(context).height * _zeroPointZeroTwoPercent,
        ),
        child: ReviewItem(
          review: reviews[index],
        ),
      ),
    );
  }
}
