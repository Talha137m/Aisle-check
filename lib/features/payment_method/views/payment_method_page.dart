import 'package:aislecheck/core/common/widgets/app_compat_btn.dart';
import 'package:aislecheck/core/common/widgets/global_app_bar.dart';
import 'package:aislecheck/core/constants/enumration/payment_method.dart';
import 'package:aislecheck/core/constants/images_path.dart';
import 'package:aislecheck/core/extensions/pop_up_messages.dart';
import 'package:aislecheck/features/ad_payment/views/widgets/ad_payment_widgets.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class PaymentMethodPage extends StatelessWidget {
  const PaymentMethodPage({super.key});
  static const pageName = '/payment_page';
  //.....CONATNT VALUES
  static const _title = 'Ads';
  static const _btnText = 'Confirm';
  static const _paymentText = 'payment methods';
  static const _momoPaymentText = 'MOMO payment';
  static const _payStackPaymentText = 'Paystack';
  static const _paypalPaymentText = 'Paypal';
  static const _masterPaymentText = '**** **** **** 1234';
  static const _visaPaymentText = '**** **** **** 1234';
  static const _btnHeight = 0.07;
  static const _btnRadius = 30.0;
  static const _tenFlexValue = 10;
  static const _fiveFlexValue = 5;
  static const _thirtyFlexValue = 30;
  static const double _symtricPadding = 15;
  @override
  Widget build(BuildContext context) {
    //final Size(:width, :height) = MediaQuery.sizeOf(context);
    return Scaffold(
      appBar: GlobalAppBar(
        titleText: _title,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Spacer(
            flex: _tenFlexValue,
          ),
          Align(
            alignment: const Alignment(-0.72, 0),
            child: Text(
              _paymentText,
              style: GoogleFonts.roboto(
                fontSize: 20,
                fontWeight: FontWeight.w700,
              ),
            ),
          ),
          const Spacer(
            flex: _tenFlexValue,
          ),
          //....MOMO PAYMENT TILE
          PaymentTile(
            symmetricPadding: _symtricPadding,
            nameToChoosePayment: PaymentMethod.momoPayment.name,
            cardImage: AdminImages.momoCard,
            paymentMethodName: _momoPaymentText,
          ),
          const Spacer(
            flex: _fiveFlexValue,
          ),
          //....paystack PAYMENT TILE
          PaymentTile(
            symmetricPadding: _symtricPadding,
            nameToChoosePayment: PaymentMethod.payStact.name,
            cardImage: AdminImages.paystackCard,
            paymentMethodName: _payStackPaymentText,
          ),
          const Spacer(
            flex: _fiveFlexValue,
          ),
          //....PAYPAL PAYMENT TILE
          PaymentTile(
            symmetricPadding: _symtricPadding,
            nameToChoosePayment: PaymentMethod.payPal.name,
            cardImage: AdminImages.paypalCard,
            paymentMethodName: _paypalPaymentText,
          ),
          const Spacer(
            flex: _fiveFlexValue,
          ),
          //....MASTER PAYMENT TILE
          PaymentTile(
            symmetricPadding: _symtricPadding,
            nameToChoosePayment: PaymentMethod.masterCard.name,
            cardImage: AdminImages.masterCard,
            paymentMethodName: _masterPaymentText,
          ),
          const Spacer(
            flex: _fiveFlexValue,
          ),
          //....VISA PAYMENT TILE
          PaymentTile(
            symmetricPadding: _symtricPadding,
            nameToChoosePayment: PaymentMethod.visaCard.name,
            cardImage: AdminImages.visaCard,
            paymentMethodName: _visaPaymentText,
          ),
          const Spacer(
            flex: _thirtyFlexValue,
          ),
          //.............CONFIRM BUTTON
          AppCompactBtn(
            onTap: () {
              context.showPopUpMsg('confirm tab');
            },
            btnHeight: _btnHeight,
            btnName: _btnText,
            borderRadius: _btnRadius,
          ),
          const Spacer(
            flex: _tenFlexValue,
          ),
        ],
      ),
    );
  }
}
