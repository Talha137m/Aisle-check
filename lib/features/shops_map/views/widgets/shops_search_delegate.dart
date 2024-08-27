import 'package:aislecheck/features/shops_map/models/dummy_shops_location.dart';
import 'package:aislecheck/features/shops_map/views/widgets/shop_search_widget.dart';
import 'package:flutter/material.dart';

class ShopSearchDelegate extends SearchDelegate {
  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(
        onPressed: () {
          query = '';
        },
        icon: const Icon(Icons.clear),
      ),
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
      icon: const Icon(Icons.arrow_back),
      onPressed: () => Navigator.of(context).pop(),
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    List<ShopsCenter> list = shopsCenters
        .where((item) => item.name.contains(query.toLowerCase()))
        .toList();
    return ShopSerachWidget(
      list: list,
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    List<ShopsCenter> list = shopsCenters
        .where((item) => item.name.contains(query.toLowerCase()))
        .toList();
    return ShopSerachWidget(
      list: list,
    );
  }
}
