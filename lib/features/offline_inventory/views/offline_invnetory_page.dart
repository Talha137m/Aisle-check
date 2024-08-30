import 'package:aislecheck/core/common/widgets/global_app_bar.dart';
import 'package:aislecheck/core/common/widgets/global_serach_item.dart';
import 'package:aislecheck/core/constants/images_path.dart';
import 'package:aislecheck/features/offfline_inventory_shop_details/views/offline_shop_details.dart';
import 'package:aislecheck/features/user_home/views/home_page.dart';
import 'package:flutter/material.dart';

class OfflineInventoryPage extends StatelessWidget {
  const OfflineInventoryPage({super.key});
  //.....PAGE NAME
  static const pageName = '/offline_inventory_page';
  //.....CONSTANT VALUES
  static const _title = 'Ads';
  static const _category = 'All Stores / Shops';
  static const _pointZeroTwoFivePercent = 0.025;
  static const _pointZeroFivePercent = 0.05;
  static const _pointTwoPercent = 0.25;
  @override
  Widget build(BuildContext context) {
    final Size(:width, :height) = MediaQuery.sizeOf(context);
    return Scaffold(
      appBar: GlobalAppBar(
        titleText: _title,
        bottomWidget: const GlobalSearchItem(),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding:
              EdgeInsets.symmetric(horizontal: width * _pointZeroFivePercent),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: height * _pointZeroFivePercent,
              ),
              const CategoriWidget(
                category: _category,
              ),
              SizedBox(
                height: height * _pointZeroTwoFivePercent,
              ),
              SizedBox(
                height: height * _pointTwoPercent,
                child: ListView.builder(
                  itemCount: 20,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    return ShopsWidget(
                      rating: '4.9',
                      shopDistance: '600m (4mins away)',
                      shopName: 'Sephora',
                      imagPath: CustmoerImages.shop,
                      goToShpsDetal: () {
                        Navigator.pushNamed(
                            context, OfflineShopDetailsPage.pageName);
                      },
                      padding: 0.0,
                      width: width,
                      height: height,
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
