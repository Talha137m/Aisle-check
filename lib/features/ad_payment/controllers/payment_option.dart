import 'package:aislecheck/core/constants/enumration/payment_method.dart';
import 'package:flutter/material.dart';

class PaymentOptionController extends ChangeNotifier {
  String selectPayment = PaymentMethod.momoPayment.name;
  void paymentOption(String value) {
    selectPayment = value;
    notifyListeners();
  }
}
