import 'package:aislecheck/core/common/widgets/admin_lis_tile.dart';
import 'package:aislecheck/core/common/widgets/app_compat_btn.dart';
import 'package:aislecheck/core/common/widgets/global_app_bar.dart';
import 'package:aislecheck/core/common/widgets/text_field_widget.dart';
import 'package:aislecheck/core/extensions/pop_up_messages.dart';
import 'package:aislecheck/features/edit_inventory/views/widgets/edit_inventory_detail_widgets.dart';
import 'package:aislecheck/features/comapign_data_form/views/widgets/make_ad_widgets.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../core/constants/strings/app_colors.dart';

class CompaignDataFormPage extends StatelessWidget {
  const CompaignDataFormPage({super.key});
  //...PAGE NAME
  static const pageName = '/make_ad_page';
  //.....CONTANT VALUES
  static const _title = 'Ads';
  static const _titleHint = 'Title';
  static const _descpHint = 'Description';
  static const _audHint = 'Target Audience';
  static const _budgetHint = 'Budget';
  static const _linkHint = 'Link to the product';
  static const _btnText = 'Confirm';
  static const _pointZeroTwoPercent = 0.02;
  static const _pointZeroFivePercent = 0.05;
  static const _pointOnePercent = 0.1;
  static const _pointTwoPercent = 0.2;
  static const _pointThreePercent = 0.3;
  static const _fontSize = 13.0;
  static const _btnRadius = 30.0;
  static const _btnHeight = 0.08;
  @override
  Widget build(BuildContext context) {
    final Size(:width, :height) = MediaQuery.sizeOf(context);
    return Scaffold(
      appBar: GlobalAppBar(titleText: _title),
      body: SingleChildScrollView(
        child: Padding(
          padding:
              EdgeInsets.symmetric(horizontal: width * _pointZeroFivePercent),
          child: Column(
            children: [
              SizedBox(
                height: height * _pointZeroTwoPercent,
              ),

              //........TITEL TEXT FIELD
              AdminAppCompactTextField(
                controller: TextEditingController(),
                hintText: _titleHint,
                validator: (value) {
                  return null;
                },
              ),
              SizedBox(
                height: height * _pointZeroTwoPercent,
              ),

              //....DESCRIPTION TEXT FIELD
              AdminAppCompactTextField(
                controller: TextEditingController(),
                fieldHeight: _pointTwoPercent,
                textAlignment: TextAlignVertical.top,
                hintText: _descpHint,
                validator: (value) {
                  return null;
                },
                expands: true,
              ),
              SizedBox(
                height: height * _pointZeroTwoPercent,
              ),

              //.......TARGET AUDIENCE FIELD
              AdminAppCompactTextField(
                controller: TextEditingController(),
                hintText: _audHint,
                validator: (value) {
                  return null;
                },
                suffix: const Icon(
                  Icons.arrow_drop_down,
                  color: AppColors.blackColor,
                ),
              ),
              SizedBox(
                height: height * _pointZeroTwoPercent,
              ),

              //........BUDGET LIST TILE
              CustomFilledListTile(
                leading: Text(
                  _budgetHint,
                  style: GoogleFonts.roboto(
                    fontSize: _fontSize,
                    color: AppColors.blackColor,
                  ),
                ),
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

              //........ TO AND FROM FIELDS
              const ToAndFromFieldsRow(),
              SizedBox(
                height: height * _pointZeroTwoPercent,
              ),

              //..........LINK TEXT FIELD
              AdminAppCompactTextField(
                controller: TextEditingController(),
                hintText: _linkHint,
                validator: (value) {
                  return null;
                },
              ),
              SizedBox(
                height: height * _pointZeroTwoPercent,
              ),
              const UploadImageTile(),
              SizedBox(
                height: height * _pointZeroTwoPercent,
              ),
              AppCompactBtn(
                onTap: () {
                  context.showPopUpMsg('message');
                },
                btnHeight: _btnHeight,
                borderRadius: _btnRadius,
                btnName: _btnText,
                isTextBold: true,
              ),
              SizedBox(
                height: height * _pointZeroTwoPercent,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
