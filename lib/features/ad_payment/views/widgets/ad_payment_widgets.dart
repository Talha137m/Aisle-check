import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../core/constants/strings/app_colors.dart';

//................BUDGET ROW
class BudgetRow extends StatelessWidget {
  const BudgetRow({super.key, required this.budget});
  final num budget;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Expanded(
          child: Text('Budget'),
        ),
        Text(
          '\$$budget',
          style: GoogleFonts.roboto(
            fontSize: 24,
            fontWeight: FontWeight.w700,
          ),
        ),
      ],
    );
  }
}

//...........PAYMENTS TILE
class PaymentTile extends StatelessWidget {
  const PaymentTile(
      {super.key, required this.cardImage, required this.paymentMethodName});
  final String cardImage, paymentMethodName;
  //.....CONSTANT VALUES
  static const _pointZeroThreePercent = 0.03;
  static const _pointZeroFourPercent = 0.04;
  static const _pointZeroEightPercent = 0.08;
  static const _fontSize = 16.0;
  @override
  Widget build(BuildContext context) {
    final Size(:width, :height) = MediaQuery.sizeOf(context);
    return ListTile(
      leading: const Icon(
        Icons.circle_outlined,
        color: AppColors.greenColor,
      ),
      title: Row(
        children: [
          SizedBox(
            width: width * _pointZeroThreePercent,
          ),
          SizedBox(
            width: width * _pointZeroEightPercent,
            height: height * _pointZeroFourPercent,
            child: Image.asset(
              cardImage,
              fit: BoxFit.fill,
            ),
          ),
          SizedBox(
            width: width * _pointZeroThreePercent,
          ),
          Text(
            paymentMethodName,
            style: GoogleFonts.roboto(
              fontWeight: FontWeight.w500,
              color: AppColors.blackColor,
              fontSize: _fontSize,
            ),
          ),
        ],
      ),
    );
  }
}
