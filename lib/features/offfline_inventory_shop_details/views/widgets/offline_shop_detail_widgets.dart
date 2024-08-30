import 'package:aislecheck/core/common/widgets/app_compat_btn.dart';
import 'package:aislecheck/core/common/widgets/text_field_widget.dart';
import 'package:aislecheck/core/constants/strings/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ShopLocationText extends StatelessWidget {
  const ShopLocationText({super.key, required this.shopLocation});
  final String shopLocation;
  //.....CONSTANT VALUES
  static const _pointZeroTwoPercent = 0.02;
  static const _fontSizeFourteen = 13.0;
  @override
  Widget build(BuildContext context) {
    final Size(:width, :height) = MediaQuery.sizeOf(context);
    return Row(
      children: [
        Icon(
          Icons.map_rounded,
          size: height * _pointZeroTwoPercent,
        ),
        Expanded(
          child: Text(
            ' $shopLocation',
            style: GoogleFonts.roboto(
              fontSize: _fontSizeFourteen,
              fontWeight: FontWeight.w300,
              color: AppColors.grayColor,
            ),
          ),
        )
      ],
    );
  }
}

//.......Update Stock Dialog
class UpdateStockDialog extends StatelessWidget {
  const UpdateStockDialog({super.key});
  //.....CONSTANT VALUES
  static const _stockText = 'Stock update';
  static const _pointZeroOnePercent = 0.01;
  static const _pointZeroTwoPercent = 0.02;
  static const _pointZeroFourPercent = 0.04;
  static const _pointOnePercent = 0.1;
  static const _cardWidth = 0.8;
  static const _cardHeight = 0.4;
  static const _fontSizeSeventeen = 17.0;
  static const _btnRadius = 30.0;
  static const _btnText = 'Confirm';
  static const _btnHeight = 0.07;
  static const _btnWidth = 0.6;
  @override
  Widget build(BuildContext context) {
    final Size(:width, :height) = MediaQuery.sizeOf(context);
    return Center(
      child: SizedBox(
        width: width * _cardWidth,
        height: height * _cardHeight,
        child: Card(
          child: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(
                  height: height * _pointZeroTwoPercent,
                ),
                Text(
                  _stockText,
                  style: GoogleFonts.roboto(
                    color: AppColors.blackColor,
                    fontWeight: FontWeight.w700,
                    fontSize: _fontSizeSeventeen,
                  ),
                ),
                SizedBox(
                  height: height * _pointZeroFourPercent,
                ),
                SizedBox(
                  height: height * _pointOnePercent,
                  child: DialogsTextField(
                      hintAndLabelText: 'Product name',
                      keyboardType: TextInputType.text,
                      validator: (value) {
                        return null;
                      },
                      textEditingController: TextEditingController()),
                ),
                SizedBox(
                  height: height * _pointOnePercent,
                  child: DialogsTextField(
                      hintAndLabelText: '100',
                      keyboardType: TextInputType.number,
                      validator: (value) {
                        return null;
                      },
                      textEditingController: TextEditingController()),
                ),
                SizedBox(
                  height: height * _pointZeroOnePercent,
                ),
                AppCompactBtn(
                  onTap: () {},
                  borderRadius: _btnRadius,
                  btnWidth: _btnWidth,
                  btnHeight: _btnHeight,
                  btnName: _btnText,
                  isTextBold: true,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
