import 'package:aislecheck/core/common/widgets/app_compat_btn.dart';
import 'package:aislecheck/core/common/widgets/global_app_bar.dart';
import 'package:aislecheck/features/ad_payment/views/ad_payment_page.dart';
import 'package:aislecheck/features/boost_products/views/widgets/select_product.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class BoostStorePage extends StatelessWidget {
  const BoostStorePage({super.key});
  static const name = '/boostStorepage';

  String get _heading => 'Boost your store :';

  String get _description =>
      'Make your store stand out by appearing at the top of search results. Attract more customers with just one click!';

  String get _duration => 'Set Duration :';
  static const _oneFlex = 1;
  static const _fiveFlex = 5;
  static const _twentyFlex = 20;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: GlobalAppBar(titleText: 'Ads'),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Spacer(
              flex: _oneFlex,
            ),
            Text(
              _heading,
              style: GoogleFonts.roboto(
                fontWeight: FontWeight.w700,
                fontSize: 20,
              ),
            ),
            const Spacer(
              flex: _oneFlex,
            ),
            Text(
              _description,
              style: GoogleFonts.roboto(
                fontWeight: FontWeight.w400,
                fontSize: 12,
              ),
            ),
            const Spacer(
              flex: _oneFlex,
            ),
            const Spacer(
              flex: _oneFlex,
            ),
            Text(
              _duration,
              style: GoogleFonts.roboto(
                fontWeight: FontWeight.w600,
                fontSize: 16,
              ),
            ),
            const Spacer(
              flex: _oneFlex,
            ),
            const SelectProducts(title: '24 hours  for \$10'),
            const Spacer(
              flex: _oneFlex,
            ),
            const SelectProducts(title: '3 Days  for \$25'),
            const Spacer(
              flex: _oneFlex,
            ),
            const SelectProducts(title: '7 Days  for \$50'),
            const Spacer(
              flex: _twentyFlex,
            ),
            AppCompactBtn(
              btnName: 'Boost Now',
              onTap: () {
                Navigator.pushNamed(context, AdPaymentPage.pageName);
              },
            ),
            const Spacer(
              flex: _fiveFlex,
            ),
          ],
        ),
      ),
    );
  }
}
