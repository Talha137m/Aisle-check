import 'package:aislecheck/core/common/widgets/app_compat_btn.dart';
import 'package:aislecheck/core/common/widgets/global_app_bar.dart';
import 'package:aislecheck/core/common/widgets/global_serach_item.dart';
import 'package:aislecheck/features/boost/views/widgets/boosted_products.dart';
import 'package:aislecheck/features/boost_products/views/boost_product_page.dart';
import 'package:aislecheck/features/boost_store/views/boost_store_page.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class BoostPage extends StatelessWidget {
  const BoostPage({super.key});
  static const name = '/boostpage';

  static const String _heading = 'Boost Product or store :';
  static const String _subHeading = 'Boost Your Store Visibility!';

  static const String _descriptionFirst =
      'Make your store stand out by appearing at the top of search results. Attract more customers with just one click!';
  static const String _descriptionSecond =
      'Highlight your top products and increase sales by placing them first in customer searches.';

  static const _twoFlex = 2;
  static const _threeFlex = 3;
  static const _twentyFlex = 20;
  static const _fortyFlex = 40;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: GlobalAppBar(
        titleText: 'Ads',
        bottomWidget: const GlobalSearchItem(),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Spacer(
              flex: _twoFlex,
            ),
            Text(
              _heading,
              style:
                  GoogleFonts.roboto(fontWeight: FontWeight.w700, fontSize: 20),
            ),
            const Spacer(
              flex: _twoFlex,
            ),
            Text(
              _subHeading,
              style:
                  GoogleFonts.roboto(fontWeight: FontWeight.w700, fontSize: 15),
            ),
            const Spacer(
              flex: _twoFlex,
            ),
            Text(
              _descriptionFirst,
              style:
                  GoogleFonts.roboto(fontWeight: FontWeight.w400, fontSize: 12),
            ),
            const Spacer(
              flex: _twoFlex,
            ),
            Text(
              _descriptionSecond,
              style:
                  GoogleFonts.roboto(fontWeight: FontWeight.w400, fontSize: 12),
            ),
            const Spacer(
              flex: _twoFlex,
            ),
            AppCompactBtn(
              fontSize: 14,
              onTap: () {
                Navigator.of(context).pushNamed(BoostProductPage.name);
              },
              btnName: 'Boost store',
            ),
            const Spacer(
              flex: _threeFlex,
            ),
            AppCompactBtn(
              fontSize: 14,
              onTap: () {
                Navigator.of(context).pushNamed(BoostStorePage.name);
              },
              btnName: 'Boost product',
            ),
            const Spacer(
              flex: _twoFlex,
            ),
            Text(
              'Boosted products :',
              style:
                  GoogleFonts.roboto(fontSize: 15, fontWeight: FontWeight.w700),
            ),
            const Expanded(
              flex: _fortyFlex,
              child: BoostedProducts(),
            ),
            const Spacer(
              flex: _twentyFlex,
            ),
          ],
        ),
      ),
    );
  }
}
