import 'dart:developer';

import 'package:aislecheck/core/common/widgets/app_compat_btn.dart';
import 'package:aislecheck/core/common/widgets/global_serach_item.dart';
import 'package:aislecheck/core/constants/dummy_data.dart';
import 'package:aislecheck/core/extensions/pop_up_messages.dart';
import 'package:aislecheck/features/add_inventory/views/add_inventory_page.dart';
import 'package:aislecheck/features/ads/views/widgets/ads_list.dart';
import 'package:aislecheck/features/comapign_data_form/views/compaign_data_form_page.dart';
import 'package:aislecheck/features/user_home/views/home_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import '../../../core/constants/strings/app_colors.dart';

class AdsWidget extends StatefulHookWidget {
  const AdsWidget({super.key});
  //....PAGE NAME
  static const pageName = '/ads_page';
  //.....CONTANT VALUES
  static const _category = 'All Ads';
  static const _subCategory = 'Create new add';
  static const _pointZeroTwoPercent = 0.02;
  static const _pointZeroFivePercent = 0.05;
  static const _pointZeroSevenPercent = 0.07;
  static const _pointOneFivePercent = 0.15;
  static const _pointTwoPercent = 0.2;
  static const _btnRadius = 30.0;
  static const _btnHeight = 0.07;
  static const _storeBtn = 'Boost store';
  static const _productBtn = 'Boost product';

  @override
  State<AdsWidget> createState() => _AdsWidgetState();
}

class _AdsWidgetState extends State<AdsWidget> {
  bool boostProduct = false;
  bool boostStore = false;
  @override
  Widget build(BuildContext context) {
    final Size(:width, :height) = MediaQuery.sizeOf(context);
    ScrollController scrollController = useScrollController();
    scrollController.addListener(
      () {
        log('${scrollController.position.pixels == height}');
        if (scrollController.position.pixels ==
            scrollController.position.maxScrollExtent) {
          setState(() {
            boostProduct = true;
            boostStore = true;
          });
        } else {
          setState(() {
            boostProduct = false;
            boostStore = false;
          });
        }
      },
    );

    return Stack(
      alignment: Alignment.bottomCenter,
      children: [
        SingleChildScrollView(
          controller: scrollController,
          child: Padding(
            padding: EdgeInsets.symmetric(
              horizontal: width * AdsWidget._pointZeroFivePercent,
            ),
            child: Column(
              children: [
                SizedBox(
                  height: height * AdsWidget._pointZeroTwoPercent,
                ),
                const CategoriWidget(
                  category: AdsWidget._category,
                  subCategory: AdsWidget._subCategory,
                  textDecoration: TextDecoration.underline,
                  subCategoryColor: AppColors.greenColor,
                ),
                SizedBox(
                  height: height * AdsWidget._pointZeroTwoPercent,
                ),
                const AdsList(
                  ads: AppDummyData.adsList,
                ),
                SizedBox(
                  height: height * AdsWidget._pointTwoPercent,
                ),
              ],
            ),
          ),
        ),
        Positioned(
          bottom: height * AdsWidget._pointOneFivePercent,
          child: Visibility(
            visible: boostStore,
            child: AppCompactBtn(
              onTap: () {
                context.showPopUpMsg('boost store');
              },
              btnHeight: AdsWidget._btnHeight,
              borderRadius: AdsWidget._btnRadius,
              btnName: AdsWidget._storeBtn,
              isTextBold: true,
            ),
          ),
        ),
        Positioned(
          bottom: height * AdsWidget._pointZeroSevenPercent,
          child: Visibility(
            visible: boostProduct,
            child: AppCompactBtn(
              onTap: () {
                Navigator.pushNamed(context, CompaignDataFormPage.pageName);
              },
              btnHeight: AdsWidget._btnHeight,
              borderRadius: AdsWidget._btnRadius,
              btnName: AdsWidget._productBtn,
              isTextBold: true,
            ),
          ),
        ),
      ],
    );
  }
}
