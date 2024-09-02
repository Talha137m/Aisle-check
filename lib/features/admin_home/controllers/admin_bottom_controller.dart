import 'package:flutter/material.dart';

class AdminBottomController extends ChangeNotifier {
  int currentIndex = 0;
  void changeState(int index) {
    currentIndex = index;
    notifyListeners();
  }
}
