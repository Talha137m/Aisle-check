import 'package:aislecheck/core/common/widgets/global_serach_item.dart';
import 'package:aislecheck/core/constants/strings/app_colors.dart';
import 'package:aislecheck/features/shopping_list/views/all_lists_tab_view.dart';
import 'package:aislecheck/features/shopping_list/views/schedule_products_tab_view.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';


class ShoppingListPage extends StatelessWidget {
  const ShoppingListPage({super.key});
  //....CONSTATNT VALUES
  static const _title = 'Ads';
  static const _firstTabText = 'All Lists';
  static const _secondTabText = 'Schedule';
  static const _tabsLength = 2;
  static const _toolBarHeight = 0.16;
  static const _flexibleSpace = 0.180;
  static const _indicatorPadding = 20.0;
  static const _fontSize = 0.018;
  static const _bottomPadding = 0.01;
  @override
  Widget build(BuildContext context) {
    final Size(:width, :height) = MediaQuery.sizeOf(context);
    return DefaultTabController(
      length: _tabsLength,
      child: Scaffold(
        appBar: AppBar(
          leading: IconButton(
            onPressed: () {
              //context.read<UserBottomController>().changeState(2);
            },
            icon: const Icon(
              Icons.arrow_back_ios_new,
            ),
          ),
          title: const Text(
            _title,
          ),
          centerTitle: true,
          toolbarHeight: height * _toolBarHeight,
          flexibleSpace: Center(
            child: SizedBox(
              height: height * _flexibleSpace,
              child: const Align(
                alignment: Alignment.bottomCenter,
                child: GlobalSearchItem(),
              ),
            ),
          ),
          bottom: TabBar(
            dividerColor: Colors.transparent,
            indicatorSize: TabBarIndicatorSize.tab,
            indicatorPadding: const EdgeInsets.symmetric(
              horizontal: _indicatorPadding,
            ),
            indicatorColor: AppColors.greenColor,
            labelColor: AppColors.blackColor,
            labelPadding: EdgeInsets.only(
              bottom: height * _bottomPadding,
            ),
            labelStyle: GoogleFonts.roboto(
              fontSize: height * _fontSize,
              fontWeight: FontWeight.w600,
            ),
            unselectedLabelColor: AppColors.grayColor,
            overlayColor: const WidgetStatePropertyAll(
              Colors.white,
            ),
            tabs: const [
              Text(
                _firstTabText,
              ),
              Text(
                _secondTabText,
              ),
            ],
          ),
        ),
        body: const TabBarView(
          children: [
            AllListsTab(),
            ScheduleProductsTab(),
          ],
        ),
      ),
    );
  }
}
