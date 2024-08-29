import 'dart:developer';

import 'package:aislecheck/core/common/widgets/app_compat_btn.dart';
import 'package:aislecheck/core/common/widgets/global_serach_item.dart';
import 'package:aislecheck/core/constants/dummy_data.dart';
import 'package:aislecheck/core/extensions/pop_up_messages.dart';
import 'package:aislecheck/features/add_inventory/views/add_inventory_page.dart';
import 'package:aislecheck/features/ads/views/widgets/ads_list.dart';
import 'package:aislecheck/features/create_new_ads/views/create_ads_page.dart';
import 'package:aislecheck/features/user_home/views/home_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import '../../../core/constants/strings/app_colors.dart';

class AdsWidget extends StatelessWidget {
  const AdsWidget({super.key});
  //....PAGE NAME
  static const pageName = '/ads_page';
  //.....CONTANT VALUES
  static const _category = 'All Ads';
  static const _subCategory = 'Create new add';
  static const _pointZeroTwoPercent = 0.02;
  static const _pointZeroFivePercent = 0.05;
  static const _btnRadius = 30.0;
  static const _btnHeight = 0.07;
  static const _storeBtn = 'Boost store';
  static const _productBtn = 'Boost product';

  @override
  Widget build(BuildContext context) {
    final Size(:width, :height) = MediaQuery.sizeOf(context);
    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: width * _pointZeroFivePercent,
        ),
        child: Column(
          children: [
            SizedBox(
              height: height * _pointZeroTwoPercent,
            ),
            CategoriWidget(
              subCategoryTab: () {
                Navigator.pushNamed(context, CreateNewAdsPage.pageName);
              },
              category: _category,
              subCategory: _subCategory,
              textDecoration: TextDecoration.underline,
              subCategoryColor: AppColors.greenColor,
            ),
            SizedBox(
              height: height * _pointZeroTwoPercent,
            ),
            const AdsList(
              ads: AppDummyData.adsList,
            ),
            AppCompactBtn(
              onTap: () {
                context.showPopUpMsg('boost store');
              },
              btnHeight: _btnHeight,
              borderRadius: _btnRadius,
              btnName: _storeBtn,
              isTextBold: true,
            ),
            SizedBox(
              height: height * _pointZeroTwoPercent,
            ),
            AppCompactBtn(
              onTap: () {
                context.showPopUpMsg('boost product');
                //Navigator.pushNamed(context, CreateNewAdsPage.pageName);
              },
              btnHeight: _btnHeight,
              borderRadius: _btnRadius,
              btnName: _productBtn,
              isTextBold: true,
            ),
            SizedBox(
              height: height * _pointZeroTwoPercent,
            ),
          ],
        ),
      ),
    );
  }
}
