import 'package:aislecheck/core/common/widgets/app_compat_btn.dart';
import 'package:aislecheck/core/common/widgets/global_app_bar.dart';
import 'package:aislecheck/features/ad_payment/views/widgets/ad_payment_widgets.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../core/constants/images_path.dart';

class AdPaymentPage extends StatelessWidget {
  const AdPaymentPage({super.key});
  //.....PAGE NAME
  static const pageName = '/ad_payment_page';
  //.....CONATNT VALUES
  static const _title = 'Ads';
  static const _btnText = 'Confirm';
  static const _paymentText = 'Select a payment method :payment methods';
  static const _momoPaymentText = 'MOMO payment';
  static const _payStackPaymentText = 'Paystack';
  static const _paypalPaymentText = 'Paypal';
  static const _masterPaymentText = '**** **** **** 1234';
  static const _visaPaymentText = '**** **** **** 1234';
  static const _pointZeroTwoPercent = 0.02;
  static const _pointZeroTwoFivePercent = 0.025;
  static const _pointZeroThreePercent = 0.03;
  static const _pointZeroFivePercent = 0.05;
  static const _pointThreePercent = 0.3;
  static const _pointSixPercent = 0.6;
  static const _imageBorderRadius = 10.0;
  static const _btnHeight = 0.07;
  static const _btnRadius = 30.0;
  @override
  Widget build(BuildContext context) {
    final Size(:width, :height) = MediaQuery.sizeOf(context);
    return Scaffold(
      appBar: GlobalAppBar(titleText: _title),
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

              //................ AD IMAGE
              SizedBox(
                height: height * _pointThreePercent,
                width: width,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(
                    _imageBorderRadius,
                  ),
                  child: Image.asset(
                    AdminImages.cartAd,
                    fit: BoxFit.fill,
                  ),
                ),
              ),
              SizedBox(
                height: height * _pointZeroTwoPercent,
              ),

              //............ AD DESCRIPTION
              SizedBox(
                width: width * _pointSixPercent,
                child: Text(
                  'Lorem ispum is simply dummy text of',
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: GoogleFonts.roboto(
                    fontSize: 15,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
              SizedBox(
                height: height * _pointZeroTwoFivePercent,
              ),

              //...........BUDGET ROW
              const BudgetRow(budget: 15),
              SizedBox(
                height: height * _pointZeroThreePercent,
              ),

              //..........SELECT PAYMENT METHOD TEXT
              Text(
                _paymentText,
                style: GoogleFonts.roboto(
                    fontWeight: FontWeight.w600, fontSize: 15),
              ),
              SizedBox(
                height: height * _pointZeroTwoPercent,
              ),
              //....MOMO PAYMENT TILE
              const PaymentTile(
                cardImage: AdminImages.momoCard,
                paymentMethodName: _momoPaymentText,
              ),

              //....paystack PAYMENT TILE
              const PaymentTile(
                cardImage: AdminImages.paystackCard,
                paymentMethodName: _payStackPaymentText,
              ),

              //....PAYPAL PAYMENT TILE
              const PaymentTile(
                cardImage: AdminImages.paypalCard,
                paymentMethodName: _paypalPaymentText,
              ),

              //....MASTER PAYMENT TILE
              const PaymentTile(
                cardImage: AdminImages.masterCard,
                paymentMethodName: _masterPaymentText,
              ),

              //....VISA PAYMENT TILE
              const PaymentTile(
                cardImage: AdminImages.visaCard,
                paymentMethodName: _visaPaymentText,
              ),
              SizedBox(
                height: height * _pointZeroTwoPercent,
              ),

              //.............CONFIRM BUTTON
              AppCompactBtn(
                onTap: () {},
                btnHeight: _btnHeight,
                btnName: _btnText,
                borderRadius: _btnRadius,
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
