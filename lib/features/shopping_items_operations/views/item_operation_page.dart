import 'package:aislecheck/core/common/widgets/global_app_bar.dart';
import 'package:aislecheck/core/common/widgets/global_serach_item.dart';
import 'package:aislecheck/core/common/widgets/text_field_widget.dart';
import 'package:aislecheck/core/common/widgets/app_compat_btn.dart';
import 'package:aislecheck/core/constants/dummy_data.dart';
import 'package:aislecheck/core/extensions/pop_up_messages.dart';
import 'package:aislecheck/features/schedule_item/views/schedule_item_page.dart';
import 'package:flutter/material.dart';

import '../../../core/constants/strings/app_colors.dart';

import '../../shopping_list/views/widgets/scheduled_products_list.dart';
import '../../user_home/views/home_page.dart';

class ShoppingItemOperationPage extends StatelessWidget {
  const ShoppingItemOperationPage({super.key, required this.listName});
  final String listName;
  //....PAGE NAME
  static const pageName = '/list_overview';
  //....CONSTANT VALUES
  static const _subCategory = 'Add new Item';
  static const _allItems = 'All Items';

  static const _spacing = 0.02;
  static const _itemsPadding = 0.01;
  static const _borderPadding = 0.05;
  @override
  Widget build(BuildContext context) {
    final Size(:width, :height) = MediaQuery.sizeOf(context);
    return Scaffold(
      appBar: GlobalAppBar(
        titleText: 'Ads',
        bottomWidget: const GlobalSearchItem(),
      ),
      body: Column(
        children: [
          SizedBox(
            height: height * _spacing,
          ),
          CategoriWidget(
            subCategoryTab: () {
              context.addItemDialog(child: const AddItemDialog());
            },
            category: listName,
            subCategory: _subCategory,
            subCategoryColor: AppColors.greenColor,
            subCategoryFontweight: FontWeight.w700,
            textDecoration: TextDecoration.underline,
          ),
          Expanded(
            child: SingleChildScrollView(
              child: Padding(
                padding:
                    EdgeInsets.symmetric(horizontal: width * _borderPadding),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: height * _spacing,
                    ),
                    const Text(
                      _allItems,
                      style: TextStyle(color: AppColors.grayColor),
                    ),
                    ListView.builder(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: AppDummyData.scheduledProductsList.length,
                      itemBuilder: (context, index) => Padding(
                        padding: EdgeInsets.only(
                          bottom: height * _itemsPadding,
                          top: height * _itemsPadding,
                        ),
                        child: InkWell(
                          onTap: () {
                            Navigator.pushNamed(
                                context, ScheduleItemPage.pageName);
                          },
                          child: ShoppingItem(
                            scheduledProduct:
                                AppDummyData.scheduledProductsList[index],
                            onDeleteIconTap: () {
                              context.showPopUpMsg('delete tab');
                            },
                            onEditIconTap: () {
                              context.addItemDialog(child: const AddItemDialog());
                            },
                          ),
                        ),
                      ),
                    ),
                    // SizedBox(
                    //   height: height * _itemBottomSpacing,
                    // ),
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}

//...ADD ITEM DIALOG
class AddItemDialog extends StatelessWidget {
  const AddItemDialog({super.key});
  //.....CONSTANT VALUES
  static const _addItems = 'Add items';
  static const _firstFieldHint = 'item name...';
  static const _secondFieldHint = 'Quantity';
  static const _thirdFieldHint = 'Price per unit';
  static const _btnText = 'Add';
  static const _containerWidth = 0.8;
  static const _containerHeight = 0.5;
  static const _borderRadius = 20.0;
  static const _borderPadding = 0.01;
  static const _btnWidth = 0.9;
  static const _btnRadius = 30.0;
  //.....CONSTANT FLEX SIZES
  static const _flexOne = 1;
  @override
  Widget build(BuildContext context) {
    final Size(:width, :height) = MediaQuery.sizeOf(context);
    return Center(
      child: Container(
        padding: EdgeInsets.all(height * _borderPadding),
        width: width * _containerWidth,
        height: height * _containerHeight,
        decoration: BoxDecoration(
          color: AppColors.whiteColor,
          borderRadius: BorderRadius.circular(
            _borderRadius,
          ),
        ),
        child: Column(
          children: [
            const Expanded(
              flex: _flexOne,
              child: Center(
                child: Text(
                  _addItems,
                  style: TextStyle(
                    color: AppColors.blackColor,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            Expanded(
              flex: _flexOne,
              child: AddItemTextField(
                  hintAndLabelText: _firstFieldHint,
                  keyboardType: TextInputType.text,
                  validator: (value) {
                    return null;
                  },
                  textEditingController: TextEditingController()),
            ),
            Expanded(
              flex: _flexOne,
              child: AddItemTextField(
                  hintAndLabelText: _secondFieldHint,
                  keyboardType: TextInputType.number,
                  validator: (value) {
                    return null;
                  },
                  textEditingController: TextEditingController()),
            ),
            Expanded(
              flex: _flexOne,
              child: AddItemTextField(
                hintAndLabelText: _thirdFieldHint,
                keyboardType: TextInputType.number,
                validator: (value) {
                  return null;
                },
                textEditingController: TextEditingController(),
              ),
            ),
            Expanded(
              flex: _flexOne,
              child: Center(
                child: AppCompactBtn(
                  onTap: () {
                    Navigator.of(context).pop();
                  },
                  btnWidth: _btnWidth,
                  borderRadius: _btnRadius,
                  btnName: _btnText,
                  isTextBold: true,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
