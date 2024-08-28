import 'package:aislecheck/core/common/widgets/app_compat_btn.dart';
import 'package:aislecheck/core/common/widgets/global_app_bar.dart';
import 'package:aislecheck/core/common/widgets/home_page_app_bar.dart';
import 'package:aislecheck/core/common/widgets/global_serach_item.dart';
import 'package:aislecheck/core/constants/dummy_data.dart';
import 'package:aislecheck/core/constants/strings/app_colors.dart';
import 'package:aislecheck/features/add_inventory/views/add_inventory_page.dart';
import 'package:aislecheck/features/admin_home/controllers/admin_bottom_behaviour.dart';
import 'package:aislecheck/features/admin_home/controllers/admin_bottom_controller.dart';
import 'package:aislecheck/features/admin_home/views/widgets/admin_home_widgets.dart';
import 'package:aislecheck/features/admin_home/views/widgets/available_stocks_list.dart';
import 'package:aislecheck/features/user_home/controllers/user_bottom_controller.dart';
import 'package:aislecheck/features/user_home/views/home_page.dart';
import 'package:aislecheck/features/user_home/views/widgets/animated_bottom_nav_widgets/animated_navigatioin_bar.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AdminHomePage extends StatelessWidget with AdminBottomBehaviour {
  AdminHomePage({super.key});
  //....PAGE NAME
  static const pageName = '/admin_home_page';
  @override
  Widget build(BuildContext context) {
    var state = context.watch<AdminBottomController>();
    return Scaffold(
      appBar: switch (state.currentIndex) {
        0 => const HomePageAppBar() as PreferredSizeWidget,
        2 => GlobalAppBar(
          titleText: 'Ads',
            leadingOnTab: () {
              context.read<UserBottomController>().changeState(0);
            },
            bottomWidget: const GlobalSearchItem(),
          ),
        _ => GlobalAppBar(
          titleText: 'Ads',
            leadingOnTab: () {
              context.read<UserBottomController>().changeState(0);
            },
          )
      },
      bottomNavigationBar: CurvedNavigationBar(
        index: state.currentIndex,
        backgroundColor: AppColors.bottomBgColor,
        items: const [
          Icon(Icons.inventory_rounded, color: AppColors.inActiveBottomColors),
          Icon(Icons.bar_chart, color: AppColors.inActiveBottomColors),
          Icon(Icons.trending_up, color: AppColors.inActiveBottomColors),
          Icon(Icons.person, color: AppColors.inActiveBottomColors),
        ],
        onTap: (value) {
          context.read<AdminBottomController>().changeState(value);
        },
      ),
      body: widgets[state.currentIndex],
    );
  }
}

class InventoryWidget extends StatelessWidget {
  const InventoryWidget({super.key});
  //CONSTAT VALUES
  static const _category = 'Available Stock';
  static const _pointZeroTwoPercent = 0.02;
  static const _pointZeroThreePercent = 0.03;
  static const _pointZeroFivePercent = 0.05;
  static const _borderRadius = 30.0;
  static const _btnHeight = 0.07;
  static const _btnText = 'Add Inventory';

  @override
  Widget build(BuildContext context) {
    final Size(:width, :height) = MediaQuery.sizeOf(context);
    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: width * _pointZeroFivePercent,
        ),
        child: Column(
          children: [
            SizedBox(
              height: height * _pointZeroTwoPercent,
            ),
            const GlobalSearchItem(),
            SizedBox(
              height: height * _pointZeroFivePercent,
            ),
            const StockContainersRow(),
            SizedBox(
              height: height * _pointZeroTwoPercent,
            ),
            AppCompactBtn(
              onTap: () {
                Navigator.pushNamed(context, AddInventoryPage.pageName);
              },
              borderRadius: _borderRadius,
              btnHeight: _btnHeight,
              btnName: _btnText,
              isTextBold: true,
            ),
            SizedBox(
              height: height * _pointZeroThreePercent,
            ),
            const CategoriWidget(
              category: _category,
            ),
            SizedBox(
              height: height * _pointZeroTwoPercent,
            ),
            const AdminAvailableStocksList(
                products: AppDummyData.availableStockItems),
          ],
        ),
      ),
    );
  }
}
