import 'package:aislecheck/features/shops_geo_location/controllers/shops_location_controller.dart';
import 'package:aislecheck/features/shops_geo_location/models/dummy_shops_location.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ShopSerachWidget extends StatelessWidget {
  final List<ShopsCenter> list;
  const ShopSerachWidget({super.key, required this.list});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: list.length,
      itemBuilder: (context, index) {
        return InkWell(
          onTap: () {
            Navigator.pop(context);
          },
          child: InkWell(
            onTap: () {
              Navigator.of(context).pop();
              context.read<ShopsLocationController>().goToShopLocation(
                  list[index].latitude, list[index].longitude);
            },
            child: ListTile(
              title: Text(list[index].name),
              subtitle: Text(list[index].address),
            ),
          ),
        );
      },
    );
  }
}
