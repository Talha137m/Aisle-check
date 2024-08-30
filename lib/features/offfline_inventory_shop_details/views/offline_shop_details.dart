import 'package:aislecheck/core/common/widgets/app_compat_btn.dart';
import 'package:aislecheck/core/common/widgets/global_app_bar.dart';
import 'package:aislecheck/core/common/widgets/global_serach_item.dart';
import 'package:aislecheck/core/common/widgets/text_field_widget.dart';
import 'package:aislecheck/core/constants/dummy_data.dart';
import 'package:aislecheck/core/extensions/pop_up_messages.dart';
import 'package:aislecheck/features/admin_home/models/stock_model.dart';
import 'package:aislecheck/features/offfline_inventory_shop_details/views/widgets/offline_shop_detail_widgets.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../core/constants/strings/app_colors.dart';

import '../../admin_home/views/widgets/available_stocks_list.dart';
import '../../shop_detail/views/widgets/shop_detail_widgets.dart';

class OfflineShopDetailsPage extends StatelessWidget {
  const OfflineShopDetailsPage({super.key});
  //....PAGE NAME
  static const pageName = '/offline_shop_details_page';
  //.....CONSTANT VALUES
  static const _title = 'Ads';
  static const _shopName = 'Shop name';
  static const _avalableHeading = 'Available Stock';
  static const _pointZeroOnePercent = 0.01;
  static const _pointZeroTwoPercent = 0.02;
  static const _pointZeroTwoFivePercent = 0.025;
  static const _pointZeroFivePercent = 0.05;
  static const _fontSizeFifteen = 15.0;
  static const _fontSizeTwenty = 20.0;
  @override
  Widget build(BuildContext context) {
    final Size(:width, :height) = MediaQuery.sizeOf(context);
    return Scaffold(
      appBar: GlobalAppBar(
        titleText: _title,
        bottomWidget: const GlobalSearchItem(),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: width * _pointZeroFivePercent,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: height * _pointZeroTwoPercent,
              ),
              //...IMAGE
              const ShopImageWidget(),
              SizedBox(
                height: height * _pointZeroTwoFivePercent,
              ),
              //..........SHOP NAME
              Text(
                _shopName,
                style: GoogleFonts.roboto(
                  fontSize: _fontSizeTwenty,
                  fontWeight: FontWeight.w600,
                ),
              ),
              SizedBox(
                height: height * _pointZeroOnePercent,
              ),
              const ShopLocationText(
                  shopLocation:
                      'Lorem ispum is simply a dummy text of theesetting'),
              SizedBox(
                height: height * _pointZeroTwoFivePercent,
              ),
              Text(
                _avalableHeading,
                style: GoogleFonts.roboto(
                  fontSize: _fontSizeFifteen,
                  fontWeight: FontWeight.w700,
                  color: AppColors.blackColor,
                ),
              ),
              SizedBox(
                height: height * _pointZeroTwoPercent,
              ),
              const OfflineStocksList(
                  products: AppDummyData.availableStockItems),
            ],
          ),
        ),
      ),
    );
  }
}

class OfflineStocksList extends StatelessWidget {
  const OfflineStocksList({super.key, required this.products});
  final List<AvailableStockModel> products;
  //...CONSTANT VALUES
  static const _padding = 0.02;
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: products.length,
      itemBuilder: (context, index) => Padding(
        padding: EdgeInsets.only(
          bottom: MediaQuery.sizeOf(context).height * _padding,
        ),
        child: AdminAvailableStockItem(
          editTab: () {
            context.addItemDialog(
              child: const EditStockDialog(),
            );
          },
          product: products[index],
        ),
      ),
    );
  }
}

//...ADD ITEM DIALOG
class EditStockDialog extends StatelessWidget {
  const EditStockDialog({super.key});
  //.....CONSTANT VALUES
  static const _addItems = 'Stock Update';
  static const _firstFieldHint = 'Product Name';
  static const _secondFieldHint = 'Quantity';

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
