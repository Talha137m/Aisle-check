import 'package:aislecheck/core/constants/images_path.dart';
import 'package:aislecheck/features/shop_detail/views/widgets/show_location_button.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../core/constants/strings/app_colors.dart';

//....TOP IMAGE WIDGET
class ShopImageWidget extends StatelessWidget {
  const ShopImageWidget({super.key});
  //...CONSTANT VALUES
  static const _containerWidth = 0.9;
  static const _containerHeight = 0.3;
  static const _borderRadius = 20.0;
  @override
  Widget build(BuildContext context) {
    final Size(:width, :height) = MediaQuery.sizeOf(context);
    return Container(
      width: width * _containerWidth,
      height: height * _containerHeight,
      decoration: BoxDecoration(
        color: Colors.red,
        borderRadius: BorderRadius.circular(
          _borderRadius,
        ),
        image: const DecorationImage(
          fit: BoxFit.fill,
          image: AssetImage(
            CustmoerImages.shop,
          ),
        ),
      ),
    );
  }
}

//...SHOP DETAILS
class ShopDetails extends StatelessWidget {
  const ShopDetails(
      {super.key, required this.shopName, required this.distance});
  final String shopName, distance;
  //...CONSTANT VALUES
  static const _symmetricPadding = 0.065;
  static const _fontSize = 0.025;
  static const _spacing = 0.01;
  static const _oneFifteenPercent = 0.015;
  static const _oneThirdPercent = 0.03;
  @override
  Widget build(BuildContext context) {
    final Size(:width, :height) = MediaQuery.sizeOf(context);
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: width * _symmetricPadding),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                shopName,
                style: GoogleFonts.roboto(
                  fontWeight: FontWeight.w500,
                  fontSize: height * _fontSize,
                  color: AppColors.blackColor,
                ),
              ),
              Row(
                children: [
                  const Icon(
                    Icons.send,
                    color: Colors.green,
                  ),
                  SizedBox(
                    width: width * _spacing,
                  ),
                  Text(
                    distance,
                    style: GoogleFonts.roboto(
                      fontSize: height * _oneFifteenPercent,
                      color: Colors.grey,
                      fontWeight: FontWeight.w600,
                    ),
                  )
                ],
              )
            ],
          ),
          SizedBox(
            height: height * _spacing,
          ),
          Row(
            children: [
              Icon(
                Icons.map,
                size: height * _oneThirdPercent,
              ),
              SizedBox(
                width: width * _spacing,
              ),
              Expanded(
                child: Text(
                  'Lorem Ipsum is simply dummy text of theesetting',
                  style: GoogleFonts.roboto(fontSize: 11, color: Colors.grey),
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}

//....AVALABLE STOCK AND BUTTON
class AvailableStockRow extends StatelessWidget {
  const AvailableStockRow({super.key});
  //...CONSTANT VALUES
  static const _symmetricPadding = 0.065;
  static const _availableStock = 'Available Stock';
  static const _btnText = 'See All';
  static const _oneFifteenPercent = 0.02;
  @override
  Widget build(BuildContext context) {
    final Size(:width, :height) = MediaQuery.sizeOf(context);
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: width * _symmetricPadding,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            _availableStock,
            style: GoogleFonts.roboto(
              fontSize: height * _oneFifteenPercent,
              color: AppColors.blackColor,
              fontWeight: FontWeight.w600,
            ),
          ),
          TextButton(
            onPressed: () {},
            child: Text(
              _btnText,
              style: GoogleFonts.roboto(
                color: Colors.grey,
                fontSize: height * 0.018,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

//...MAP WIDGET
class ShowLocationOnMapWidget extends StatelessWidget {
  const ShowLocationOnMapWidget({super.key});
  //...CONSTANT VALUES
  static const _mapCotainerWidth = 0.9;
  static const _mapCotainerHeight = 0.15;
  static const _borderRadius = 10.0;
  @override
  Widget build(BuildContext context) {
    final Size(:width, :height) = MediaQuery.sizeOf(context);
    return Stack(
      alignment: Alignment.center,
      children: [
        SizedBox(
          width: width * _mapCotainerWidth,
          height: height * _mapCotainerHeight,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(_borderRadius),
            child: Image.asset(
              CustmoerImages.map,
              fit: BoxFit.fill,
            ),
          ),
        ),
        const ShowLocationOnMapButton(),
      ],
    );
  }
}

//...SHOP OWNER CARD
class ShopOwnerCard extends StatelessWidget {
  const ShopOwnerCard(
      {super.key, required this.ownerName, required this.ownerNumber});
  final String ownerName, ownerNumber;
  //...CONSTANT VALUES
  static const _containerWidth = 0.9;
  static const _containerHeight = 0.14;
  static const _borderRadius = 10.0;
  static const _blurRadius = 10.0;
  static const _spredRadius = 4.0;
  static const _shadowOffset = Offset(0, 3);
  static const _imageHeight = 0.1;
  static const _imageWidth = 0.18;
  static const _imageRadius = 8.0;
  static const _fontSize = 0.02;
  static const _contactFontSize = 0.018;
  static const _contactNumber = 'Contact Number';
  //CONSTANT FLEXE
  static const _flexOne = 1;
  static const _flexTwo = 2;
  static const _flexTen = 10;
  static const _flexThirty = 30;
  @override
  Widget build(BuildContext context) {
    final Size(:width, :height) = MediaQuery.sizeOf(context);
    return Container(
      width: width * _containerWidth,
      height: height * _containerHeight,
      decoration: BoxDecoration(
          color: AppColors.whiteColor,
          borderRadius: BorderRadius.circular(_borderRadius),
          boxShadow: const [
            BoxShadow(
              color: Colors.black26,
              blurRadius: _blurRadius,
              spreadRadius: _spredRadius,
              offset: _shadowOffset,
            ),
          ]),
      child: Row(
        children: [
          Expanded(
              flex: _flexTen,
              child: Align(
                alignment: Alignment.centerRight,
                child: SizedBox(
                  width: width * _imageWidth,
                  height: height * _imageHeight,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(_imageRadius),
                    child: Image.asset(
                      CustmoerImages.shop,
                      fit: BoxFit.fill,
                    ),
                  ),
                ),
              )),
          const Spacer(
            flex: _flexTwo,
          ),
          Expanded(
            flex: _flexThirty,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Spacer(
                  flex: _flexOne,
                ),
                Expanded(
                  flex: _flexTwo,
                  child: Align(
                    alignment: Alignment.bottomLeft,
                    child: Text(
                      ownerName,
                      style: GoogleFonts.roboto(
                          fontSize: height * _fontSize,
                          color: AppColors.blackColor,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
                Expanded(
                  flex: _flexTwo,
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      _contactNumber,
                      style: GoogleFonts.roboto(
                        fontSize: height * _contactFontSize,
                        color: Colors.grey,
                      ),
                    ),
                  ),
                ),
                Expanded(
                    flex: _flexTwo,
                    child: Align(
                      alignment: Alignment.topLeft,
                      child: Text(
                        ownerNumber,
                        style: GoogleFonts.roboto(
                            fontSize: height * _fontSize,
                            color: AppColors.blackColor,
                            fontWeight: FontWeight.bold),
                      ),
                    )),
                const Spacer(
                  flex: _flexOne,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

//....ADD REVIEW CONTINER
class AddReviewContainer extends StatelessWidget {
  const AddReviewContainer({super.key});
  //CONSTANT VALUES
  static const _containerWidth = 0.9;
  static const _containerHeight = 0.2;
  static const _fontSize = 0.018;
  static const _hintText = 'Write something here....';
  static const _addReview = 'Add Review';
  //....TEXT FIELD DECORATION
  static final _border = OutlineInputBorder(
    borderRadius: BorderRadius.circular(
      10.0,
    ),
    borderSide: const BorderSide(
      color: Colors.grey,
    ),
  );

  @override
  Widget build(BuildContext context) {
    final Size(:width, :height) = MediaQuery.sizeOf(context);
    return Stack(
      alignment: Alignment.bottomRight,
      children: [
        SizedBox(
          width: width * _containerWidth,
          height: height * _containerHeight,
          child: TextFormField(
            textAlign: TextAlign.start,
            textAlignVertical: TextAlignVertical.top,
            keyboardType: TextInputType.multiline,
            style: GoogleFonts.roboto(
              fontSize: height * _fontSize,
            ),
            expands: true,
            maxLines: null,
            decoration: InputDecoration(
              border: _border,
              enabledBorder: _border,
              focusedBorder: _border,
              hintText: _hintText,
              hintStyle: GoogleFonts.roboto(
                fontSize: height * _fontSize,
                color: Colors.grey,
              ),
            ),
          ),
        ),
        TextButton(
            onPressed: () {},
            child: Text(
              _addReview,
              style: GoogleFonts.roboto(
                fontSize: height * _fontSize,
                fontWeight: FontWeight.w700,
              ),
            ))
      ],
    );
  }
}

//....REVIEWS Row
class ReviewsRow extends StatelessWidget {
  const ReviewsRow(
      {super.key, required this.totalReviews, required this.overAllStars});
  final num totalReviews, overAllStars;
//...CONSTANT VALUES
  static const _symmetricPadding = 0.065;
  static const _reviewFontSize = 0.022;
  static const _valuesFontSize = 0.018;
  static const _reviewsText = 'Reviews';
  //...CONSTANT SIZES
  static const _flexOne = 1;
  static const _flexTwo = 2;
  static const _flexFour = 4;
  @override
  Widget build(BuildContext context) {
    final Size(:width, :height) = MediaQuery.sizeOf(context);
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: width * _symmetricPadding),
      child: Row(
        children: [
          Expanded(
            flex: 2,
            child: Text(
              _reviewsText,
              style: GoogleFonts.roboto(
                  fontSize: height * _reviewFontSize,
                  color: AppColors.blackColor,
                  fontWeight: FontWeight.bold),
            ),
          ),
          Expanded(
              flex: _flexOne,
              child: Text(
                '($totalReviews)',
                style: GoogleFonts.roboto(
                  fontSize: height * _valuesFontSize,
                  color: AppColors.blackColor,
                ),
              )),
          const Spacer(
            flex: _flexFour,
          ),
          Expanded(
              flex: _flexTwo,
              child: Align(
                alignment: Alignment.centerRight,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    const Icon(
                      Icons.star_rate_rounded,
                      color: AppColors.greenColor,
                    ),
                    Text(
                      '$overAllStars',
                      style: GoogleFonts.roboto(
                          fontSize: height * _valuesFontSize,
                          color: AppColors.blackColor,
                          fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ))
        ],
      ),
    );
  }
}
