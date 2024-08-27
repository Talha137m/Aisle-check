import 'package:flutter/material.dart';

class ChooseRoleController extends ChangeNotifier {
  bool adminRole = false;
  bool userRole = false;
  void chooseOption({bool? shopOwnerRole, bool? customerRole}) {
    adminRole = shopOwnerRole ?? false;
    userRole = customerRole ?? false;
    notifyListeners();
  }
}
