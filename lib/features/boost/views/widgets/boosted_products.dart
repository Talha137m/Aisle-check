import 'package:aislecheck/core/constants/images_path.dart';
import 'package:aislecheck/features/boost/views/widgets/boosted_product_item.dart';
import 'package:flutter/material.dart';

class BoostedProducts extends StatelessWidget {
  const BoostedProducts({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      scrollDirection: Axis.horizontal,
      itemBuilder: (context, index) {
        return const BoostedProductItem(
            imgPath: CustmoerImages.shop,
            productName: 'Sephora',
            productPrice: '\$17.00');
      },
    );
  }
}
