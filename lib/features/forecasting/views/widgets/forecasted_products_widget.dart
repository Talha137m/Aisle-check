import 'package:aislecheck/features/admin_home/models/stock_model.dart';
import 'package:aislecheck/features/forecasting/views/widgets/forecasted_item.dart';
import 'package:flutter/material.dart';

class ForecastedProductsWidget extends StatelessWidget {
  const ForecastedProductsWidget({super.key, required this.products});
  final List<AvailableStockModel> products;
  //...CONSTANT VALUES
  static const _padding = 0.02;
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: products.length,
      itemBuilder: (context, index) {
        return Padding(
          padding: EdgeInsets.only(
            bottom: MediaQuery.sizeOf(context).height * _padding,
          ),
          child: ForeCastedItem(
            product: products[index],
            progressValue: 0.7,
          ),
        );
      },
    );
  }
}
