import 'package:aislecheck/config/navigation/routes.dart';
import 'package:aislecheck/core/constants/enumration/payment_method.dart';
import 'package:aislecheck/features/ad_payment/controllers/payment_option.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

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
      {super.key,
      required this.cardImage,
      required this.paymentMethodName,
      required this.nameToChoosePayment,
      this.symmetricPadding = 0});
  final String cardImage, paymentMethodName, nameToChoosePayment;
  final double symmetricPadding;
  //.....CONSTANT VALUES
  static const _pointZeroThreePercent = 0.03;
  static const _pointZeroFourPercent = 0.04;
  static const _pointZeroEightPercent = 0.08;
  static const _fontSize = 16.0;

  @override
  Widget build(BuildContext context) {
    context.watch<PaymentOptionController>();
    final Size(:width, :height) = MediaQuery.sizeOf(context);
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: symmetricPadding),
      child: RadioListTile<String>(
        shape: symmetricPadding == 0
            ? null
            : RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
                side: const BorderSide(color: Colors.grey, width: 1.2),
              ),
        activeColor: AppColors.greenColor,
        value: nameToChoosePayment,
        groupValue: context.read<PaymentOptionController>().selectPayment,
        onChanged: (value) {
          context
              .read<PaymentOptionController>()
              .paymentOption(value ?? PaymentMethod.momoPayment.name);
        },
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
      ),
    );
  }
}
