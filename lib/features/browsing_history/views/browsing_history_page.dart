import 'dart:developer';

import 'package:aislecheck/core/common/widgets/serach.dart';
import 'package:aislecheck/core/constants/dummy_data.dart';
import 'package:aislecheck/core/constants/images_path.dart';
import 'package:aislecheck/features/shopping_list/views/widgets/shopping_lists.dart';
import 'package:aislecheck/features/user_home/views/home_page.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../core/constants/strings/app_colors.dart';

class BrowsingHistoryPage extends StatelessWidget {
  const BrowsingHistoryPage({super.key});
  static const name = '/browseHistrory';
  //...CONSTANT VALUES
  static const _title = 'Ads';
  static const _browseHistory = 'Browsing history';
  static const _borderPadding = 0.05;
  static const _pointZeroOnePercent = 0.01;
  static const _pointZeroTwoPercent = 0.02;
  static const _pointZeroThreePercent = 0.03;
  @override
  Widget build(BuildContext context) {
    final Size(:width, :height) = MediaQuery.sizeOf(context);
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(
            Icons.arrow_back_ios_new,
          ),
        ),
        title: const Text(
          _title,
        ),
        centerTitle: true,
        bottom: AppBar(
          automaticallyImplyLeading: false,
          flexibleSpace: const Center(
            child: SearchWidget(),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: width * _borderPadding),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: height * _pointZeroThreePercent,
              ),
              Text(
                _browseHistory,
                style: GoogleFonts.roboto(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(
                height: height * _pointZeroTwoPercent,
              ),
              const CategoriWidget(
                category: 'Recently viewed',
              ),
              SizedBox(
                height: height * _pointZeroOnePercent,
              ),
              SizedBox(
                height: height * 0.3,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    return ShopsWidget(
                      imagPath: CustmoerImages.shop,
                      rating: '4.9',
                      shopDistance: '600m (4mins away)',
                      shopName: 'Sephora',
                      goToShpsDetal: () {
                        log('go to the shop details');
                      },
                      padding: 0.0,
                      width: width,
                      height: height,
                    );
                  },
                ),
              ),
              SizedBox(
                height: height * _pointZeroThreePercent,
              ),
              Text(
                'Recent Lists',
                style: GoogleFonts.roboto(
                    fontSize: 15,
                    color: AppColors.blackColor,
                    fontWeight: FontWeight.w600),
              ),
              SizedBox(
                height: height * _pointZeroTwoPercent,
              ),
              SizedBox(
                height: height * 0.32,
                child: const ShoppingLists(
                  shrinkWrap: true,
                  //physics: NeverScrollableScrollPhysics(),
                  shoppingLists: AppDummyData.shoppingLists,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
