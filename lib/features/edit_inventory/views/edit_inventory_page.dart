import 'package:aislecheck/core/common/widgets/admin_lis_tile.dart';
import 'package:aislecheck/core/common/widgets/app_compat_btn.dart';
import 'package:aislecheck/core/common/widgets/customer_app_bar.dart';
import 'package:aislecheck/core/constants/images_path.dart';
import 'package:aislecheck/core/extensions/pop_up_messages.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../core/constants/strings/app_colors.dart';
import 'widgets/edit_inventory_detail_widgets.dart';

class EditInventoryPage extends StatelessWidget {
  const EditInventoryPage({super.key});
  //...PAGE NAME
  static const pageName = '/edit_inventory_page';
  //.....CONTANT VALUES
  static const _pointZeroOnePercent = 0.01;
  static const _pointZeroTwoPercent = 0.02;
  static const _pointZeroTwoFivePercent = 0.025;
  static const _pointZeroFivePercent = 0.05;
  static const _pointTwoFivePercent = 0.25;
  static const _imageBorderRadius = 10.0;
  static const _fontSize = 13.0;
  static const _btnRadius = 30.0;
  static const _btnHeight = 0.07;
  static const _btnText = 'Update';
  @override
  Widget build(BuildContext context) {
    final Size(:width, :height) = MediaQuery.sizeOf(context);
    return Scaffold(
      appBar: const CustomerAppBar(),
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

              //......PRODUCT IMAGE
              SizedBox(
                height: height * _pointTwoFivePercent,
                width: width,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(
                    _imageBorderRadius,
                  ),
                  child: Image.asset(
                    CustmoerImages.shop,
                    fit: BoxFit.fill,
                  ),
                ),
              ),
              SizedBox(
                height: height * _pointZeroTwoFivePercent,
              ),

              //......PRODUCT NAME
              const ProductNameAndEditRow(
                productName: 'Product name',
              ),
              SizedBox(
                height: height * _pointZeroOnePercent,
              ),

              //....... PRODUCT CATEGORY
              Text(
                'Category : Fragrances',
                style: GoogleFonts.roboto(
                  color: AppColors.grayColor,
                ),
              ),

              //............PRODUCT QAUNTITY
              Text(
                'Available Quantity : 100',
                style: GoogleFonts.roboto(
                  color: AppColors.grayColor,
                ),
              ),
              SizedBox(
                height: height * _pointZeroTwoPercent,
              ),

              //............ QAUNTITY LIST TILE
              CustomFilledListTile(
                leading: Text('Quantity',
                    style: GoogleFonts.roboto(
                      fontSize: _fontSize,
                      color: AppColors.blackColor,
                    )),
                trailing: SizedBox(
                  width: width * _pointTwoFivePercent,
                  child: const ListTileTrailingWidget(
                    quantity: '100',
                  ),
                ),
              ),
              SizedBox(
                height: height * _pointZeroOnePercent,
              ),

              //............PRICE PER ITEM LIST TILE
              CustomFilledListTile(
                leading: Text(
                  'Price per item',
                  style: GoogleFonts.roboto(
                    fontSize: _fontSize,
                    color: AppColors.blackColor,
                  ),
                ),
                trailing: SizedBox(
                  width: width * _pointTwoFivePercent,
                  child: const ListTileTrailingWidget(
                    quantity: '\$100',
                  ),
                ),
              ),
              SizedBox(
                height: height * _pointZeroTwoPercent,
              ),

              //....UPLAOD IMAGE TILE
              const UploadImageTile(),
              SizedBox(
                height: height * _pointZeroOnePercent,
              ),

              //.....UPDATE BUTTON
              AppCompactBtn(
                onTap: () {
                  context.showPopUpMsg('Item updated');
                  //showSnackBar(context, 'Item updated');
                },
                btnHeight: _btnHeight,
                borderRadius: _btnRadius,
                btnName: _btnText,
                isTextBold: true,
              ),

              SizedBox(
                height: height * _pointZeroFivePercent,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
