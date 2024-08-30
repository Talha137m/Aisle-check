import 'package:aislecheck/core/constants/enumration/enumrations.dart';
import 'package:flutter/material.dart';

class PaymentOptionController extends ChangeNotifier {
  String selectPayment = PaymentMethod.momoPayment.name;
  void paymentOption(String value) {
    selectPayment = value;
    notifyListeners();
  }
}
