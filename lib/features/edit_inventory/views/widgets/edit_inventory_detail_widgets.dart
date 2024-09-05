import 'package:aislecheck/core/common/widgets/admin_lis_tile.dart';
import 'package:aislecheck/core/extensions/pop_up_messages.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../core/constants/strings/app_colors.dart';

class ProductNameAndEditRow extends StatelessWidget {
  const ProductNameAndEditRow({super.key, required this.productName});
  final String productName;
  //...CONSTANT VALUES
  static const _fontSize = 16.0;
  @override
  Widget build(BuildContext context) {
    final Size(:height) = MediaQuery.sizeOf(context);
    return Row(
      children: [
        Expanded(
          child: Text(
            productName,
            style: GoogleFonts.roboto(
              fontSize: _fontSize,
              color: AppColors.blackColor,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
        Icon(
          Icons.edit_square,
          color: AppColors.grayColor,
          size: height * 0.025,
        ),
      ],
    );
  }
}

//...LIST TILE TRAILING WIDGET
class ListTileTrailingWidget extends StatelessWidget {
  const ListTileTrailingWidget({super.key, required this.quantity});
  final String quantity;
  //...CONSTANT VALUES
  static const _fontSize = 16.0;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: GestureDetector(
            onTap: () {
              context.showPopUpMsg('Quantity Decrese');
            },
            child: const Icon(
              Icons.remove_circle_outline_outlined,
              color: AppColors.redColor,
            ),
          ),
        ),
        Expanded(
          child: Center(
            child: FittedBox(
              child: Text(
                quantity,
                style: GoogleFonts.roboto(
                  fontSize: _fontSize,
                  color: AppColors.blackColor,
                ),
              ),
            ),
          ),
        ),
        Expanded(
          child: GestureDetector(
            onTap: () {
              context.showPopUpMsg('Quantity Increase');
            },
            child: const Icon(
              Icons.add_circle_outline_rounded,
              color: AppColors.greenColor,
            ),
          ),
        ),
      ],
    );
  }
}


