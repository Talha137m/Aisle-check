import 'dart:developer';

import 'package:aislecheck/config/navigation/routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';

class TimePickerController extends ChangeNotifier {
  //....create the sate of to get the time
  bool initialState = true;
  bool loadingState = false;
  bool loadedState = false;
  bool errorState = false;
  //........get the error message
  String errorMessage = 'Something went wrong';
  //........get the time
  String time = '';
  void getTime() async {
    try {
      initialState = false;
      loadingState = true;
      TimeOfDay? timeOfDay = await showTimePicker(
        context: NavigationState.navigatorKey.currentState!.context,
        initialTime: TimeOfDay.now(),
      );
      if (timeOfDay == null) {
        loadingState = false;
        errorState = true;
        errorMessage = 'No choose the time';
      } else {
        String formatedTime = timeOfDay
            // ignore: use_build_context_synchronously
            .format(NavigationState.navigatorKey.currentState!.context);
        time = formatedTime;
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
