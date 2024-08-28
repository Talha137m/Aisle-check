import 'package:aislecheck/core/common/widgets/admin_lis_tile.dart';
import 'package:aislecheck/core/common/widgets/app_compat_btn.dart';
import 'package:aislecheck/core/common/widgets/global_app_bar.dart';
import 'package:aislecheck/core/common/widgets/text_field_widget.dart';
import 'package:aislecheck/core/extensions/pop_up_messages.dart';
import 'package:aislecheck/features/edit_inventory/views/widgets/edit_inventory_detail_widgets.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../core/constants/strings/app_colors.dart';

class AddInventoryPage extends StatelessWidget {
  const AddInventoryPage({super.key});
  //...PAGE NAME
  static const pageName = '/add_inventory_page';
  //.....CONTANT VALUES
  static const _pointZeroOnePercent = 0.01;
  static const _pointZeroTwoPercent = 0.02;
  static const _pointZeroFivePercent = 0.05;
  static const _pointTwoPercent = 0.2;
  static const _pointThreePercent = 0.3;
  static const _fontSize = 13.0;
  static const _btnRadius = 30.0;
  static const _btnHeight = 0.07;
  static const _btnText = 'Add';
  @override
  Widget build(BuildContext context) {
    final Size(:width, :height) = MediaQuery.sizeOf(context);
    return Scaffold(
      appBar: GlobalAppBar(titleText: 'Ads',),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: width * _pointZeroFivePercent,
          ),
          child: Column(
            children: [
              SizedBox(
                height: height * _pointZeroTwoPercent,
              ),

              //...................PRODUCT NAME TILE
              AdminAppCompactTextField(
                controller: TextEditingController(),
                hintText: 'Product name',
                validator: (value) {
                  return null;
                },
              ),
              SizedBox(
                height: height * _pointZeroOnePercent,
              ),

              //...................PRODUCT Category TILE
              AdminAppCompactTextField(
                  validator: (value) {
                    return null;
                  },
                  controller: TextEditingController(),
                  hintText: 'Category'),
              SizedBox(
                height: height * _pointZeroTwoPercent,
              ),

              //.......PRODUCT QAUNTITY TILE
              CustomFilledListTile(
                leading: Text('Quantity',
                    style: GoogleFonts.roboto(
                      fontSize: _fontSize,
                      color: AppColors.blackColor,
                    )),
                trailing: SizedBox(
                  width: width * _pointThreePercent,
                  child: const ListTileTrailingWidget(
                    quantity: '0',
                  ),
                ),
              ),
              SizedBox(
                height: height * _pointZeroOnePercent,
              ),

              //.......PRODUCT PRICE PER ITEM TILE
              CustomFilledListTile(
                leading: Text('Price per item',
                    style: GoogleFonts.roboto(
                      fontSize: _fontSize,
                      color: AppColors.blackColor,
                    )),
                trailing: SizedBox(
                  width: width * _pointThreePercent,
                  child: const ListTileTrailingWidget(
                    quantity: '\$0',
                  ),
                ),
              ),
              SizedBox(
                height: height * _pointZeroTwoPercent,
              ),

              //.....UPLAOD IMAGE TILE
              const UploadImageTile(),
              SizedBox(
                height: height * _pointTwoPercent,
              ),
              AppCompactBtn(
                onTap: () {
                  context.showPopUpMsg('Item added');
                  //showSnackBar(context, 'Item added');
                },
                borderRadius: _btnRadius,
                btnHeight: _btnHeight,
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
