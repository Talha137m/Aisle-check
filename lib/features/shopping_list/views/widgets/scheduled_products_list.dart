import 'package:aislecheck/core/extensions/pop_up_messages.dart';

import 'package:aislecheck/features/shopping_list/models/scheduled_product.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../core/constants/strings/app_colors.dart';

class ScheduledProductsList extends StatelessWidget {
  const ScheduledProductsList({super.key, required this.scheduledProducts});
  final List<ScheduledProduct> scheduledProducts;
  //CONSTANT VALUES
  static const _padding = 0.01;
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: scheduledProducts.length,
      itemBuilder: (context, index) => Padding(
        padding: EdgeInsets.only(
          bottom: MediaQuery.sizeOf(context).height * _padding,
          top: MediaQuery.sizeOf(context).height * _padding,
        ),
        child: ShoppingItem(
          scheduledProduct: scheduledProducts[index],
          onDeleteIconTap: () {
            context.showPopUpMsg('delete');
          },
          onEditIconTap: () {
            context.showPopUpMsg('edited');
          },
        ),
      ),
    );
  }
}

class ShoppingItem extends StatelessWidget {
  const ShoppingItem(
      {super.key,
      required this.scheduledProduct,
      required this.onDeleteIconTap,
      required this.onEditIconTap});
  final ScheduledProduct scheduledProduct;
  final VoidCallback onDeleteIconTap, onEditIconTap;
  //...CONSTANT VALUES
  static const _priceText = 'Price : \$';
  static const _quantityText = 'Quantity : ';
  static const _containerWidth = 0.9;
  static const _containerHeight = 0.12;
  static const _contentPadding = 0.02;
  static const _itemFontSize = 0.023;
  static const _priceFontSize = 0.016;
  static const _quantityFontSize = 0.018;
  static const _iconSize = 0.03;
  //.....BOX DECORATION
  static const _borderRadius = 20.0;
  static const _blurRadius = 5.0;
  static const _spreadRadius = 3.0;
  static const _borderPadding = 0.015;
  static const _shadowOffset = Offset(1, 3);
  static const _imageRadius = 10.0;
  //...CONSTANT FLEX SIZES
  static const _flexOne = 1;
  static const _flexThree = 3;
  static const _flexFour = 4;
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
            boxShadow: const [
              BoxShadow(
                  color: Colors.black26,
                  blurRadius: _blurRadius,
                  spreadRadius: _spreadRadius,
                  offset: _shadowOffset),
            ]),
        child: Row(
          children: [
            //....PRODUCT IMAGE
            Expanded(
              flex: _flexOne,
              child: SizedBox.expand(
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(_imageRadius),
                  child: Image.asset(
                    scheduledProduct.image,
                    fit: BoxFit.fill,
                  ),
                ),
              ),
            ),
            Expanded(
              flex: _flexThree,
              child: Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: width * _contentPadding,
                ),
                child: Column(
                  children: [
                    Expanded(
                      flex: _flexFour,
                      child: Row(
                        children: [
                          Expanded(
                              flex: _flexOne,
                              child: Text(
                                scheduledProduct.productName,
                                style: GoogleFonts.roboto(
                                    fontSize: height * _itemFontSize,
                                    fontWeight: FontWeight.bold),
                              )),
                          Expanded(
                              flex: _flexOne,
                              child: Align(
                                alignment: Alignment.centerRight,
                                child: RichText(
                                  text: TextSpan(
                                    style: GoogleFonts.roboto(
                                      fontSize: height * _priceFontSize,
                                      color: AppColors.blackColor,
                                    ),
                                    children: [
                                      const TextSpan(text: _priceText),
                                      TextSpan(
                                          text: '${scheduledProduct.price}'),
                                    ],
                                  ),
                                ),
                              )),
                        ],
                      ),
                    ),
                    Expanded(
                      flex: _flexFour,
                      child: Row(
                        children: [
                          Expanded(
                            flex: _flexOne,
                            child: Align(
                              alignment: Alignment.centerLeft,
                              child: RichText(
                                text: TextSpan(
                                  style: TextStyle(
                                    color: AppColors.grayColor,
                                    fontSize: height * _quantityFontSize,
                                  ),
                                  children: [
                                    const TextSpan(text: _quantityText),
                                    TextSpan(
                                      text: '${scheduledProduct.quantity}',
                                    )
                                  ],
                                ),
                              ),
                            ),
                          ),
                          Expanded(
                              flex: _flexOne,
                              child: Align(
                                alignment: Alignment.centerRight,
                                child: Row(
                                  children: [
                                    Expanded(
                                      flex: _flexFour,
                                      child: Align(
                                          alignment: Alignment.centerRight,
                                          child: GestureDetector(
                                            onTap: onDeleteIconTap,
                                            child: Icon(
                                              Icons.delete_outline_outlined,
                                              size: height * _iconSize,
                                            ),
                                          )),
                                    ),
                                    Expanded(
                                      flex: _flexOne,
                                      child: GestureDetector(
                                        onTap: onEditIconTap,
                                        child: Icon(
                                          Icons.edit_square,
                                          size: height * _iconSize,
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                              )),
                        ],
                      ),
                    ),
                    const Spacer()
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
