import 'dart:developer';

import 'package:aislecheck/core/constants/images_path.dart';
import 'package:aislecheck/core/constants/strings/app_colors.dart';
import 'package:aislecheck/features/user_home/views/home_page.dart';
import 'package:aislecheck/core/common/widgets/serach.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:custom_rating_bar/custom_rating_bar.dart';

class Browse extends StatelessWidget {
  const Browse({super.key});
  static const _w5 = 0.5;
  static const _h03 = 0.03;
  static const double _fs16 = 16;
  @override
  Widget build(BuildContext context) {
    final Size(:width, :height) = MediaQuery.sizeOf(context);
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {},
          icon: const Icon(Icons.arrow_back_ios),
        ),
        actions: [
          Text(
            'Ads',
            style: GoogleFonts.roboto(
                fontWeight: FontWeight.w500,
                fontSize: _fs16,
                color: AppColors.blackColor),
          ),
          SizedBox(
            width: width * _w5,
          ),
        ],
      ),
      body: Column(
        children: [
          SizedBox(
            height: height * _h03,
          ),
          const Align(
            alignment: Alignment(0, 0),
            child: SearchWidget(),
          ),
          SizedBox(
            height: height * _h03,
          ),
          const CategoriWidget(
            category: 'Shop near you',
            subCategory: 'Find by Geolocation',
            subCategoryColor: AppColors.greenColor,
            subCategoryFontweight: FontWeight.w700,
            textDecoration: TextDecoration.underline,
          ),
          SizedBox(
            height: height * _h03,
          ),
          Expanded(
            child: ListView.builder(
              itemBuilder: (context, index) {
                return ShopDetailWidget(
                  findShopLocationTab: () {
                    log('go to the shop location');
                  },
                  imagesPath: CustmoerImages.shop,
                  shopAddress: 'Lorem Ipsum is simply dummy ',
                  shopDistance: '7.5 km away',
                  shopNme: 'Shop Name',
                  shopRating: 4,
                  width: width,
                  height: height,
                );
              },
            ),
          )
        ],
      ),
    );
  }
}

///
///create the class which is shop location btn
class ShopLocationBtn extends StatelessWidget {
  const ShopLocationBtn({super.key});

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

///create the class that contains the shop details
class ShopDetailWidget extends StatelessWidget {
  final double width, height;
  final String imagesPath;
  final String shopNme;
  final String shopAddress;
  final String shopDistance;
  final double shopRating;
  final VoidCallback findShopLocationTab;
  const ShopDetailWidget(
      {super.key,
      required this.width,
      required this.height,
      required this.imagesPath,
      required this.shopAddress,
      required this.shopDistance,
      required this.shopRating,
      required this.findShopLocationTab,
      required this.shopNme});
  static const _w9 = 0.9;
  static const _h2 = 0.2;
  static const _w02 = 0.02;
  static const _w03 = 0.03;
  static const _h15 = 0.15;
  static const _w3 = 0.3;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: SizedBox(
        width: width * _w9,
        height: height * _h2,
        child: Card(
          child: Row(
            children: [
              SizedBox(
                width: width * _w02,
              ),
              ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Image.asset(
                  imagesPath,
                  width: width * _w3,
                  height: height * _h15,
                  fit: BoxFit.fill,
                ),
              ),
              SizedBox(
                width: width * _w03,
              ),
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    //const Spacer(),
                    Expanded(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Expanded(
                            child: Text(
                              shopNme,
                              style: GoogleFonts.roboto(
                                  fontWeight: FontWeight.w700, fontSize: 16),
                              maxLines: 1,
                            ),
                          ),
                          Expanded(
                            child: RatingBar.readOnly(
                              size: 15,
                              filledColor: AppColors.greenColor,
                              filledIcon: Icons.star,
                              emptyIcon: Icons.star_border,
                              initialRating: shopRating,
                              maxRating: 5,
                            ),
                          )
                        ],
                      ),
                    ),
                    //const Spacer(),
                    Expanded(
                      child: Row(
                        children: [
                          const Icon(
                            Icons.location_on,
                            size: 15,
                          ),
                          Expanded(
                            child: Text(
                              shopAddress,
                              style: GoogleFonts.roboto(
                                  fontWeight: FontWeight.w400, fontSize: 12),
                              maxLines: 1,
                            ),
                          ),
                        ],
                      ),
                    ),
                    // const Spacer(),
                    Expanded(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Expanded(
                            child: Text(
                              shopDistance,
                              style: GoogleFonts.roboto(
                                  fontWeight: FontWeight.w400, fontSize: 16),
                              maxLines: 1,
                            ),
                          ),
                          GestureDetector(
                            onTap: findShopLocationTab,
                            child: const ShopLocationBtn(),
                          ),
                          //Spacer(),
                        ],
                      ),
                    ),
                    // const Spacer(),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
