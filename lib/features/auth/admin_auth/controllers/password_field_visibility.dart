import 'package:flutter/material.dart';

class PasswordFieldVisibility extends ChangeNotifier {
  bool obscureText = true;
  void obscureTextState(bool value) {
    obscureText = value;
    notifyListeners();
  }
}
