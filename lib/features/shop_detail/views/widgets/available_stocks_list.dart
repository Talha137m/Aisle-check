import 'package:aislecheck/features/shop_detail/views/widgets/available_stock_item.dart';
import 'package:flutter/material.dart';

import '../../models/available_stock_model.dart';

class AvailableStocksList extends StatelessWidget {
  const AvailableStocksList({super.key, required this.stockItems});
  final List<StockModel> stockItems;

  //...CONSTANTS VALUES
  static const _padding = 0.04;
  static const _height = 0.3;
  @override
  Widget build(BuildContext context) {
    final Size(:width, :height) = MediaQuery.sizeOf(context);
    return SizedBox(
      width: width,
      height: height * _height,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: stockItems.length,
        itemBuilder: (context, index) => Padding(
          padding: EdgeInsets.only(left: width * _padding),
          child: AvailableStockItem(
            stockItem: stockItems[index],
          ),
        ),
      ),
    );
  }
}
