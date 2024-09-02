import 'package:aislecheck/core/common/widgets/global_serach_item.dart';
import 'package:aislecheck/core/constants/images_path.dart';
import 'package:aislecheck/core/constants/strings/app_colors.dart';
import 'package:aislecheck/features/browse_shops/views/widgets/browse_shops_item.dart';
import 'package:aislecheck/features/shops_geo_location/views/shops_location.dart';
import 'package:aislecheck/features/user_home/views/home_page.dart';
import 'package:flutter/material.dart';

class Browse extends StatelessWidget {
  const Browse({super.key});
  static const _h03 = 0.03;
  @override
  Widget build(BuildContext context) {
    final Size(:width, :height) = MediaQuery.sizeOf(context);
    return Column(
      children: [
        SizedBox(
          height: height * _h03,
        ),
        const Align(
          alignment: Alignment(0, 0),
          child: GlobalSearchItem(),
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
              return BrowseShopItem(
                findShopLocationTab: () {
                  Navigator.pushNamed(context, ShopsGeoLocation.name);
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
    );
  }
}
