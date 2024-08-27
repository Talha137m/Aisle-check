import 'package:flutter/material.dart';

class DateController extends ChangeNotifier {
  //......create the sate
  DateTime selectedDay = DateTime.now();
  void onDateChange(DateTime dateTime) {
    selectedDay = dateTime;
    notifyListeners();
  }
}
