import 'package:aislecheck/core/constants/dummy_data.dart';
import 'package:aislecheck/features/shopping_list/views/widgets/scheduled_products_list.dart';
import 'package:flutter/material.dart';

import '../../../core/constants/strings/app_colors.dart';
import '../../user_home/views/home_page.dart';

class ScheduleProductsTab extends StatelessWidget {
  const ScheduleProductsTab({super.key});
  //...CONSTANT VALUES
  static const _allLists = 'Scheduled products';
  static const _subCategory = 'Route to Items';
  static const _spacing = 0.03;
  @override
  Widget build(BuildContext context) {
    final Size(:width, :height) = MediaQuery.sizeOf(context);
    return Column(
      children: [
        SizedBox(
          height: height * _spacing,
        ),
        const CategoriWidget(
          category: _allLists,
          subCategory: _subCategory,
          subCategoryColor: AppColors.greenColor,
          subCategoryFontweight: FontWeight.w700,
          textDecoration: TextDecoration.underline,
        ),
        SizedBox(
          height: height * _spacing,
        ),
        const Expanded(
          child: ScheduledProductsList(
            scheduledProducts: AppDummyData.scheduledProductsList,
          ),
        )
      ],
    );
  }
}
