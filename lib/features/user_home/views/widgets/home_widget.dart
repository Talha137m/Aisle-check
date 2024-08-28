import 'dart:developer';

import 'package:aislecheck/core/common/widgets/global_serach_item.dart';
import 'package:aislecheck/core/constants/images_path.dart';
import 'package:aislecheck/core/constants/strings/app_colors.dart';
import 'package:aislecheck/features/shop_detail/views/shop_details_page.dart';
import 'package:aislecheck/features/user_home/views/home_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_carousel_widget/flutter_carousel_widget.dart';

class HomeWidget extends StatelessWidget {
  const HomeWidget({super.key});
  static const _h03 = 0.03;
  static const _h01 = 0.01;
  static const _h08 = 0.08;
  static const _h25 = 0.25;
  static const _h30 = 0.3;
  @override
  Widget build(BuildContext context) {
    final Size(:width, :height) = MediaQuery.sizeOf(context);
    return SingleChildScrollView(
      child: Column(
        children: [
          SizedBox(
            height: height * _h03,
          ),
          const GlobalSearchItem(),
          SizedBox(
            height: height * _h03,
          ),
          const CategoriWidget(
            category: 'All Categories',
          ),
          SizedBox(
            height: height * _h01,
          ),
          SizedBox(
            height: height * _h08,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                return const AllCategoriesWidget(
                    imgPath: CustmoerImages.beautyImg, category: 'Beauty');
              },
            ),
          ),
          SizedBox(
            height: height * _h30,
            child: FlutterCarousel.builder(
              itemCount: 3,
              itemBuilder: (context, index, realIndex) {
                return EnlargeCenterPage(
                  height: height,
                  width: width,
                  howMuchDiscount: '50 % OFF',
                  imgPath: CustmoerImages.item,
                  offerName: 'Flat',
                  productName: 'Sephora',
                  visitTab: () {
                    log('visist tsb');
                  },
                );
              },
              options: CarouselOptions(
                aspectRatio: 20 / 9,
                viewportFraction: 0.9,
                initialPage: 0,
                autoPlay: true,
                slideIndicator: const CircularSlideIndicator(
                  slideIndicatorOptions: SlideIndicatorOptions(
                      padding: EdgeInsets.all(8),
                      currentIndicatorColor: Colors.green,
                      indicatorBackgroundColor: AppColors.grayColor),
                ),
              ),
            ),
          ),
          SizedBox(
            height: height * _h01,
          ),
          const CategoriWidget(category: 'All Stores / Shopes'),
          SizedBox(
            height: height * _h01,
          ),
          SizedBox(
            height: height * _h25,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                return ShopsWidget(
                  goToShpsDetal: () {
                    Navigator.pushNamed(context, ShopDetailsPage.name);
                  },
                  width: width,
                  height: height,
                  imagPath: CustmoerImages.shop,
                  rating: '4.9',
                  shopDistance: '600m (4mins away)',
                  shopName: 'Office Depot',
                );
              },
            ),
          ),
          SizedBox(
            height: height * _h03,
          ),
          const CategoriWidget(category: 'Popular'),
          SizedBox(
            height: height * _h01,
          ),
          SizedBox(
            height: height * _h25,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                return ShopsWidget(
                  goToShpsDetal: () {
                    Navigator.pushNamed(context, ShopDetailsPage.name);
                  },
                  width: width,
                  height: height,
                  imagPath: CustmoerImages.shop,
                  rating: '4.9',
                  shopDistance: '600m (4mins away)',
                  shopName: 'Office Depot',
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
