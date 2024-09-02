import 'package:aislecheck/core/constants/enumration/enumrations.dart';
import 'package:flutter/material.dart';

class StatsController extends ChangeNotifier {
  String selectStats = StatsEnumuration.currentStats.name;
  void statsOption(String value) {
    selectStats = value;
    notifyListeners();
  }
}
