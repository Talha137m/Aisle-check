import 'package:aislecheck/core/constants/dummy_data.dart';
import 'package:aislecheck/features/wallet/views/widgets/wallet_detail_widgets.dart';
import 'package:flutter/material.dart';

class Wallet extends StatelessWidget {
  const Wallet({super.key});
  //....PAGE NAME
  static const pageName = '/wallet_page';
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const TotalBalanceText(),
          NotificationList(
            notifications: AppDummyData.notifications,
          ),
        ],
      ),
    );
  }
}
