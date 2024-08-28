import 'package:aislecheck/features/account_management/views/account_management.dart';
import 'package:aislecheck/features/admin_home/views/admin_home_page.dart';
import 'package:aislecheck/features/ads/views/ads.dart';
import 'package:flutter/material.dart';

mixin AdminBottomBehaviour {
  final List<Widget> widgets = const [
    InventoryWidget(),
    Center(
      child: Text('Chart page'),
    ),
    AdsWidget(),
    AccountManagement()
  ];
}
