import 'package:aislecheck/core/common/functions/common_functions.dart';
import 'package:aislecheck/features/shopping_list/models/shopping_list_model.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../../core/constants/strings/app_colors.dart';

class ShoppingLists extends StatelessWidget {
  const ShoppingLists({super.key, required this.shoppingLists});
  final List<ShoppingListModel> shoppingLists;
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: shoppingLists.length,
      itemBuilder: (context, index) => Padding(
        padding:
            EdgeInsets.only(bottom: MediaQuery.sizeOf(context).height * 0.02),
        child: ShoppingListItem(
          shoppingList: shoppingLists[index],
          onAddBtnTap: () {
            showSnackBar(context, '$index');
          },
        ),
      ),
    );
  }
}

class ShoppingListItem extends StatelessWidget {
  const ShoppingListItem(
      {super.key, required this.shoppingList, required this.onAddBtnTap});
  final ShoppingListModel shoppingList;
  final VoidCallback onAddBtnTap;
  //......CONSTANT VALUES
  static const _contianerWidth = 0.9;
  static const _contianerHeight = 0.16;
  static const _borderRadius = 20.0;
  static const _borderPadding = 0.015;
  //...CONSTANT FLEX SIZES
  static const _flexOne = 1;
  static const _flexFour = 4;
  @override
  Widget build(BuildContext context) {
    final Size(:width, :height) = MediaQuery.sizeOf(context);
    return Center(
      child: Container(
        padding: EdgeInsets.all(height * _borderPadding),
        width: width * _contianerWidth,
        height: height * _contianerHeight,
        decoration: BoxDecoration(
            color: AppColors.lightGreenColor,
            border: Border.all(
              color: AppColors.greenColor,
            ),
            borderRadius: BorderRadius.circular(_borderRadius)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            //......LIST NAME AND ADD ITEM BUTTON
            Expanded(
              flex: _flexFour,
              child: Row(
                children: [
                  Expanded(
                    flex: _flexOne,
                    child: Text(
                      shoppingList.listName,
                      style: GoogleFonts.roboto(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Expanded(
                    flex: _flexOne,
                    child: Align(
                      alignment: Alignment.centerRight,
                      child: GestureDetector(
                        onTap: onAddBtnTap,
                        child: Icon(
                          size: height * 0.035,
                          Icons.add_circle_outline,
                          color: AppColors.greenColor,
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
            //......
            Expanded(
              flex: _flexFour,
              child: RichText(
                text: TextSpan(
                  style: GoogleFonts.roboto(
                    color: AppColors.grayColor,
                  ),
                  children: [
                    const TextSpan(
                      text: 'Total Items :',
                    ),
                    TextSpan(text: '${shoppingList.totalItems}')
                  ],
                ),
              ),
            ),
            Expanded(
              flex: _flexFour,
              child: RichText(
                text: TextSpan(
                  style: GoogleFonts.roboto(
                    color: AppColors.grayColor,
                  ),
                  children: [
                    const TextSpan(
                      text: 'Total Cost :\$',
                    ),
                    TextSpan(text: '${shoppingList.totalCost}')
                  ],
                ),
              ),
            ),
            Expanded(
              flex: _flexFour,
              child: Row(
                children: [
                  Expanded(
                    flex: 1,
                    child: Text(
                      'Progress :${shoppingList.progress}%',
                      style: GoogleFonts.roboto(
                        color: AppColors.greenColor,
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 1,
                    child: Align(
                      alignment: Alignment.centerRight,
                      child: Text(
                        'updated ${shoppingList.lastUpdated} ago',
                        style: GoogleFonts.roboto(
                          color: AppColors.grayColor,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
