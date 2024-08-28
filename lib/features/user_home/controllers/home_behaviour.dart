import 'package:aislecheck/features/browse_shops/views/browse.dart';
import 'package:aislecheck/features/shopping_list/views/shopping_list_page.dart';

import 'package:aislecheck/features/user_home/views/widgets/home_widget.dart';
import 'package:aislecheck/features/user_profile/views/user_profile_page.dart';
import 'package:flutter/material.dart';

mixin HomeBehaviour {
  final List<Widget> bottomWidgets = const [
    Browse(),
    ShoppingListPage(),
    HomeWidget(),
    Center(
      child: Text('notification'),
    ),
    UserProfilePage()
  ];
}
