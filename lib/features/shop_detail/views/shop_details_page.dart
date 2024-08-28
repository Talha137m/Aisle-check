import 'package:aislecheck/core/common/widgets/global_app_bar.dart';
import 'package:aislecheck/core/constants/dummy_data.dart';
import 'package:aislecheck/features/shop_detail/views/widgets/shop_detail_widgets.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../core/constants/strings/app_colors.dart';
import 'widgets/available_stocks_list.dart';
import 'widgets/reviews_list.dart';

class ShopDetailsPage extends StatelessWidget {
  const ShopDetailsPage({super.key});

  static const name = '/shopDetailsPage';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: GlobalAppBar(titleText: 'Ads',),
      body: const ShopDetailsDataWidget(
          shopName: 'Shop name',
          distance: '5 KMs',
          description:
              '''Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. ''',
          totalReviews: 269,
          overAllReviews: 4.9),
    );
  }
}

class ShopDetailsDataWidget extends StatelessWidget {
  const ShopDetailsDataWidget(
      {super.key,
      required this.shopName,
      required this.distance,
      required this.description,
      required this.totalReviews,
      required this.overAllReviews});
  final String shopName, distance, description;
  final num totalReviews, overAllReviews;

//................memory constants
  static const _descp = 'Description';
  static const _location = 'Location';
  static const _addReview = 'Add a Review';
  static const _oneOnePercent = 0.005;
  static const _oneTwoPercent = 0.02;
  static const _oneThirdPercent = 0.03;
  static const _oneFourthPercent = 0.04;
  static const _sixtyEightPercent = 0.68;
  static const _seventyFivePercent = 0.75;
  static const _oneFifteenPercent = 0.015;
  static const _eightyEightPercent = 0.88;
  @override
  Widget build(BuildContext context) {
    final Size(:width, :height) = MediaQuery.sizeOf(context);
    return Align(
      alignment: Alignment.topCenter,
      child: SingleChildScrollView(
        child: Column(
          children: [
            //...IMAGE
            const ShopImageWidget(),
            SizedBox(
              height: height * _oneThirdPercent,
            ),

            //..... NAME AND DISTANCE
            ShopDetails(
              distance: distance,
              shopName: shopName,
            ),
            SizedBox(
              height: height * _oneFourthPercent,
            ),

            //...DESCRIPTION HEADING
            Padding(
              padding: EdgeInsets.only(right: width * _sixtyEightPercent),
              child: Text(
                _descp,
                style: GoogleFonts.roboto(
                  fontSize: height * _oneTwoPercent,
                  fontWeight: FontWeight.w600,
                  color: AppColors.blackColor,
                ),
              ),
            ),

            SizedBox(
              height: height * _oneTwoPercent,
            ),

            //.... SHOP DESCRIPTION
            SizedBox(
              width: width * _eightyEightPercent,
              child: Text(
                description,
                style: GoogleFonts.roboto(
                  fontSize: height * _oneFifteenPercent,
                  color: Colors.grey,
                ),
              ),
            ),
            SizedBox(
              height: height * _oneOnePercent,
            ),

            //...........STOCK ROW
            const AvailableStockRow(),
            SizedBox(
              height: height * _oneOnePercent,
            ),

            //.....................STOCKS LIST
            const AvailableStocksList(
              stockItems: AppDummyData.stockItems,
            ),
            SizedBox(
              height: height * _oneTwoPercent,
            ),
            //...LOCATION HEADING
            Padding(
              padding: EdgeInsets.only(right: width * _seventyFivePercent),
              child: Text(
                _location,
                style: GoogleFonts.roboto(
                  fontSize: height * _oneTwoPercent,
                  fontWeight: FontWeight.w600,
                  color: AppColors.blackColor,
                ),
              ),
            ),
            SizedBox(
              height: height * _oneTwoPercent,
            ),

            //..........LOCATION WIDGET
            const ShowLocationOnMapWidget(),

            SizedBox(
              height: height * _oneFourthPercent,
            ),

            //................OWNERS CARD
            const ShopOwnerCard(
              ownerName: 'Shop owner name',
              ownerNumber: '+90 308-0011846',
            ),
            SizedBox(
              height: height * _oneFourthPercent,
            ),
            //.............. ADD REVIEW HEADING
            Padding(
              padding: EdgeInsets.only(
                right: width * _sixtyEightPercent,
              ),
              child: Text(
                _addReview,
                style: GoogleFonts.roboto(
                  fontSize: height * _oneTwoPercent,
                  fontWeight: FontWeight.w600,
                  color: AppColors.blackColor,
                ),
              ),
            ),
            SizedBox(
              height: height * _oneTwoPercent,
            ),
            const AddReviewContainer(),
            SizedBox(
              height: height * _oneThirdPercent,
            ),

            //....REVIEWS
            ReviewsRow(
              totalReviews: totalReviews,
              overAllStars: overAllReviews,
            ),

            //...REVIEWS LIST
            const ReviewsList(reviews: AppDummyData.reviews),

            SizedBox(
              height: height * _oneThirdPercent,
            ),
          ],
        ),
      ),
    );
  }
}
