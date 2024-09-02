import 'package:flutter/material.dart';

class UserBottomController extends ChangeNotifier {
  int currentIndex = 2;
  void changeState(int index) {
    currentIndex = index;
    notifyListeners();
  }
}

