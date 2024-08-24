import 'package:aislecheck/core/constants/dummy_data.dart';
import 'package:aislecheck/features/list_overview/views/list_overview_page.dart';
import 'package:aislecheck/features/shopping_list/views/widgets/shopping_lists.dart';
import 'package:flutter/material.dart';

import '../../../core/constants/strings/app_colors.dart';
import '../../user_home/views/home_page.dart';

class AllListsTab extends StatelessWidget {
  const AllListsTab({super.key});
  //...CONSTANT VALUES
  static const _allLists = 'All Lists';
  static const _subCategory = 'Add new list';
  static const _spacing = 0.03;
  @override
  Widget build(BuildContext context) {
    final Size(:width, :height) = MediaQuery.sizeOf(context);
    return GestureDetector(
      onTap: () {
        Navigator.of(context).pushNamed(ListOverveiwPage.pageName);
      },
      child: Column(
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
            child: ShoppingLists(
              shoppingLists: AppDummyData.shoppingLists,
            ),
          )
        ],
      ),
    );
  }
}
