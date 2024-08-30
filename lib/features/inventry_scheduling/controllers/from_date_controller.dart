import 'dart:developer';

import 'package:aislecheck/config/navigation/routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:intl/intl.dart';

class FromDateController extends ChangeNotifier {
  bool initialState = true;
  bool loadingState = false;
  bool loadedState = false;
  bool errorState = false;

  String errorMessage = 'Something Went wrong';
  String fromDate = 'From';

  void getFromDate() async {
    try {
      initialState = false;
      loadingState = true;
      DateTime? dateTime = await showDatePicker(
        context: NavigationState.navigatorKey.currentState!.context,
        firstDate: DateTime.now(),
        lastDate: DateTime(2050),
        initialDate: DateTime.now(),
      );
      if (dateTime == null) {
        loadingState = false;
        errorState = true;
        errorMessage = 'No choose the time';
      } else {
        String formatedTime = DateFormat('M/d/yyyy').format(dateTime);
        fromDate = formatedTime;
        loadingState = false;
        loadedState = true;
      }
    } catch (e) {
      loadingState = false;
      loadedState = false;
      errorState = true;

      log(e.toString());
    }
    SchedulerBinding.instance.addPostFrameCallback(
      (timeStamp) {
        notifyListeners();
      },
    );
  }
}
